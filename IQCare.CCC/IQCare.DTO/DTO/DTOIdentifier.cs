﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IQCare.DTO.DTO
{
    public class DTOIdentifier
    {
        public string IdentifierValue { get; set; }
        public string IdentifierType { get; set; }
        public string AssigningAuthority { get; set; }
    }
    public class DTOPerson
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public bool DobPrecision { get; set; }
        public string Sex { get; set; }
        public string MobileNumber { get; set; }
        public string PhysicalAddress { get; set; }
    }
}
