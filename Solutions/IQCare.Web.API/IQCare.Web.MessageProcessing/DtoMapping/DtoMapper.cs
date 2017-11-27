﻿
using System;
using System.Collections.Generic;
using System.Linq;
using IQCare.DTO;
using IQCare.Web.MessageProcessing.JsonMappingEntities;

namespace IQCare.Web.MessageProcessing.DtoMapping
{
    public class DtoMapper : IDtoMapper
    {
        //todo handle possible null reference exceptions when fetching data from lists
        public Registration PatientRegistrationMapping(PatientRegistrationEntity entity)
        {
            var patient = new DTOPerson()
            {
                FirstName = entity.PATIENT_IDENTIFICATION.PATIENT_NAME.FIRST_NAME,
                MiddleName = entity.PATIENT_IDENTIFICATION.PATIENT_NAME.FIRST_NAME,
                LastName = entity.PATIENT_IDENTIFICATION.PATIENT_NAME.FIRST_NAME,
                DateOfBirth = entity.PATIENT_IDENTIFICATION.DATE_OF_BIRTH,
                MobileNumber = entity.PATIENT_IDENTIFICATION.PHONE_NUMBER,
                NationalId = entity.PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID.FirstOrDefault(n=>n.IDENTIFIER_TYPE == "NATIONAL_ID").ID,
                Sex = entity.PATIENT_IDENTIFICATION.SEX,
                PhysicalAddress = entity.PATIENT_IDENTIFICATION.PATIENT_ADDRESS.POSTAL_ADDRESS,
                //todo update precision once updated in IL
                DobPrecision = false
            };

            var ts = entity.NEXT_OF_KIN.FirstOrDefault(n => n.CONTACT_ROLE == "T");
            var treatmentSupporter = new DTOPerson()
            {
                FirstName = ts.NOK_NAME.FIRST_NAME,
                MiddleName = ts.NOK_NAME.MIDDLE_NAME,
                LastName = ts.NOK_NAME.LAST_NAME,
                PhysicalAddress = ts.ADDRESS,
                Sex = ts.SEX,
                DateOfBirth = ts.DATE_OF_BIRTH,
                MobileNumber = ts.PHONE_NUMBER,
                //todo update precision once updated in IL
                //NationalId = ,
                DobPrecision = false
            };
            var identifiers = new List<DTOIdentifier>();
            foreach (var id in entity.PATIENT_IDENTIFICATION.INTERNAL_PATIENT_ID)
            {
               var identifier = new DTOIdentifier()
               {
                   AssigningAuthority = id.ASSIGNING_AUTHORITY,
                   IdentifierType = id.IDENTIFIER_TYPE,
                   IdentifierValue = id.ID
               };
                identifiers.Add(identifier);
            }
            var registration = new Registration()
            {
                Patient = patient,
                MotherMaidenName = entity.PATIENT_IDENTIFICATION.MOTHER_MAIDEN_NAME,
                MaritalStatus = entity.PATIENT_IDENTIFICATION.MARITAL_STATUS,
                County = entity.PATIENT_IDENTIFICATION.PATIENT_ADDRESS.PHYSICAL_ADDRESS.COUNTY,
                SubCounty = entity.PATIENT_IDENTIFICATION.PATIENT_ADDRESS.PHYSICAL_ADDRESS.SUB_COUNTY,
                Ward = entity.PATIENT_IDENTIFICATION.PATIENT_ADDRESS.PHYSICAL_ADDRESS.WARD,
                Village = entity.PATIENT_IDENTIFICATION.PATIENT_ADDRESS.PHYSICAL_ADDRESS.VILLAGE,
                DateOfDeath = null,
                DeathIndicator = entity.PATIENT_IDENTIFICATION.DEATH_INDICATOR,
                TreatmentSupporter = treatmentSupporter,
                TSRelationshipType =  ts.RELATIONSHIP,
                InternalPatientIdentifiers = identifiers
                //DateOfEnrollment = entity,
                
            };
            return registration;
        }

        public void PatientTransferIn()
        {
            throw new NotImplementedException();
        }

