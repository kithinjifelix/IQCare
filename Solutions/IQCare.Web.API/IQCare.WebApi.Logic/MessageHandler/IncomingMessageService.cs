﻿using AutoMapper;
using Entity.WebApi;
using Interface.WebApi;
using IQCare.WebApi.Logic.DtoMapping;
using IQCare.WebApi.Logic.MappingEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using IQCare.CCC.UILogic.Interoperability;
using IQCare.CCC.UILogic.Interoperability.Appointment;
using IQCare.CCC.UILogic.Interoperability.Enrollment;
using IQCare.DTO;
using IQCare.DTO.PatientAppointment;
using IQCare.DTO.PatientRegistration;

namespace IQCare.WebApi.Logic.MessageHandler
{
    public class IncomingMessageService : IIncomingMessageService
    {
        private readonly IApiInboxManager _apiInboxmanager;
        private readonly IDtoMapper _dtoMapper;

        public IncomingMessageService()
        {
            _apiInboxmanager = new ApiInboxManager();
            _dtoMapper = new DtoMapper();
        }

        public IncomingMessageService(IApiInboxManager apiInboxmanager, IDtoMapper dtoMapper)
        {
            _apiInboxmanager = apiInboxmanager;
            _dtoMapper = dtoMapper;
        }

        public void Handle(string messageType, string message)
        {
            var apiInbox = new ApiInbox()
            {
                DateReceived = DateTime.Now,
                Message = message,
                SenderId = 1
            };

            switch (messageType)
            {
                case "ADT^A04":
                    HandleNewClientRegistration(apiInbox);
                    break;

                case "ADT^A08":
                    HandleUpdatedClientInformation(apiInbox);
                    break;

                case "RDE^001 ":
                    HandleDrugPrescriptionRaised(apiInbox);
                    break;

                case "RDS^O13":
                    HandlePharmacyDispense(apiInbox);
                    break;

                case "SIU^S12":
                    HandleAppointments(apiInbox);
                    break;

                case "ORU^VL":
                    HandleNewViralLoadResults(apiInbox);
                    break;
            }
        }

        private void HandleNewClientRegistration(ApiInbox incomingMessage)
        {
            //save to inbox
            int Id = _apiInboxmanager.AddApiInbox(incomingMessage);
            incomingMessage.Id = Id;

            try
            {
                PatientRegistrationEntity entity = new JavaScriptSerializer().Deserialize<PatientRegistrationEntity>(incomingMessage.Message);
                Mapper.Initialize(cfg =>
                {
                    cfg.CreateMap<PatientRegistrationDTO, PatientRegistrationEntity>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.MESSAGEHEADER, MappingEntities.MESSAGEHEADER>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PATIENTIDENTIFICATION, MappingEntities.PATIENTIDENTIFICATION>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.NEXTOFKIN, MappingEntities.NEXTOFKIN>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.VISIT, MappingEntities.VISIT>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.EXTERNALPATIENTID, MappingEntities.EXTERNALPATIENTID>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.INTERNALPATIENTID, MappingEntities.INTERNALPATIENTID>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PATIENTNAME, MappingEntities.PATIENTNAME>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PATIENTADDRESS, MappingEntities.PATIENTADDRESS>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PHYSICAL_ADDRESS, MappingEntities.PHYSICALADDRESS>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.NOKNAME, MappingEntities.NOKNAME>().ReverseMap();
                });
                var register = Mapper.Map<PatientRegistrationDTO>(entity);

                var processRegistration = new ProcessRegistration();
                processRegistration.Save(register);

                //update message set processed=1, erromsq=null
                incomingMessage.DateProcessed = DateTime.Now;
                incomingMessage.Processed = true;
                _apiInboxmanager.EditApiInbox(incomingMessage);
            }
            catch (Exception e)
            {
                //update message set processed=1, erromsq
                incomingMessage.LogMessage = e.Message;
                incomingMessage.Processed = false;
                _apiInboxmanager.EditApiInbox(incomingMessage);
            }
        }

