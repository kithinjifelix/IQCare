﻿using System.Collections.Generic;
using Interface.CCC.Lookup;
using Application.Common;
using Application.Presentation;
using Entities.CCC.Lookup;

namespace IQCare.CCC.UILogic
{
    public class PersonLookUpManager
    {
        readonly IPersonLookUpManager _personLookUpManager = (IPersonLookUpManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BPersonLookUpManager, BusinessProcess.CCC");
        Utility _utility = new Utility();

        public PersonLookUp GetPersonById(int id)
        {
            return _personLookUpManager.GetPersonById(id);
        }

        public List<PersonLookUp> GetPersonSearchResults(string firstName, string middleName, string lastName, string dob,int sex)
        {
            return _personLookUpManager.GetPatientSearchresults(firstName, middleName, lastName, dob ,sex);
        }
    }
}
