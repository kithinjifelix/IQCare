﻿using Entities.CCC.Screening;
using System;
using System.Collections.Generic;

namespace Interface.CCC.Screening
{
    public interface IPatientScreeningManager
    {
        int AddPatientScreening(PatientScreening a);
        int UpdatePatientScreening(PatientScreening u);
        int DeletePatientScreening(int Id);
        PatientScreening GetCurrentPatientScreening(int patientId, int patientmastervisitid);
        List<PatientScreening> GetPatientScreening(int patientId);
        List<PatientScreening> GetPatientScreening(int patientId, DateTime visitdate, int screeningCategoryId);
        int CheckIfPatientScreeningExists(int patientId);
        int CheckIfPatientScreeningExists(int patientId, DateTime visitDate, int screeningCategoryId, int screeningTypeId);
        int checkScreeningByScreeningCategoryId(int patientId, int screenTypeId, int screeningCategoryId);
        int checkScreeningByVisitId(int patientId, int patientMasterVisitId, int screenTypeId, int screeningCategoryId);
        int updatePatientScreeningById(PatientScreening p);
        List<PatientScreening> GetPatientScreeningByVisitId(int patientId, int patientMasterVisitId);
        List<PatientScreening> GetPatientScreeningStatus(int patientId, int statusId);
    }
}
