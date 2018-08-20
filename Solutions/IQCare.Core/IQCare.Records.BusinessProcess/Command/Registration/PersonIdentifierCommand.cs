﻿using IQCare.Common.Core.Models;
using MediatR;
using System;
using System.Collections.Generic;
using System.Text;

namespace IQCareRecords.Common.BusinessProcess.Command
{
   public class PersonIdentifierCommand:IRequest<Result<AddPersonIdentifierResponse>>
    {
        public int PersonId { get; set; }

        public int IdentifierId { get; set; }

        public string IdentifierValue { get; set; }

        public int UserId { get; set; }



    }


    public class AddPersonIdentifierResponse
    {
        public string Message { get; set; }
    }
}
