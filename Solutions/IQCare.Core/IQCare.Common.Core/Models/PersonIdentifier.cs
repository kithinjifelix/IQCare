﻿using System;

namespace IQCare.Common.Core.Models
{
    public class PersonIdentifier
    {
        public int Id { get; set; }

        public int PersonId { get; set; }

        public int IdentifierId { get; set; }

        public string IdentifierValue { get; set; }

        public bool DeleteFlag { get; set; }

        public int CreatedBy { get; set; }

        public DateTime CreateDate { get; set; }

        public string AuditData { get; set; }
    }
}