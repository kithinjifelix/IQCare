﻿using System.Collections.Generic;
using Entities.CCC.Baseline;

namespace Interface.CCC.Baseline
{
    public interface IPatientTreatmentInitiationManager
    {
        int AddPatientTreatmentInitiation(PatientTreatmentInitiation patientTreatmentInitiation);
        int UpdatePatientTreatmentInitiation(PatientTreatmentInitiation patientTreatmentInitiation);
        int DeletePatientTreatmentInitiation(int id);
        List<PatientTreatmentInitiation> GetPatientTreatmentInitiation(int patientId);
    }
}
