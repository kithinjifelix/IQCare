﻿using System.Collections.Generic;
using System.Linq;
using DataAccess.CCC.Context;
using DataAccess.CCC.Interface.Lookup;
using DataAccess.Context;
using Entities.CCC.Lookup;

namespace DataAccess.CCC.Repository.Lookup
{
    public class PatientTreatmentTrackerLookupRepository : BaseRepository<PatientTreamentTrackerLookup>, IPatientTreatmentTrackerLookupRepository
    {
        private readonly LookupContext _context;

        public PatientTreatmentTrackerLookupRepository() : this(new LookupContext())
        {

        }

        public PatientTreatmentTrackerLookupRepository(LookupContext context) : base(context)
       {
            _context = context;

       }

        public PatientTreamentTrackerLookup GetCurrentPatientRegimen(int patientId)
        {
            
            var patientRegimen =
                _context.PatientTreamentTrackerLookups.Where(x => x.PatientId == patientId && (x.TreatmentStatus == "Start Treatment" || x.TreatmentStatus == "DrugSwitches" || x.TreatmentStatus == "Continue current treatment" || x.TreatmentStatus == "Drug Substitution" || x.TreatmentStatus == "Drug Interruptions") && x.RegimenId>0)
                    .OrderByDescending(x => x.DispensedByDate)
                    .FirstOrDefault();
            return patientRegimen;
        }

        public PatientTreamentTrackerLookup GetPatientbaselineRegimenLookup(int patientId)
        {
            var patientRegimen =
                 _context.PatientTreamentTrackerLookups.Where(x => x.PatientId == patientId && (x.TreatmentStatus == "Start Treatment" || x.TreatmentStatus == "DrugSwitches" || x.TreatmentStatus == "Continue current treatment" || x.TreatmentStatus == "Drug Substitution" || x.TreatmentStatus == "Drug Interruptions") && x.RegimenStartDate != null && x.Regimen != null && x.Regimen != "Unknown" )
                     //.OrderBy(x => x.Id)
                     .OrderBy(x => x.RegimenStartDate)
                     .FirstOrDefault();
            return patientRegimen;
        }

        public List<PatientTreamentTrackerLookup> GetPatientTreatmentInterrupList(int patientId)
        {
            var interruptions =
                _context.PatientTreamentTrackerLookups.Where(
                        x => x.PatientId == patientId & x.TreatmentStatus == "Drug Interactions")
                    .OrderBy(x => x.Id)
                    .ToList();
            return interruptions;
        }

        public List<PatientTreamentTrackerLookup> GetPatientTreatmentSubstitutionList(int patientId)
        {
            var substitution =
                _context.PatientTreamentTrackerLookups.Where(x => x.PatientId == patientId & x.TreatmentStatus == "Drug Substitution")
                    .OrderBy(x => x.Id)
                    .ToList();
            return substitution;
        }

        public List<PatientTreamentTrackerLookup> GetPatientTreatmentSwitchesList(int patientId)
        {
            var switches =
                _context.PatientTreamentTrackerLookups.Where(
                    x => x.PatientId == patientId & x.TreatmentStatus == "DrugSwitches").OrderBy(x => x.Id).ToList();
            return switches;
        }
    }
}
