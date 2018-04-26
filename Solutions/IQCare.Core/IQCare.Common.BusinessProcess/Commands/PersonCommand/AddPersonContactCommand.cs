﻿using IQCare.Common.Core.Models;
using MediatR;

namespace IQCare.Common.BusinessProcess.Commands.PersonCommand
{
    public class AddPersonContactCommand : IRequest<Result<AddPersonContactResponse>>
    {
        public int PersonId { get; set; }
        public string PhysicalAddress { get; set; }
        public string MobileNumber { get; set; }
        public string AlternativeNumber { get; set; }
        public string EmailAddress { get; set; }
        public int UserId { get; set; }
    }

    public class AddPersonContactResponse
    {
        public int PersonContactId { get; set; }
    }
}