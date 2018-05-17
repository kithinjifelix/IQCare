﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using IQCare.Common.BusinessProcess.Commands.Encounter;
using IQCare.Common.BusinessProcess.Services;
using IQCare.Common.Core.Models;
using IQCare.Common.Infrastructure;
using IQCare.HTS.BusinessProcess.Commands;
using IQCare.HTS.BusinessProcess.Services;
using IQCare.HTS.Infrastructure;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace IQCare.HTS.BusinessProcess.CommandHandlers
{
    public class SynchronizeFamilyCommandHandler : IRequestHandler<SynchronizeFamilyCommand, Result<string>>
    {
        private readonly ICommonUnitOfWork _unitOfWork;
        private readonly IHTSUnitOfWork _htsUnitOfWork;

        public SynchronizeFamilyCommandHandler(ICommonUnitOfWork commonUnitOfWork, IHTSUnitOfWork htsUnitOfWork)
        {
            _unitOfWork = commonUnitOfWork ?? throw new ArgumentNullException(nameof(commonUnitOfWork));
            _htsUnitOfWork = htsUnitOfWork ?? throw new ArgumentNullException(nameof(htsUnitOfWork));
        }

        public async Task<Result<string>> Handle(SynchronizeFamilyCommand request, CancellationToken cancellationToken)
        {
            using (_htsUnitOfWork)
            using (_unitOfWork)
            {
                try
                {
                    string afyaMobileId = string.Empty;
                    string indexClientAfyaMobileId = string.Empty;

                    RegisterPersonService registerPersonService = new RegisterPersonService(_unitOfWork);
                    EncounterTestingService encounterTestingService = new EncounterTestingService(_unitOfWork, _htsUnitOfWork);

                    var facilityId = request.MESSAGE_HEADER.SENDING_FACILITY;

                    for (int i = 0; i < request.FAMILY.Count; i++)
                    {
                        

                        for (int j = 0; j < request.FAMILY[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID.Count; j++)
                        {
                            if (request.FAMILY[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j].IDENTIFIER_TYPE ==
                                "AFYA_MOBILE_ID")
                            {
                                afyaMobileId = request.FAMILY[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j].ID;
                            }

                            if (request.FAMILY[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j].IDENTIFIER_TYPE ==
                                "INDEX_CLIENT_AFYAMOBILE_ID")
                            {
                                indexClientAfyaMobileId =
                                    request.FAMILY[i].PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID[j].ID;
                            }
                        }

                        string firstName = request.FAMILY[i].PATIENT_IDENTIFICATION.PATIENT_NAME.FIRST_NAME;
                        string middleName = request.FAMILY[i].PATIENT_IDENTIFICATION.PATIENT_NAME.MIDDLE_NAME;
                        string lastName = request.FAMILY[i].PATIENT_IDENTIFICATION.PATIENT_NAME.LAST_NAME;
                        int sex = request.FAMILY[i].PATIENT_IDENTIFICATION.SEX;
                        DateTime dateOfBirth = DateTime.ParseExact(request.FAMILY[i].PATIENT_IDENTIFICATION.DATE_OF_BIRTH, "yyyyMMdd", null);
                        int providerId = request.FAMILY[i].PATIENT_IDENTIFICATION.USER_ID;
                        int maritalStatusId = request.FAMILY[i].PATIENT_IDENTIFICATION.MARITAL_STATUS;
                        string mobileNumber = request.FAMILY[i].PATIENT_IDENTIFICATION.PHONE_NUMBER;
                        string landmark = request.FAMILY[i].PATIENT_IDENTIFICATION.PATIENT_ADDRESS.PHYSICAL_ADDRESS
                            .LANDMARK;
                        int relationshipType = request.FAMILY[i].PATIENT_IDENTIFICATION.RELATIONSHIP_TYPE;

                        var indexClientIdentifiers = await registerPersonService.getPersonIdentifiers(indexClientAfyaMobileId, 10);
                        if (indexClientIdentifiers.Count > 0)
                        {
                            //Get Index client
                            var indexClient = await registerPersonService.GetPatientByPersonId(indexClientIdentifiers[0].PersonId);
                            var partnetPersonIdentifiers = await registerPersonService.getPersonIdentifiers(afyaMobileId, 10);
                            if (partnetPersonIdentifiers.Count > 0)
                            {
                                await registerPersonService.UpdatePerson(partnetPersonIdentifiers[0].PersonId, firstName, middleName, lastName, sex, dateOfBirth);
                                //update maritalstatus id
                                await registerPersonService.UpdateMaritalStatus(partnetPersonIdentifiers[0].PersonId, maritalStatusId);
                                if (!string.IsNullOrWhiteSpace(mobileNumber))
                                    await registerPersonService.UpdatePersonContact(partnetPersonIdentifiers[0].PersonId, null, mobileNumber);
                                if (!string.IsNullOrWhiteSpace(landmark))
                                    await registerPersonService.UpdatePersonLocation(partnetPersonIdentifiers[0].PersonId, landmark);

                                var getPersonRelationship = await registerPersonService.GetPersonRelationshipByPatientIdPersonId(indexClient.Id, partnetPersonIdentifiers[0].PersonId);
                                if (getPersonRelationship != null)
                                {
                                    getPersonRelationship.RelationshipTypeId = relationshipType;
                                    var updatedRelationship = await registerPersonService.UpdatePersonRelationship(getPersonRelationship);
                                }
                                else
                                {
                                    //Add PersonRelationship
                                    var personRelationship = await registerPersonService.addPersonRelationship(partnetPersonIdentifiers[0].PersonId, indexClient.Id, relationshipType, providerId);
                                }

                                /***
                                 *Encounter
                                 */
                                if (request.FAMILY[i].ENCOUNTER != null)
                                {
                                    if (request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING != null)
                                    {
                                        DateTime screeningDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.SCREENING_DATE, "yyyyMMdd", null);
                                        int hivStatus = request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.HIV_STATUS;
                                        int eligible = request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.ELIGIBLE_FOR_HTS;
                                        DateTime bookingDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.BOOKING_DATE, "yyyyMMdd", null);
                                        string remarks = request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.REMARKS;

                                        var familyScreenings = await _unitOfWork.Repository<LookupItemView>().Get(x => x.MasterName == "FamilyScreening")
                                            .ToListAsync();

                                        List<Screening> familyScreeningList = new List<Screening>();
                                        for (int j = 0; j < familyScreenings.Count; j++)
                                        {
                                            if (familyScreenings[j].ItemName == "EligibleTesting")
                                            {
                                                Screening screening = new Screening()
                                                {
                                                    ScreeningCategoryId = familyScreenings[j].ItemId,
                                                    ScreeningTypeId = familyScreenings[j].MasterId,
                                                    ScreeningValueId = eligible
                                                };
                                                familyScreeningList.Add(screening);
                                            }
                                            else if (familyScreenings[j].ItemName == "ScreeningHivStatus")
                                            {
                                                Screening screening = new Screening()
                                                {
                                                    ScreeningCategoryId = familyScreenings[j].ItemId,
                                                    ScreeningTypeId = familyScreenings[j].MasterId,
                                                    ScreeningValueId = hivStatus
                                                };
                                                familyScreeningList.Add(screening);
                                            }
                                        }

                                        var patientMasterVisitEntity = await _unitOfWork.Repository<PatientMasterVisit>()
                                            .Get(x => x.PatientId == indexClient.Id && x.ServiceId == 2).ToListAsync();

                                        int patientMasterVisitId = patientMasterVisitEntity.OrderBy(x => x.Id).FirstOrDefault().Id;

                                        var familyScreeningReturnValue =
                                            await encounterTestingService.AddPartnerScreening(partnetPersonIdentifiers[0].PersonId, indexClient.Id, patientMasterVisitId, null,
                                                screeningDate, bookingDate, familyScreeningList, providerId);
                                    }

                                    for (int j = 0; j < request.FAMILY[i].ENCOUNTER.TRACING.Count; j++)
                                    {
                                        var lookupitem = await _unitOfWork.Repository<LookupItemView>()
                                            .Get(x => x.MasterName == "TracingType" && x.ItemName == "Family").ToListAsync();
                                        int tracingType = lookupitem[0].ItemId;

                                        DateTime tracingDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.TRACING[j].TRACING_DATE, "yyyyMMdd", null);
                                        int mode = request.FAMILY[i].ENCOUNTER.TRACING[j].TRACING_MODE;
                                        int outcome = request.FAMILY[i].ENCOUNTER.TRACING[j].TRACING_OUTCOME;

                                        DateTime? reminderDate = null;
                                        if (!string.IsNullOrWhiteSpace(request.FAMILY[i].ENCOUNTER.TRACING[j].REMINDER_DATE))
                                            reminderDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.TRACING[j].REMINDER_DATE, "yyyyMMdd", null);
                                        DateTime? tracingBookingDate = null;
                                        if (!string.IsNullOrWhiteSpace(request.FAMILY[i].ENCOUNTER.TRACING[j].BOOKING_DATE))
                                            tracingBookingDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.TRACING[j].BOOKING_DATE, "yyyyMMdd", null);
                                        int consent = request.FAMILY[i].ENCOUNTER.TRACING[j].CONSENT;

                                        var trace = await encounterTestingService.addTracing(partnetPersonIdentifiers[0].PersonId, tracingType, tracingDate, mode, outcome,
                                            providerId, null, consent, tracingBookingDate, reminderDate);
                                    }
                                }
                            }
                            else
                            {
                                //Register family
                                var person = await registerPersonService.RegisterPerson(firstName, middleName, lastName, sex, dateOfBirth, providerId);
                                //Add afyamobile Id as an Id of the family
                                var personIdentifier = await registerPersonService.addPersonIdentifiers(person.Id, 10, afyaMobileId, providerId);
                                //Add family marital status
                                var partnerMaritalStatus = await registerPersonService.AddMaritalStatus(person.Id, maritalStatusId, providerId);
                                //add family contacts
                                if (string.IsNullOrWhiteSpace(mobileNumber))
                                {
                                    var partnerContacts = await registerPersonService.addPersonContact(person.Id, null, mobileNumber, null, null, providerId);
                                }
                                //add family location
                                if (!string.IsNullOrWhiteSpace(landmark))
                                {
                                    var partnerLocation = await registerPersonService.addPersonLocation(person.Id, 0, 0, 0, null, landmark, providerId);
                                }
                                //Add PersonRelationship
                                var personRelationship = await registerPersonService.addPersonRelationship(person.Id, indexClient.Id, relationshipType, providerId);


                                /***
                                 *Encounter
                                 */
                                if (request.FAMILY[i].ENCOUNTER != null)
                                {
                                    if (request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING != null)
                                    {
                                        DateTime screeningDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.SCREENING_DATE, "yyyyMMdd", null);
                                        int hivStatus = request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.HIV_STATUS;
                                        int eligible = request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.ELIGIBLE_FOR_HTS;
                                        DateTime bookingDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.BOOKING_DATE, "yyyyMMdd", null);
                                        string remarks = request.FAMILY[i].ENCOUNTER.FAMILY_SCREENING.REMARKS;

                                        var familyScreenings = await _unitOfWork.Repository<LookupItemView>().Get(x => x.MasterName == "FamilyScreening")
                                            .ToListAsync();

                                        List<Screening> familyScreeningList = new List<Screening>();
                                        for (int j = 0; j < familyScreenings.Count; j++)
                                        {
                                            if (familyScreenings[j].ItemName == "EligibleTesting")
                                            {
                                                Screening screening = new Screening()
                                                {
                                                    ScreeningCategoryId = familyScreenings[j].ItemId,
                                                    ScreeningTypeId = familyScreenings[j].MasterId,
                                                    ScreeningValueId = eligible
                                                };
                                                familyScreeningList.Add(screening);
                                            }
                                            else if (familyScreenings[j].ItemName == "ScreeningHivStatus")
                                            {
                                                Screening screening = new Screening()
                                                {
                                                    ScreeningCategoryId = familyScreenings[j].ItemId,
                                                    ScreeningTypeId = familyScreenings[j].MasterId,
                                                    ScreeningValueId = hivStatus
                                                };
                                                familyScreeningList.Add(screening);
                                            }
                                        }

                                        var patientMasterVisitEntity = await _unitOfWork.Repository<PatientMasterVisit>()
                                            .Get(x => x.PatientId == indexClient.Id && x.ServiceId == 2).ToListAsync();

                                        int patientMasterVisitId = patientMasterVisitEntity.OrderBy(x => x.Id).FirstOrDefault().Id;

                                        var familyScreeningReturnValue =
                                            await encounterTestingService.AddPartnerScreening(person.Id, indexClient.Id, patientMasterVisitId, null,
                                                screeningDate, bookingDate, familyScreeningList, providerId);
                                    }

                                    for (int j = 0; j < request.FAMILY[i].ENCOUNTER.TRACING.Count; j++)
                                    {
                                        var lookupitem = await _unitOfWork.Repository<LookupItemView>()
                                            .Get(x => x.MasterName == "TracingType" && x.ItemName == "Family").ToListAsync();
                                        int tracingType = lookupitem[0].ItemId;

                                        DateTime tracingDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.TRACING[j].TRACING_DATE, "yyyyMMdd", null);
                                        int mode = request.FAMILY[i].ENCOUNTER.TRACING[j].TRACING_MODE;
                                        int outcome = request.FAMILY[i].ENCOUNTER.TRACING[j].TRACING_OUTCOME;

                                        DateTime? reminderDate = null;
                                        if (!string.IsNullOrWhiteSpace(request.FAMILY[i].ENCOUNTER.TRACING[j].REMINDER_DATE))
                                            reminderDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.TRACING[j].REMINDER_DATE, "yyyyMMdd", null);
                                        DateTime? tracingBookingDate = null;
                                        if(!string.IsNullOrWhiteSpace(request.FAMILY[i].ENCOUNTER.TRACING[j].BOOKING_DATE))
                                            tracingBookingDate = DateTime.ParseExact(request.FAMILY[i].ENCOUNTER.TRACING[j].BOOKING_DATE, "yyyyMMdd", null);
                                        int consent = request.FAMILY[i].ENCOUNTER.TRACING[j].CONSENT;

                                        var trace = await encounterTestingService.addTracing(person.Id, tracingType, tracingDate, mode, outcome,
                                            providerId, null, consent, tracingBookingDate, reminderDate);
                                    }
                                }
                            }
                        }
                    }
                    return Result<string>.Valid(afyaMobileId);
                }
                catch (Exception e)
                {
                    return Result<string>.Invalid(e.Message);
                }
            }
        }
    }
}