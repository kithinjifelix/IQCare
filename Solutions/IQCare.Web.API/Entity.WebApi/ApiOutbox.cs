﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entity.WebApi
{
    [Serializable]
    public class ApiOutbox
    {
        [Key]
        public int Id { get; set; }
        public DateTime DateSent { get; set; }
        public int RecepientId { get; set; }
        public string Message { get; set; }
        public int AttemptCount { get; set; }
        public string LogMessage { get; set; }

        public bool Retry => AttemptCount <= 5;
    }
}