        public void UpdatedClientInformation()
        {
            throw new NotImplementedException();
        }

        public void PatientTransferOut()
        {
            throw new NotImplementedException();
        }

        public void RegimenChange()
        {
            throw new NotImplementedException();
        }

        public void StopDrugs()
        {
            throw new NotImplementedException();
        }

        public void DrugPrescriptionRaised()
        {
            throw new NotImplementedException();
        }

        public void DrugOrderCancel()
        {
            throw new NotImplementedException();
        }

        public void DrugOrderFulfilment()
        {
            throw new NotImplementedException();
        }

        public void AppointmentScheduling()
        {
            throw new NotImplementedException();
        }

        public void AppointmentUpdated()
        {
            throw new NotImplementedException();
        }

        public void AppointmentRescheduling()
        {
            throw new NotImplementedException();
        }

        public void AppointmentCanceled()
        {
            throw new NotImplementedException();
        }

        public void AppointmentHonored()
        {
            throw new NotImplementedException();
        }

        public void UniquePatientIdentification()
        {
            throw new NotImplementedException();
        }

        public void ViralLoadLabOrder()
        {
            throw new NotImplementedException();
        }

        public ViralLoadResultEntity ViralLoadResults(ViralLoadResultEntity entity)
        {
            var internalIdentifiers=new List<INTERNALPATIENTID>() ;

            foreach (var identifier in internalIdentifiers)
            {
                var internalIdentity=new INTERNALPATIENTID()
                {
                    ID = identifier.ID,
                    IDENTIFIER_TYPE = identifier.IDENTIFIER_TYPE,
                    ASSIGNING_AUTHORITY = identifier.ASSIGNING_AUTHORITY
                };
                internalIdentifiers.Add(internalIdentity);
            }

            var vlResultsDto=new ViralLoadResultEntity()
            {
                MESSAGE_HEADER =
                {
                    SENDING_APPLICATION = entity.MESSAGE_HEADER.SENDING_APPLICATION,
                    SENDING_FACILITY = entity.MESSAGE_HEADER.SENDING_FACILITY,
                    RECEIVING_APPLICATION = entity.MESSAGE_HEADER.RECEIVING_APPLICATION,
                    RECEIVING_FACILITY = entity.MESSAGE_HEADER.RECEIVING_FACILITY,
                    MESSAGE_DATETIME =entity.MESSAGE_HEADER.MESSAGE_DATETIME, //DateTime.Now.ToString("yyyyMMddHHmmss"); 
                    SECURITY = entity.MESSAGE_HEADER.SECURITY,
                    MESSAGE_TYPE = entity.MESSAGE_HEADER.MESSAGE_TYPE,
                    PROCESSING_ID = entity.MESSAGE_HEADER.PROCESSING_ID

                },
                PATIENT_IDENTIFICATION =
                {
                    PATIENT_NAME =
                    {
                        FIRST_NAME = entity.PATIENT_IDENTIFICATION.PATIENT_NAME.FIRST_NAME,
                        MIDDLE_NAME = entity.PATIENT_IDENTIFICATION.PATIENT_NAME.MIDDLE_NAME,
                        LAST_NAME = entity.PATIENT_IDENTIFICATION.PATIENT_NAME.LAST_NAME
                    },
                    INTERNAL_PATIENT_ID = internalIdentifiers
                },
                VIRAL_LOAD_RESULT =
                {
                    DATE_SAMPLE_COLLECTED = entity.VIRAL_LOAD_RESULT.DATE_SAMPLE_COLLECTED,
                    DATE_SAMPLE_TESTED = entity.VIRAL_LOAD_RESULT.DATE_SAMPLE_TESTED,
                    JUSTIFICATION = entity.VIRAL_LOAD_RESULT.JUSTIFICATION,
                    LAB_TESTED_IN =     entity.VIRAL_LOAD_RESULT.LAB_TESTED_IN,
                    REGIMEN = entity.VIRAL_LOAD_RESULT.REGIMEN,
                    SAMPLE_TYPE = entity.VIRAL_LOAD_RESULT.SAMPLE_TYPE
                }
            }; 
            return vlResultsDto;
        }
    }
}