﻿using System;
using System.Collections.Generic;
using Entities.CCC.Triage;
using Interface.CCC.Triage;
using Application.Presentation;

namespace IQCare.CCC.UILogic.Triage
{
    public class PatientPregnancyIndicatorManager
    {
        private IpatientPregnancyIndicatorManager _PregnancyIndicator = (IpatientPregnancyIndicatorManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.Triage.PatientPregnancyIndicatorManager, BusinessProcess.CCC");

        public int AddPregnancyIndicator(int patientId,int patientMasterVisitId,DateTime visitDate ,DateTime lmp,DateTime edd,int pregnancyStatusId,int ancProfile,DateTime ancProfileDate,int userId)
        {
            try
            {
                var pg = new PatientPregnancyIndicator()
                {
                    PatientId = patientId,
                    PatientMasterVisitId = patientMasterVisitId,
                    VisitDate = visitDate,
                    LMP = lmp,
                    EDD = edd,
                    PregnancyStatusId = pregnancyStatusId,
                    AncProfile = ancProfile,
                    AncProfileDate = ancProfileDate,
                    CreatedBy = userId
                };

                return _PregnancyIndicator.AddPregnancyIndicator(pg);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public int CheckIfPregnancyIndicatorExisists(int patientId)
        {
            return _PregnancyIndicator.CheckIfPregnancyIndicatorExisists(patientId);
        }

        public int DeletePregnancyIndicator(int id)
        {
            return _PregnancyIndicator.DeletePregnancyIndicator(id);
        }

        public List<PatientPregnancyIndicator> GetPregnancyIndicator(int patientId)
        {
            try
            {
                return _PregnancyIndicator.GetPregnancyIndicator(patientId);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public int UpdatePreganacyIndcator(int id,DateTime visitDate,DateTime lmp, DateTime edd, int pregnancyStatusId, int ancProfile, DateTime ancProfileDate)
        {
            try
            {
                var pg = new PatientPregnancyIndicator()
                {
                    Id = id,
                    VisitDate = visitDate,
                    LMP = lmp,
                    EDD = edd,
                    PregnancyStatusId = pregnancyStatusId,
                    AncProfile = ancProfile,
                    AncProfileDate = ancProfileDate
                };
                return _PregnancyIndicator.UpdatePreganacyIndcator(pg);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
