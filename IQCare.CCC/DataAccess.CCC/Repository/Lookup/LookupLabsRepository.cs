﻿using System;
using System.Collections.Generic;
using System.Linq;
using DataAccess.CCC.Context;
using DataAccess.CCC.Interface.Lookup;
using DataAccess.Context;
using Entities.CCC.Lookup;

namespace DataAccess.CCC.Repository.Lookup
{
    public class LookupLabsRepository : BaseRepository<LookupLabs>, ILookupLabs
    {
        private readonly LookupContext _context;

        public LookupLabsRepository() : this(new LookupContext())
        {
        }

        public LookupLabsRepository(LookupContext context) : base(context)
        {
            _context = context;
        }

        public List<LookupLabs> FindBy(Func<LookupLabs, bool> p)
        {
            var results = _context.LookupLaboratories.Where(p);


            return results.ToList();
        }

        public List<LookupLabs> GetLabs()
        {
            ILookupLabs labsRepository = new LookupLabsRepository();
            var list = labsRepository.GetAll().GroupBy(x => x.Id).Select(x => x.First()).OrderBy(l => l.Id);
            return list.ToList();
        }

        public LookupLabs GetLabTestId(string labType)
        {
            ILookupLabs labsRepository = new LookupLabsRepository();
            var labTestId = labsRepository.FindBy(x => x.Name == labType).FirstOrDefault();
            return labTestId;

        }
    }
}
