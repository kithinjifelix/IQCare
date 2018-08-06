﻿using DataAccess.Base;
using Interface.CCC.Baseline;
using System;
using Entities.CCC.Encounter;
using DataAccess.CCC.Repository;
using DataAccess.CCC.Context;
using System.Collections.Generic;
using System.Linq;

namespace BusinessProcess.CCC.Baseline
{
    public class BPatientVaccination : ProcessBase, IPatientVaccinationManager
    {
       // private readonly UnitOfWork _unitOfWork = new UnitOfWork(new GreencardContext());
        internal int Result;

        public int addPatientVaccination(PatientVaccination patientVaccination)
        {
            using (UnitOfWork _unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                _unitOfWork.PatientVaccinationRepository.Add(patientVaccination);
                Result = _unitOfWork.Complete();
                _unitOfWork.Dispose();
                return Result;
            }
        }

        public int DeletePatientVaccination(int id)
        {
            throw new NotImplementedException();
        }

        public List<PatientVaccination> GetPatientVaccinations(int patientId)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                var vaccinations = unitOfWork.PatientVaccinationRepository.FindBy(x => x.PatientId == patientId && x.DeleteFlag == false).ToList();
                unitOfWork.Dispose();
                return vaccinations;
            }
        }

        public List<PatientVaccination> GetPatientVaccinationsById(int vaccineId)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                var vaccinations = unitOfWork.PatientVaccinationRepository.FindBy(x => x.Id == vaccineId && x.DeleteFlag == false).ToList();
                unitOfWork.Dispose();
                return vaccinations;
            }
        }

        public int updatePatientVaccination(PatientVaccination patientVaccination)
        {
            throw new NotImplementedException();
        }

        public void deletePatientVaccination(PatientVaccination patientVaccination)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                unitOfWork.PatientVaccinationRepository.Update(patientVaccination);
                unitOfWork.Complete();
                unitOfWork.Dispose();
            }
        }

        public List<PatientVaccination> VaccineExists(int patientId, int vaccine, string vaccineStage)
        {
            using (UnitOfWork unitOfWork = new UnitOfWork(new GreencardContext()))
            {
                var vaccinations = unitOfWork.PatientVaccinationRepository
                    .FindBy(x => x.PatientId == patientId && x.Vaccine == vaccine && x.VaccineStage == vaccineStage && x.DeleteFlag == false)
                    .ToList();
                unitOfWork.Dispose();
                return vaccinations;
            }
        }
    }
}
