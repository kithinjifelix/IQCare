﻿using Entities.CCC.Encounter;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Interface.CCC.Baseline
{
    public interface IPatientVaccinationManager
    {
        int addPatientVaccination(PatientVaccination patientVaccination);
        int updatePatientVaccination(PatientVaccination patientVaccination);
        int DeletePatientVaccination(int id);
        void deletePatientVaccination(PatientVaccination patientVaccination);
        List<PatientVaccination> GetPatientVaccinations(int patientId);
        List<PatientVaccination> VaccineExists(int patientId, int vaccine, string vaccineStage);
        List<PatientVaccination> GetPatientVaccinationsById(int vaccineId);
    }
}
