﻿using System;
using DataAccess.CCC.Context;
using DataAccess.CCC.Interface.Patient;
using DataAccess.Context;

namespace DataAccess.CCC.Repository.Patient
{
    public class PatientRepository : BaseRepository<Entities.CCC.Enrollment.PatientEntity>, IPatientRepository
    {
        private GreencardContext _context;

        public PatientRepository():this(new GreencardContext())
        {

        }

        public PatientRepository(GreencardContext context) : base(context)
        {
            _context = context;
        }

    }
    public class PatientPersonViewRepository : BaseRepository<Entities.CCC.Enrollment.PatientPersonViewEntity>, IPatientPersonViewRepository
    {
        private GreencardContext _context;

        public PatientPersonViewRepository() : this(new GreencardContext())
        {

        }

        public PatientPersonViewRepository(GreencardContext context) : base(context)
        {
            _context = context;
        }

    }
}