        private void HandleUpdatedClientInformation(ApiInbox incomingMessage)
        {
            //save to inbox
            int Id = _apiInboxmanager.AddApiInbox(incomingMessage);
            incomingMessage.Id = Id;

            try
            {
                PatientRegistrationEntity entity = new JavaScriptSerializer().Deserialize<PatientRegistrationEntity>(incomingMessage.Message);
                Mapper.Initialize(cfg =>
                {
                    cfg.CreateMap<PatientRegistrationDTO, PatientRegistrationEntity>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.MESSAGEHEADER, MappingEntities.MESSAGEHEADER>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PATIENTIDENTIFICATION, MappingEntities.PATIENTIDENTIFICATION>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.NEXTOFKIN, MappingEntities.NEXTOFKIN>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.VISIT, MappingEntities.VISIT>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.EXTERNALPATIENTID, MappingEntities.EXTERNALPATIENTID>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.INTERNALPATIENTID, MappingEntities.INTERNALPATIENTID>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PATIENTNAME, MappingEntities.PATIENTNAME>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PATIENTADDRESS, MappingEntities.PATIENTADDRESS>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PHYSICAL_ADDRESS, MappingEntities.PHYSICALADDRESS>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.NOKNAME, MappingEntities.NOKNAME>().ReverseMap();
                });
                var register = Mapper.Map<PatientRegistrationDTO>(entity);
                var processRegistration = new ProcessRegistration();
                processRegistration.Update(register);

                //update message that it has been processed
                incomingMessage.DateProcessed = DateTime.Now;
                incomingMessage.Processed = true;
                _apiInboxmanager.EditApiInbox(incomingMessage);
            }
            catch (Exception e)
            {
                incomingMessage.LogMessage = e.Message;
                incomingMessage.Processed = false;
                _apiInboxmanager.EditApiInbox(incomingMessage);
            }
        }

        private void HandleDrugPrescriptionRaised(ApiInbox incomingMessage)
        {
            _apiInboxmanager.AddApiInbox(incomingMessage);
        }

        private void HandlePharmacyDispense(ApiInbox incomingMessage)
        {
            //save to inbox
            int Id = _apiInboxmanager.AddApiInbox(incomingMessage);
            incomingMessage.Id = Id;
            try
            {
                PharmacyDispenseEntity pharmacyDispenseEntity = new JavaScriptSerializer().Deserialize<PharmacyDispenseEntity>(incomingMessage.Message);
                Mapper.Initialize(cfg =>
                {
                    cfg.CreateMap<DtoDrugDispensed, PharmacyDispenseEntity>().ReverseMap();
                    cfg.CreateMap<MappingEntities.MESSAGEHEADER,DTO.MESSAGE_HEADER>().ForMember(x=>x.MESSAGE_DATETIME, z=>z.Ignore())
                    .AfterMap((src, dst) =>
                    {
                        if (!src.MESSAGE_DATETIME.Equals(""))
                        dst.MESSAGE_DATETIME = DateTime.ParseExact(pharmacyDispenseEntity.MESSAGE_HEADER.MESSAGE_DATETIME, "yyyyMMddHHmmss", null);

                    });
                    cfg.CreateMap<DTO.CommonEntities.APPOINTMENTPATIENTIDENTIFICATION, MappingEntities.APPOINTMENTPATIENTIDENTIFICATION>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.EXTERNALPATIENTID, MappingEntities.EXTERNALPATIENTID>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.INTERNALPATIENTID, MappingEntities.INTERNALPATIENTID>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PATIENTNAME, MappingEntities.PATIENTNAME>().ReverseMap();
                    cfg.CreateMap<MappingEntities.drugs.COMMONORDERDETAILS, DTO.CommonOrderDetailsDispenseDto>().ForMember(x => x.TRANSACTION_DATETIME, z => z.Ignore())
                        .AfterMap((src, dst) =>
                        {
                            if (!src.TRANSACTION_DATETIME.Equals(""))
                                dst.TRANSACTION_DATETIME = DateTime.ParseExact(pharmacyDispenseEntity.MESSAGE_HEADER.MESSAGE_DATETIME, "yyyyMMddHHmmss", null);

                        });
                    cfg.CreateMap<PlacerOrderNumberDto, MappingEntities.drugs.PLACERORDERNUMBER>().ReverseMap();
                    cfg.CreateMap<PlacerOrderNumberDto, MappingEntities.drugs.FILLERORDERNUMBER>().ReverseMap();
                    cfg.CreateMap<OrderingPysicianDto, MappingEntities.drugs.ORDERINGPHYSICIAN>().ReverseMap();
                    cfg.CreateMap<DTO.PHARMACY_DISPENSE, MappingEntities.PHARMACYDISPENSE>().ReverseMap();
                    cfg.CreateMap<DTO.PHARMACY_ENCODED_ORDER, MappingEntities.drugs.PHARMACYENCODEDORDER>().ReverseMap();
                });
                var drugDispensed = Mapper.Map<DtoDrugDispensed>(pharmacyDispenseEntity);
                var processPharmacyDispense = new ProcessPharmacyDispense();
                var msg = processPharmacyDispense.Process(drugDispensed);
                incomingMessage.LogMessage = msg;
                //update message that it has been processed
                incomingMessage.DateProcessed = DateTime.Now;
                incomingMessage.Processed = true;
                _apiInboxmanager.EditApiInbox(incomingMessage);

                incomingMessage.DateProcessed = DateTime.Now;
                incomingMessage.Processed = true;
                _apiInboxmanager.EditApiInbox(incomingMessage);
            }
            catch (Exception e)
            {
                incomingMessage.LogMessage = e.Message;
                incomingMessage.Processed = false;
                _apiInboxmanager.AddApiInbox(incomingMessage);
            }
        }

