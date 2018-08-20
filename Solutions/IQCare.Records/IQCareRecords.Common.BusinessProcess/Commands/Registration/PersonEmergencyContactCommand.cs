﻿using System;
using System.Collections.Generic;
using System.Text;
using Entities.Records;
using MediatR;

namespace IQCareRecords.Common.BusinessProcess.Commands
{
  public  class PersonEmergencyContactCommand: IRequest<Result<AddPersonEmergencyContactResponse>>
    {
        public int PersonId { get; set; }

        public string firstname { get; set; }

        public string middlename { get; set; }

        public string lastname { get; set; }

        public int gender { get; set; }

        public int EmergencyContactPersonId { get; set; }

        public string MobileContact { get; set; }

        public int?  Id { get; set; }

        public int CreatedBy { get; set; }

     //   public int RelationshipType { get; set; }


    }

    public class AddPersonEmergencyContactResponse
    {
        public string Message { get; set; }
    }
}
