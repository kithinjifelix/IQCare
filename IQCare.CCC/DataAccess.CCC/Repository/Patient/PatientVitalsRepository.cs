﻿using System.Linq;
using DataAccess.CCC.Context;
using DataAccess.CCC.Interface.Patient;
using DataAccess.Context;
using Entities.CCC.Triage;

namespace DataAccess.CCC.Repository.Patient
{
    public class PatientVitalsRepository : BaseRepository<PatientVital>, IPatientVitalsRepository
    {
        public PatientVitalsRepository() : this(new GreencardContext())
        {
        }

        public PatientVitalsRepository(GreencardContext context) : base(context)
        {
        }

        public PatientVital GetByPatientId(int patientId)
        {
            IPatientVitalsRepository patientVitalsRepository = new PatientVitalsRepository();
            PatientVital patientVital = patientVitalsRepository.FindBy(p => p.PatientId == patientId).FirstOrDefault();
            return patientVital;
        }
    }
}