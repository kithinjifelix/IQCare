﻿using System;
using System.Collections.Generic;
using Entities.CCC.Visit;

namespace Interface.CCC.Visit
{
    public interface IPatientEncounterManager
   {
       int AddpatientEncounter(PatientEncounter patientEncounter);
       int UpdatePatientEncounter(PatientEncounter patientEncounter);
       int DeletePatientEncounter(int id);
       List<PatientEncounter> GetPatientCurrentEncounters(int patientId, DateTime visitDate);
       List<PatientEncounter> GetPatientEncounterAll(int patientId);
       List<PatientEncounter> GetPatientEncounterByEncounterType(int patientId, string encounterName);
       int PatientEncounterCheckout(int patientEncounterId);
       PatientEncounter GetEncounterIfExists(int patientId, int patientMasterVisitId, int encounterTypeId);
   }
}
