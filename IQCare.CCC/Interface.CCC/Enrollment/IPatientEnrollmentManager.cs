﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entities.CCC.Enrollment;

namespace Interface.CCC.Enrollment
{
    public interface IPatientEnrollmentManager
    {
        int AddPatientEnrollment(PatientEntityEnrollment patientEnrollment);
        int UpdatePatientEnrollment(PatientEntityEnrollment patientEnrollment);
        int DeletePatientEnrollment(int id);
        DateTime GetPatientEnrollmentDate(int patientId);
        List<PatientEntityEnrollment> GetPatientEnrollmentByPatientId(int patientId);
        PatientEntityEnrollment GetPatientEntityEnrollment(int id);
        List<PatientEntityEnrollment> GetPatientByPatientIdCareEnded(int patientId);
    }
}
