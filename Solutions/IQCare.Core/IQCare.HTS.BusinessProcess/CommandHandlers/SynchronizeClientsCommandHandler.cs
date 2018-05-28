﻿using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using IQCare.Common.BusinessProcess.Commands.Setup;
using IQCare.Common.BusinessProcess.Services;
using IQCare.Common.Core.Models;
using IQCare.Common.Infrastructure;
using IQCare.HTS.BusinessProcess.Commands;
using IQCare.HTS.BusinessProcess.Services;
using IQCare.HTS.Infrastructure;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Serilog;

namespace IQCare.HTS.BusinessProcess.CommandHandlers
{
    public class SynchronizeClientsCommandHandler : IRequestHandler<SynchronizeClientsCommand, Result<string>>
    {
        private readonly ICommonUnitOfWork _unitOfWork;
        private readonly IHTSUnitOfWork _htsUnitOfWork;
        public SynchronizeClientsCommandHandler(ICommonUnitOfWork unitOfWork, IHTSUnitOfWork htsUnitOfWork)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
            _htsUnitOfWork = htsUnitOfWork ?? throw new ArgumentNullException(nameof(htsUnitOfWork));
        }

        public async Task<Result<string>> Handle(SynchronizeClientsCommand request, CancellationToken cancellationToken)
        {
            string afyaMobileId = String.Empty;
            using (_htsUnitOfWork)
            using (_unitOfWork)
            {
                try
                {
                    var facilityId = request.MESSAGE_HEADER.SENDING_FACILITY;
                    RegisterPersonService registerPersonService = new RegisterPersonService(_unitOfWork);
                    EncounterTestingService encounterTestingService = new EncounterTestingService(_unitOfWork, _htsUnitOfWork);
                    for (int i = 0; i < request.CLIENTS.Count; i++)
                    {
                        string firstName = request.CLIENTS[i].PATIENT_IDENTIFICATION.PATIENT_NAME.FIRST_NAME;
                        string middleName = string.IsNullOrWhiteSpace(request.CLIENTS[i].PATIENT_IDENTIFICATION.PATIENT_NAME.MIDDLE_NAME)?"": request.CLIENTS[i].PATIENT_IDENTIFICATION.PATIENT_NAME.MIDDLE_NAME;
                        string lastName = request.CLIENTS[i].PATIENT_IDENTIFICATION.PATIENT_NAME.LAST_NAME;
                        int sex = request.CLIENTS[i].PATIENT_IDENTIFICATION.SEX;
                        DateTime dateOfBirth = DateTime.ParseExact(request.CLIENTS[i].PATIENT_IDENTIFICATION.DATE_OF_BIRTH, "yyyyMMdd", null);
                        DateTime dateEnrollment = DateTime.ParseExact(request.CLIENTS[i].PATIENT_IDENTIFICATION.REGISTRATION_DATE, "yyyyMMdd", null);
                        int maritalStatusId = request.CLIENTS[i].PATIENT_IDENTIFICATION.MARITAL_STATUS;
                        string landmark = request.CLIENTS[i].PATIENT_IDENTIFICATION.PATIENT_ADDRESS.PHYSICAL_ADDRESS
                            .LANDMARK;
                        string physicalAddress = request.CLIENTS[i].PATIENT_IDENTIFICATION.PATIENT_ADDRESS.POSTAL_ADDRESS;
                        string mobileNumber = request.CLIENTS[i].PATIENT_IDENTIFICATION.PHONE_NUMBER;
                        string enrollmentNo = string.Empty;
                        int userId = request.CLIENTS[i].PATIENT_IDENTIFICATION.USER_ID;

                        for (int j = 0; j < request.CLIENTS[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID.Count; j++)
                        {
                            if (request.CLIENTS[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j].ASSIGNING_AUTHORITY ==
                                "HTS" && request.CLIENTS[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j]
                                    .IDENTIFIER_TYPE == "HTS_SERIAL")
                            {
                                enrollmentNo = request.CLIENTS[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j].ID;
                            }

                            if (request.CLIENTS[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j].IDENTIFIER_TYPE ==
                                "AFYA_MOBILE_ID" &&
                                request.CLIENTS[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j].ASSIGNING_AUTHORITY ==
                                "AFYAMOBILE")
                            {
                                afyaMobileId = request.CLIENTS[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j].ID;
                            }
                        }

                        //check if person already exists
                        var identifiers = await registerPersonService.getPersonIdentifiers(afyaMobileId, 10);
                        if (identifiers.Count > 0)
                        {
                            var registeredPerson = await registerPersonService.GetPerson(identifiers[0].PersonId);
                            var updatedPerson = await registerPersonService.UpdatePerson(identifiers[0].PersonId, firstName, middleName, lastName, sex, dateOfBirth);
                            var patient = await registerPersonService.GetPatientByPersonId(identifiers[0].PersonId);
                            var updatedPatient = await registerPersonService.UpdatePatient(patient.Id, dateOfBirth, facilityId);
                            var updatedPersonPopulations = await registerPersonService.UpdatePersonPopulation(identifiers[0].PersonId,
                                request.CLIENTS[i].PATIENT_IDENTIFICATION.KEY_POP, userId);
                            if (!string.IsNullOrWhiteSpace(landmark))
                            {
                                var updatedLocation = await registerPersonService.UpdatePersonLocation(identifiers[0].PersonId, landmark);
                            }

                            if (!string.IsNullOrWhiteSpace(mobileNumber) || !string.IsNullOrWhiteSpace(physicalAddress))
                            {
                                //add Person Contact
                                var personContact =
                                    await registerPersonService.UpdatePersonContact(identifiers[0].PersonId,
                                        physicalAddress, mobileNumber);
                            }

                            /**
                             * Encounter
                             * 
                             */

                            if (request.CLIENTS[i].ENCOUNTER != null)
                            {
                                if (request.CLIENTS[i].ENCOUNTER.PRE_TEST != null)
                                {
                                    DateTime encounterDate = DateTime.ParseExact(request.CLIENTS[i].ENCOUNTER.PRE_TEST.ENCOUNTER_DATE, "yyyyMMdd", null);
                                    var emrEncounterTypes = await _unitOfWork.Repository<LookupItemView>()
                                        .Get(x => x.MasterName == "EncounterType" && x.ItemName == "Hts-encounter")
                                        .FirstOrDefaultAsync();

                                    int encounterTypeId = emrEncounterTypes.ItemId;

                                    //Get consent to testing
                                    int consentValue = request.CLIENTS[i].ENCOUNTER.PRE_TEST.CONSENT;
                                    var consentType = await _unitOfWork.Repository<LookupItemView>().Get(x => x.MasterName == "ConsentType" && x.ItemName == "ConsentToBeTested").FirstOrDefaultAsync();
                                    int consentTypeId = consentType != null ? consentType.ItemId : 0;

                                    //Get TBStatus masterId
                                    var screeningType = await _unitOfWork.Repository<LookupItemView>().Get(x => x.MasterName == "TbScreening").FirstOrDefaultAsync();
                                    int screeningTypeId = screeningType != null ? screeningType.MasterId : 0;
                                    int tbStatus = request.CLIENTS[i].ENCOUNTER.PRE_TEST.TB_SCREENING;

                                    //Get Consent to screen partners itemId
                                    var consentPartnerType = await _unitOfWork.Repository<LookupItemView>()
                                        .Get(x => x.MasterName == "ConsentType" && x.ItemName == "ConsentToListPartners")
                                        .FirstOrDefaultAsync();
                                    int consentListPartnersTypeId = consentPartnerType != null ? consentPartnerType.ItemId : 0;

                                    string htsEncounterRemarks = request.CLIENTS[i].ENCOUNTER.PRE_TEST.REMARKS;
                                    int clientEverTested = request.CLIENTS[i].ENCOUNTER.PRE_TEST.EVER_TESTED;
                                    int clientEverSelfTested = request.CLIENTS[i].ENCOUNTER.PRE_TEST.SELF_TEST_12_MONTHS;
                                    int testEntryPoint = request.CLIENTS[i].ENCOUNTER.PRE_TEST.SERVICE_POINT;
                                    int htsencounterType = request.CLIENTS[i].ENCOUNTER.PRE_TEST.ENCOUNTER_TYPE;
                                    int testingStrategy = request.CLIENTS[i].ENCOUNTER.PRE_TEST.STRATEGY;
                                    int clientTestedAs = request.CLIENTS[i].ENCOUNTER.PRE_TEST.TESTED_AS;
                                    int monthsSinceLastTest = request.CLIENTS[i].ENCOUNTER.PRE_TEST.MONTHS_SINCE_LAST_TEST;
                                    List<int> clientDisabilities = request.CLIENTS[i].ENCOUNTER.PRE_TEST.DISABILITIES;
                                    int providerId = request.CLIENTS[i].ENCOUNTER.PLACER_DETAIL.PROVIDER_ID;
                                    string encounterNumber = request.CLIENTS[i].ENCOUNTER.PLACER_DETAIL.ENCOUNTER_NUMBER;


                                    var resultPlacerGet = await registerPersonService.GetInteropPlacerValue(7, 4, encounterNumber);
                                    if (resultPlacerGet.Count > 0)
                                    {
                                        var getHtsEncounter = await encounterTestingService.GetHtsEncounter(resultPlacerGet[0].EntityId);
                                        var getPatientEncounter = await encounterTestingService.GetPatientEncounterById(getHtsEncounter.PatientEncounterID);

                                        getHtsEncounter.EverTested = clientEverTested;
                                        getHtsEncounter.MonthsSinceLastTest = monthsSinceLastTest;
                                        getHtsEncounter.MonthSinceSelfTest = null;
                                        getHtsEncounter.TestedAs = clientTestedAs;
                                        getHtsEncounter.TestingStrategy = testingStrategy;
                                        getHtsEncounter.EncounterRemarks = htsEncounterRemarks;
                                        //getHtsEncounter.FinalResultGiven = ;
                                        //getHtsEncounter.CoupleDiscordant = 1;
                                        getHtsEncounter.TestEntryPoint = testEntryPoint;
                                        getHtsEncounter.EverSelfTested = clientEverSelfTested;
                                        getHtsEncounter.EncounterType = htsencounterType;

                                        await encounterTestingService.UpdateHtsEncounter(getHtsEncounter);

                                        var getPatientScreenings = await encounterTestingService.GetPatientScreening(patient.Id, getPatientEncounter.PatientMasterVisitId, screeningTypeId, null);
                                        if (getPatientScreenings.Count > 0)
                                        {
                                            getPatientScreenings[0].ScreeningValueId = tbStatus;
                                            await encounterTestingService.UpdatePatientScreening(getPatientScreenings[0]);
                                        }
                                        else
                                        {
                                            //add patient screening
                                            var patientScreening = await encounterTestingService.addPatientScreening(patient.Id,
                                                getPatientEncounter.PatientMasterVisitId, screeningTypeId, encounterDate, tbStatus, providerId);
                                        }

                                        await encounterTestingService.UpdateClientDisabilities(identifiers[0].PersonId, clientDisabilities, getPatientEncounter.Id, providerId);

                                        //check for hiv tests
                                        if (request.CLIENTS[i].ENCOUNTER.HIV_TESTS != null)
                                        {
                                            int pnsAccepted = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.PNS_ACCEPTED;
                                            int pnsDeclineReason = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.PNS_DECLINE_REASON;
                                            List<NewTests> screeningTests = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SCREENING;
                                            List<NewTests> confirmatoryTests = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.CONFIRMATORY;
                                            int coupleDiscordant = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.COUPLE_DISCORDANT;
                                            int finalResultGiven = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.FINAL_RESULT_GIVEN;
                                            int roundOneTestResult = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.SCREENING_RESULT;
                                            int? roundTwoTestResult = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.CONFIRMATORY_RESULT;
                                            int? finalResult = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.FINAL_RESULT;

                                            var getPatientConsents = await encounterTestingService.GetPatientConsent(patient.Id, getPatientEncounter.PatientMasterVisitId, 2, consentListPartnersTypeId);

                                            if (getPatientConsents.Count > 0)
                                            {
                                                getPatientConsents[0].ConsentValue = pnsAccepted;
                                                getPatientConsents[0].ConsentDate = encounterDate;
                                                getPatientConsents[0].DeclineReason = pnsDeclineReason;

                                                await encounterTestingService.UpdatePatientConsent(getPatientConsents[0]);
                                            }
                                            else
                                            {
                                                //add consent to list partners
                                                var partnersConsent = await encounterTestingService.addPatientConsent(patient.Id,
                                                    getPatientEncounter.PatientMasterVisitId, 2, pnsAccepted, consentListPartnersTypeId, encounterDate, providerId,
                                                    pnsDeclineReason);
                                            }

                                            //Screening Tests
                                            var updatedScreeningTests = await encounterTestingService.UpdateTesting(getHtsEncounter.Id, screeningTests, providerId, 1);
                                            //Confirmatory Tests
                                            var updatedConfirmatoryTests = await encounterTestingService.UpdateTesting(getHtsEncounter.Id, confirmatoryTests, providerId, 2);

                                            getHtsEncounter.CoupleDiscordant = coupleDiscordant;
                                            getHtsEncounter.FinalResultGiven = finalResultGiven;

                                            await encounterTestingService.updateHtsEncounter(getHtsEncounter.Id, getHtsEncounter);
                                            var getHtsEncounterResults = await encounterTestingService.GetHtsEncounterResultByEncounterId(getHtsEncounter.Id);
                                            if (getHtsEncounterResults.Count > 0)
                                            {
                                                getHtsEncounterResults[0].RoundOneTestResult = roundOneTestResult;
                                                getHtsEncounterResults[0].RoundTwoTestResult = roundTwoTestResult;
                                                getHtsEncounterResults[0].FinalResult = finalResult;

                                                var updatedHtsEncounterResult = await encounterTestingService.UpdateHtsEncounterResult(getHtsEncounterResults[0]);
                                            }
                                            else
                                            {
                                                var htsEncounterResult = await encounterTestingService.addHtsEncounterResult(getHtsEncounter.Id, roundOneTestResult, roundTwoTestResult, finalResult);
                                            }

                                            //Tracing
                                            var enrollmentTracing = await _unitOfWork.Repository<LookupItemView>()
                                                .Get(x => x.MasterName == "TracingType" && x.ItemName == "Enrolment").FirstOrDefaultAsync();
                                            int tracingType = enrollmentTracing.ItemId;
                                            string tracingRemarks = String.Empty;

                                            for (int j = 0; request.CLIENTS[i].ENCOUNTER.TRACING != null && j < request.CLIENTS[i].ENCOUNTER.TRACING.Count; j++)
                                            {
                                                DateTime tracingDate = DateTime.ParseExact(request.CLIENTS[i].ENCOUNTER.TRACING[j].TRACING_DATE, "yyyyMMdd", null);
                                                int mode = request.CLIENTS[i].ENCOUNTER.TRACING[j].TRACING_MODE;
                                                int outcome = request.CLIENTS[i].ENCOUNTER.TRACING[j].TRACING_OUTCOME;

                                                //add Client Tracing
                                                var clientTracing = await encounterTestingService.addTracing(identifiers[0].PersonId, tracingType, tracingDate, mode, outcome,
                                                    providerId, tracingRemarks, null, null, null);
                                            }

                                            //check for linkage
                                            if (request.CLIENTS[i].ENCOUNTER.LINKAGE != null)
                                            {
                                                DateTime dateLinkageEnrolled = DateTime.ParseExact(request.CLIENTS[i].ENCOUNTER.LINKAGE.DATE_ENROLLED, "yyyyMMdd", null);
                                                string linkageCCCNumber = request.CLIENTS[i].ENCOUNTER.LINKAGE.CCC_NUMBER;
                                                string linkageFacility = request.CLIENTS[i].ENCOUNTER.LINKAGE.FACILITY;
                                                string healthWorker = request.CLIENTS[i].ENCOUNTER.LINKAGE.HEALTH_WORKER;
                                                string carde = request.CLIENTS[i].ENCOUNTER.LINKAGE.CARDE;

                                                //add Client Linkage
                                                var clientLinkage = await encounterTestingService.addLinkage(identifiers[0].PersonId, dateLinkageEnrolled,
                                                    linkageCCCNumber, linkageFacility, providerId, healthWorker, carde);
                                            }
                                        }
                                    }
                                    else
                                    {
                                        //add patient master visit
                                        var patientMasterVisit = await encounterTestingService.AddPatientMasterVisit(patient.Id, 2, encounterDate, providerId);
                                        //add patient encounter
                                        var patientEncounter = await encounterTestingService.AddPatientEncounter(patient.Id,
                                            encounterTypeId, patientMasterVisit.Id, encounterDate, 2, providerId);
                                        //add patient consent
                                        var consent = await encounterTestingService.addPatientConsent(patient.Id, patientMasterVisit.Id,
                                            2, consentValue, consentTypeId, encounterDate, providerId, null);
                                        //add patient screening
                                        var patientScreening = await encounterTestingService.addPatientScreening(patient.Id,
                                            patientMasterVisit.Id, screeningTypeId, encounterDate, tbStatus, providerId);
                                        //add patient encounter
                                        var htsEncounter = await encounterTestingService.addHtsEncounter(htsEncounterRemarks,
                                            clientEverSelfTested, clientEverTested, null,
                                            patientEncounter.Id, identifiers[0].PersonId, providerId, testEntryPoint, htsencounterType,
                                            testingStrategy, clientTestedAs, monthsSinceLastTest, null);
                                        //add disabilities
                                        var disabilities = await encounterTestingService.addDisabilities(clientDisabilities,
                                            patientEncounter.Id, identifiers[0].PersonId, providerId);
                                        //add afya mobile placer value
                                        var addplacerHtsPlacer = await registerPersonService.AddInteropPlacerValue(htsEncounter.Id, 4, 7, encounterNumber);

                                        //check for hiv tests
                                        if (request.CLIENTS[i].ENCOUNTER.HIV_TESTS != null)
                                        {
                                            int pnsAccepted = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.PNS_ACCEPTED;
                                            int pnsDeclineReason = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.PNS_DECLINE_REASON;
                                            List<NewTests> screeningTests = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SCREENING;
                                            List<NewTests> confirmatoryTests = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.CONFIRMATORY;
                                            int coupleDiscordant = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.COUPLE_DISCORDANT;
                                            int finalResultGiven = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.FINAL_RESULT_GIVEN;
                                            int roundOneTestResult = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.SCREENING_RESULT;
                                            int? roundTwoTestResult = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.CONFIRMATORY_RESULT;
                                            int? finalResult = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.FINAL_RESULT;


                                            //add consent to list partners
                                            var partnersConsent = await encounterTestingService.addPatientConsent(patient.Id,
                                                patientMasterVisit.Id, 2, pnsAccepted, consentListPartnersTypeId, encounterDate, providerId,
                                                pnsDeclineReason);

                                            //add screening tests for client
                                            var clientScreeningTesting =
                                                await encounterTestingService.addTesting(screeningTests, htsEncounter.Id, providerId);

                                            //add confirmatory tests for client
                                            var clientConfirmatoryTesting = await encounterTestingService.addTesting(confirmatoryTests, htsEncounter.Id, providerId);

                                            //update testing for client
                                            htsEncounter.CoupleDiscordant = coupleDiscordant;
                                            htsEncounter.FinalResultGiven = finalResultGiven;

                                            await encounterTestingService.updateHtsEncounter(htsEncounter.Id, htsEncounter);
                                            var htsEncounterResult = await encounterTestingService.addHtsEncounterResult(htsEncounter.Id, roundOneTestResult, roundTwoTestResult, finalResult);
                                        }


                                        //Tracing
                                        var enrollmentTracing = await _unitOfWork.Repository<LookupItemView>()
                                            .Get(x => x.MasterName == "TracingType" && x.ItemName == "Enrolment").FirstOrDefaultAsync();
                                        int tracingType = enrollmentTracing.ItemId;
                                        string tracingRemarks = String.Empty;

                                        for (int j = 0; request.CLIENTS[i].ENCOUNTER.TRACING != null && j < request.CLIENTS[i].ENCOUNTER.TRACING.Count; j++)
                                        {
                                            DateTime tracingDate = DateTime.ParseExact(request.CLIENTS[i].ENCOUNTER.TRACING[j].TRACING_DATE, "yyyyMMdd", null);
                                            int mode = request.CLIENTS[i].ENCOUNTER.TRACING[j].TRACING_MODE;
                                            int outcome = request.CLIENTS[i].ENCOUNTER.TRACING[j].TRACING_OUTCOME;

                                            //add Client Tracing
                                            var clientTracing = await encounterTestingService.addTracing(identifiers[0].PersonId, tracingType, tracingDate, mode, outcome,
                                                providerId, tracingRemarks, null, null, null);
                                        }

                                        //check for linkage
                                        if (request.CLIENTS[i].ENCOUNTER.LINKAGE != null)
                                        {
                                            DateTime dateLinkageEnrolled = DateTime.ParseExact(request.CLIENTS[i].ENCOUNTER.LINKAGE.DATE_ENROLLED, "yyyyMMdd", null);
                                            string linkageCCCNumber = request.CLIENTS[i].ENCOUNTER.LINKAGE.CCC_NUMBER;
                                            string linkageFacility = request.CLIENTS[i].ENCOUNTER.LINKAGE.FACILITY;
                                            string healthWorker = request.CLIENTS[i].ENCOUNTER.LINKAGE.HEALTH_WORKER;
                                            string carde = request.CLIENTS[i].ENCOUNTER.LINKAGE.CARDE;

                                            //add Client Linkage
                                            var clientLinkage = await encounterTestingService.addLinkage(identifiers[0].PersonId, dateLinkageEnrolled,
                                                linkageCCCNumber, linkageFacility, providerId, healthWorker, carde);
                                        }

                                        //add referral
                                        /*await encounterTestingService.addReferral(person.Id, fromFacilityId: 1, serviceAreaId: 1,
                                            referralReason: 1, referredTo: 1, userId: 1, dateToBeEnrolled: DateTime.Now);*/
                                    }
                                }
                            }
                        }
                        else
                        {
                            // Add Person
                            var person = await registerPersonService.RegisterPerson(firstName, middleName, lastName, sex,
                                dateOfBirth, userId);
                            // Add Patient
                            var patient = await registerPersonService.AddPatient(person.Id, userId, facilityId);
                            // Enroll patient
                            var patientIdentifier = await registerPersonService.EnrollPatient(enrollmentNo, patient.Id, 2, userId, dateEnrollment);
                            //Add PersonIdentifiers
                            var personIdentifier = await registerPersonService.addPersonIdentifiers(person.Id, 10, afyaMobileId, userId);
                            // Add Marital Status
                            var maritalStatus = await registerPersonService.AddMaritalStatus(person.Id, maritalStatusId, userId);
                            // Add Person Key pop
                            var population = await registerPersonService.addPersonPopulation(person.Id,
                                request.CLIENTS[i].PATIENT_IDENTIFICATION.KEY_POP, userId);
                            // Add Person Location
                            if (!string.IsNullOrWhiteSpace(landmark))
                            {
                                var personLocation = await registerPersonService.addPersonLocation(person.Id, 0, 0, 0, "", landmark, userId);
                            }

                            if (!string.IsNullOrWhiteSpace(mobileNumber) || !string.IsNullOrWhiteSpace(physicalAddress))
                            {
                                //add Person Contact
                                var personContact = await registerPersonService.addPersonContact(person.Id, physicalAddress,
                                mobileNumber, string.Empty, string.Empty, userId);
                            }
                            
                            /***
                             * Encounter
                             */

                            if (request.CLIENTS[i].ENCOUNTER != null)
                            {
                                if (request.CLIENTS[i].ENCOUNTER.PRE_TEST != null)
                                {
                                    DateTime encounterDate = DateTime.ParseExact(request.CLIENTS[i].ENCOUNTER.PRE_TEST.ENCOUNTER_DATE, "yyyyMMdd", null);
                                    var emrEncounterTypes = await _unitOfWork.Repository<LookupItemView>()
                                        .Get(x => x.MasterName == "EncounterType" && x.ItemName == "Hts-encounter")
                                        .FirstOrDefaultAsync();

                                    int encounterTypeId = emrEncounterTypes.ItemId;

                                    //Get consent to testing
                                    int consentValue = request.CLIENTS[i].ENCOUNTER.PRE_TEST.CONSENT;
                                    var consentType = await _unitOfWork.Repository<LookupItemView>().Get(x => x.MasterName == "ConsentType" && x.ItemName == "ConsentToBeTested").FirstOrDefaultAsync();
                                    int consentTypeId = consentType != null ? consentType.ItemId : 0;

                                    //Get TBStatus masterId
                                    var screeningType = await _unitOfWork.Repository<LookupItemView>().Get(x => x.MasterName == "TbScreening").FirstOrDefaultAsync();
                                    int screeningTypeId = screeningType != null ? screeningType.MasterId : 0;
                                    int tbStatus = request.CLIENTS[i].ENCOUNTER.PRE_TEST.TB_SCREENING;

                                    //Get Consent to screen partners itemId
                                    var consentPartnerType = await _unitOfWork.Repository<LookupItemView>()
                                        .Get(x => x.MasterName == "ConsentType" && x.ItemName == "ConsentToListPartners")
                                        .FirstOrDefaultAsync();
                                    int consentListPartnersTypeId = consentPartnerType != null ? consentPartnerType.ItemId : 0;

                                    string htsEncounterRemarks = request.CLIENTS[i].ENCOUNTER.PRE_TEST.REMARKS;
                                    int clientEverTested = request.CLIENTS[i].ENCOUNTER.PRE_TEST.EVER_TESTED;
                                    int clientEverSelfTested = request.CLIENTS[i].ENCOUNTER.PRE_TEST.SELF_TEST_12_MONTHS;
                                    int testEntryPoint = request.CLIENTS[i].ENCOUNTER.PRE_TEST.SERVICE_POINT;
                                    int htsencounterType = request.CLIENTS[i].ENCOUNTER.PRE_TEST.ENCOUNTER_TYPE;
                                    int testingStrategy = request.CLIENTS[i].ENCOUNTER.PRE_TEST.STRATEGY;
                                    int clientTestedAs = request.CLIENTS[i].ENCOUNTER.PRE_TEST.TESTED_AS;
                                    int monthsSinceLastTest = request.CLIENTS[i].ENCOUNTER.PRE_TEST.MONTHS_SINCE_LAST_TEST;
                                    List<int> clientDisabilities = request.CLIENTS[i].ENCOUNTER.PRE_TEST.DISABILITIES;
                                    int providerId = request.CLIENTS[i].ENCOUNTER.PLACER_DETAIL.PROVIDER_ID;
                                    string encounterNumber = request.CLIENTS[i].ENCOUNTER.PLACER_DETAIL.ENCOUNTER_NUMBER;

                                    //add patient master visit
                                    var patientMasterVisit = await encounterTestingService.AddPatientMasterVisit(patient.Id, 2, encounterDate, providerId);
                                    //add patient encounter
                                    var patientEncounter = await encounterTestingService.AddPatientEncounter(patient.Id,
                                        encounterTypeId, patientMasterVisit.Id, encounterDate, 2, providerId);
                                    //add patient consent
                                    var consent = await encounterTestingService.addPatientConsent(patient.Id, patientMasterVisit.Id,
                                        2, consentValue, consentTypeId, encounterDate, providerId, null);
                                    //add patient screening
                                    var patientScreening = await encounterTestingService.addPatientScreening(patient.Id,
                                        patientMasterVisit.Id, screeningTypeId, encounterDate, tbStatus, providerId);
                                    //add patient encounter
                                    var htsEncounter = await encounterTestingService.addHtsEncounter(htsEncounterRemarks,
                                        clientEverSelfTested, clientEverTested, null,
                                        patientEncounter.Id, person.Id, providerId, testEntryPoint, htsencounterType,
                                        testingStrategy, clientTestedAs, monthsSinceLastTest, null);
                                    //add disabilities
                                    var disabilities = await encounterTestingService.addDisabilities(clientDisabilities,
                                        patientEncounter.Id, person.Id, providerId);
                                    //add afya mobile placer value
                                    var addplacerHtsPlacer = await registerPersonService.AddInteropPlacerValue(htsEncounter.Id, 4, 7, encounterNumber);

                                    //check for hiv tests
                                    if (request.CLIENTS[i].ENCOUNTER.HIV_TESTS != null)
                                    {
                                        int pnsAccepted = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.PNS_ACCEPTED;
                                        int pnsDeclineReason = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.PNS_DECLINE_REASON;
                                        List<NewTests> screeningTests = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SCREENING;
                                        List<NewTests> confirmatoryTests = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.CONFIRMATORY;
                                        int coupleDiscordant = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.COUPLE_DISCORDANT;
                                        int finalResultGiven = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.FINAL_RESULT_GIVEN;
                                        int roundOneTestResult = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.SCREENING_RESULT;
                                        int? roundTwoTestResult = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.CONFIRMATORY_RESULT;
                                        int? finalResult = request.CLIENTS[i].ENCOUNTER.HIV_TESTS.SUMMARY.FINAL_RESULT;


                                        //add consent to list partners
                                        var partnersConsent = await encounterTestingService.addPatientConsent(patient.Id,
                                            patientMasterVisit.Id, 2, pnsAccepted, consentListPartnersTypeId, encounterDate, providerId,
                                            pnsDeclineReason);

                                        //add screening tests for client
                                        var clientScreeningTesting =
                                            await encounterTestingService.addTesting(screeningTests, htsEncounter.Id, providerId);

                                        //add confirmatory tests for client
                                        var clientConfirmatoryTesting = await encounterTestingService.addTesting(confirmatoryTests, htsEncounter.Id, providerId);

                                        //update testing for client
                                        htsEncounter.CoupleDiscordant = coupleDiscordant;
                                        htsEncounter.FinalResultGiven = finalResultGiven;

                                        await encounterTestingService.updateHtsEncounter(htsEncounter.Id, htsEncounter);
                                        var htsEncounterResult = await encounterTestingService.addHtsEncounterResult(htsEncounter.Id, roundOneTestResult, roundTwoTestResult, finalResult);
                                    }

                                    //Tracing
                                    var enrollmentTracing = await _unitOfWork.Repository<LookupItemView>()
                                        .Get(x => x.MasterName == "TracingType" && x.ItemName == "Enrolment").FirstOrDefaultAsync();
                                    int tracingType = enrollmentTracing.ItemId;
                                    string tracingRemarks = String.Empty;

                                    for (int j = 0; request.CLIENTS[i].ENCOUNTER.TRACING != null && j < request.CLIENTS[i].ENCOUNTER.TRACING.Count; j++)
                                    {
                                        DateTime tracingDate = DateTime.ParseExact(request.CLIENTS[i].ENCOUNTER.TRACING[j].TRACING_DATE, "yyyyMMdd", null);
                                        int mode = request.CLIENTS[i].ENCOUNTER.TRACING[j].TRACING_MODE;
                                        int outcome = request.CLIENTS[i].ENCOUNTER.TRACING[j].TRACING_OUTCOME;

                                        //add Client Tracing
                                        var clientTracing = await encounterTestingService.addTracing(person.Id, tracingType, tracingDate, mode, outcome,
                                            providerId, tracingRemarks, null, null, null);
                                    }

                                    //check for linkage
                                    if (request.CLIENTS[i].ENCOUNTER.LINKAGE != null)
                                    {
                                        DateTime dateLinkageEnrolled = DateTime.ParseExact(request.CLIENTS[i].ENCOUNTER.LINKAGE.DATE_ENROLLED, "yyyyMMdd", null);
                                        string linkageCCCNumber = request.CLIENTS[i].ENCOUNTER.LINKAGE.CCC_NUMBER;
                                        string linkageFacility = request.CLIENTS[i].ENCOUNTER.LINKAGE.FACILITY;
                                        string healthWorker = request.CLIENTS[i].ENCOUNTER.LINKAGE.HEALTH_WORKER;
                                        string carde = request.CLIENTS[i].ENCOUNTER.LINKAGE.CARDE;

                                        //add Client Linkage
                                        var clientLinkage = await encounterTestingService.addLinkage(person.Id, dateLinkageEnrolled,
                                            linkageCCCNumber, linkageFacility, providerId, healthWorker, carde);
                                    }

                                    //add referral
                                    /*await encounterTestingService.addReferral(person.Id, fromFacilityId: 1, serviceAreaId: 1,
                                        referralReason: 1, referredTo: 1, userId: 1, dateToBeEnrolled: DateTime.Now);*/
                                }
                            }
                        }
                    }

                    return Result<string>.Valid(afyaMobileId);
                }
                catch (Exception e)
                {
                    Log.Error(e.Message);
                    return Result<string>.Invalid(e.Message);
                }
            }
        }
    }
}