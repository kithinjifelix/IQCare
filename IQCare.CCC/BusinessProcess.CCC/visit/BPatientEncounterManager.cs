﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using DataAccess.Base;
using Entities.CCC.Visit;
using Interface.CCC.Visit;
using DataAccess.CCC.Context;
using DataAccess.CCC.Repository;

namespace BusinessProcess.CCC.visit
{

    public class BPatientEncounterManager :ProcessBase, IPatientEncounterManager
    {
       // private readonly UnitOfWork _unitOfWork = new UnitOfWork(new GreencardContext());
        internal int Result;

        public int AddpatientEncounter(PatientEncounter patientEncounter)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                unitOfWork.PatientEncounterRepository.Add(patientEncounter);
                Result = unitOfWork.Complete();
                unitOfWork.Dispose();
                return Result;
            }
        }

        public int UpdatePatientEncounter(PatientEncounter patientEncounter)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                var encounter = unitOfWork.PatientEncounterRepository.GetById(patientEncounter.Id);
                if (null != encounter)
                {
                    encounter.PatientId = patientEncounter.PatientId;
                    encounter.PatientMasterVisitId = patientEncounter.PatientMasterVisitId;
                    encounter.EncounterStartTime = patientEncounter.EncounterStartTime;
                    encounter.EncounterEndTime = patientEncounter.EncounterEndTime;
                    encounter.ServiceAreaId = patientEncounter.ServiceAreaId;

                }
                unitOfWork.PatientEncounterRepository.Update(patientEncounter);
                Result = unitOfWork.Complete();
                unitOfWork.Dispose();
                return Result;
            }
        }

        public int DeletePatientEncounter(int id)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                var patientEncounter = unitOfWork.PatientEncounterRepository.GetById(id);
                unitOfWork.PatientEncounterRepository.Remove(patientEncounter);
                Result = unitOfWork.Complete();
                unitOfWork.Dispose();
                return Result;
            }
        }

        public List<PatientEncounter> GetPatientCurrentEncounters(int patientId, DateTime visitDate)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                List<PatientEncounter> patientEncounters =
                   unitOfWork.PatientEncounterRepository.FindBy(
                           x =>
                               x.PatientId == patientId &
                               DbFunctions.TruncateTime(x.CreateDate) == DbFunctions.TruncateTime(visitDate) &
                               !x.DeleteFlag)
                       .OrderByDescending(x => x.Id).Take(1).ToList();
                unitOfWork.Dispose();
                return patientEncounters;
            }
        }

        public List<PatientEncounter> GetPatientEncounterAll(int patientId)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                List<PatientEncounter> patientEncounters =
                   unitOfWork.PatientEncounterRepository.FindBy(
                           x =>
                               x.PatientId == patientId &
                               !x.DeleteFlag)
                       .OrderByDescending(x => x.Id).Take(1).ToList();
                unitOfWork.Dispose();
                return patientEncounters;
            }
        }

        public List<PatientEncounter> GetPatientEncounterByEncounterType(int patientId, string encounterName)
        {
            BLookupManager lookup=new BLookupManager();
            List<PatientEncounter> patientEncounterList;

            int encounterTypeId = Convert.ToInt32(lookup.GetLookupItemId(encounterName));

                using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
                {
                     patientEncounterList = unitOfWork.PatientEncounterRepository
                        .FindBy(x => x.PatientId == patientId && x.EncounterTypeId == encounterTypeId).ToList();
                    unitOfWork.Dispose();
                }

            return patientEncounterList;

        }

        public int PatientEncounterCheckout(int patientEncounterId)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                var encounter = unitOfWork.PatientEncounterRepository.GetById(patientEncounterId);
                if (null != encounter)
                {
                    encounter.EncounterEndTime = DateTime.Now;
                    encounter.Status = 1;
                }
                unitOfWork.PatientEncounterRepository.Update(encounter);
                Result = unitOfWork.Complete();
                unitOfWork.Dispose();
            }
            return Result;
        }

        public PatientEncounter GetEncounterIfExists(int patientId, int patientMasterVisitId, int encounterTypeId)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                var encounter = unitOfWork.PatientEncounterRepository.FindBy(x =>x.PatientId==patientId && x.PatientMasterVisitId==patientMasterVisitId && x.EncounterTypeId==encounterTypeId).FirstOrDefault();
                return encounter;
            }
        }
    }
}