        private void HandleAppointments(ApiInbox incomingMessage)
        {
            //save to inbox
            int Id = _apiInboxmanager.AddApiInbox(incomingMessage);
            incomingMessage.Id = Id;

            try
            {
                PatientAppointmentEntity appointmentEntity = new JavaScriptSerializer().Deserialize<PatientAppointmentEntity>(incomingMessage.Message);

                Mapper.Initialize(cfg =>
                {
                    cfg.CreateMap<PatientAppointSchedulingDTO, PatientAppointmentEntity>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.MESSAGEHEADER, MappingEntities.MESSAGEHEADER>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.APPOINTMENTPATIENTIDENTIFICATION, MappingEntities.APPOINTMENTPATIENTIDENTIFICATION>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.EXTERNALPATIENTID, MappingEntities.EXTERNALPATIENTID>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.INTERNALPATIENTID, MappingEntities.INTERNALPATIENTID>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PATIENTNAME, MappingEntities.PATIENTNAME>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.APPOINTMENT_INFORMATION, MappingEntities.APPOINTMENT_INFORMATION>().ReverseMap();
                    cfg.CreateMap<DTO.CommonEntities.PLACER_APPOINTMENT_NUMBER, MappingEntities.PLACER_APPOINTMENT_NUMBER>().ReverseMap();
                });
                var appointment = Mapper.Map<PatientAppointSchedulingDTO>(appointmentEntity);
                var processAppoinment = new ProcessPatientAppointmentMessage();
                foreach (var itemAppointment in appointment.APPOINTMENT_INFORMATION)
                {
                    if (itemAppointment.ACTION_CODE == "A")
                    {
                        processAppoinment.Save(appointment);
                    }
                    else if (itemAppointment.ACTION_CODE == "U" || itemAppointment.ACTION_CODE == "D")
                    {
                        processAppoinment.Update(appointment);
                    }
                }

                //update message that it has been processed
                incomingMessage.DateProcessed = DateTime.Now;
                incomingMessage.Processed = true;
                _apiInboxmanager.EditApiInbox(incomingMessage);
            }
            catch (Exception e)
            {
                incomingMessage.LogMessage = e.Message;
                incomingMessage.Processed = false;
                _apiInboxmanager.EditApiInbox(incomingMessage);
            }
        }

        private void HandleNewViralLoadResults(ApiInbox incomingMessage)
        {
            //save to inbox
            int Id = _apiInboxmanager.AddApiInbox(incomingMessage);
            incomingMessage.Id = Id;

            try
            {
                ViralLoadResultEntity entity = new JavaScriptSerializer().Deserialize<ViralLoadResultEntity>(incomingMessage.Message);
                ViralLoadResultsDto vlResultsDto = _dtoMapper.ViralLoadResults(entity);
                var processViralLoadResults = new ProcessViralLoadResults();
                var msg = processViralLoadResults.Save(vlResultsDto);
                // var msg = "could not be processed";

                incomingMessage.LogMessage = msg;
                //update message that it has been processed
                incomingMessage.DateProcessed = DateTime.Now;
                incomingMessage.Processed = true;
                _apiInboxmanager.EditApiInbox(incomingMessage);
            }
            catch (Exception e)
            {
                incomingMessage.LogMessage = e.Message;
                incomingMessage.Processed = false;
                _apiInboxmanager.EditApiInbox(incomingMessage);
            }
        }
    }
}