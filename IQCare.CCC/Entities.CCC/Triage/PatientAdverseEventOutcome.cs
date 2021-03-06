﻿using Entities.CCC.Visit;
using Entities.Common;
using Entities.PatientCore;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Entities.CCC.Enrollment;

namespace Entities.CCC.Triage
{
    [Serializable]
    [Table("PatientAdverseEventOutcome")]
  public  class PatientAdverseEventOutcome :BaseEntity
    {
        [Column]
        [Key]
        public int Id { get; set; }

        [Required] 
        public int PatientId { get; set; }
        [ForeignKey("PatientId")]
        public virtual PatientEntity Patient { get; set; }

        [Required]
        public int PatientMasterVisitid { get; set; }
        public virtual PatientMasterVisit PatientMasterVisit { get; set; }

        [Required]
        public int AdverseEventId { get; set; }
      //  [ForeignKey("PatientAdverseEventId")]
        //public virtual PatientAdverseEvent PatientAdverseEvent { get; set; }

        [Required]
        public int OutcomeId { get; set; }

        [Required]
        public DateTime OutcomeDate { get; set; }

        [Required]
        public int UserId { get; set; }


    }

}
