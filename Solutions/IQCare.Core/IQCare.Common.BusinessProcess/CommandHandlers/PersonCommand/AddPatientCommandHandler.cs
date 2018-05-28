﻿using System;
using System.Threading;
using System.Threading.Tasks;
using IQCare.Common.BusinessProcess.Commands.PersonCommand;
using IQCare.Common.BusinessProcess.Services;
using IQCare.Common.Core.Models;
using IQCare.Common.Infrastructure;
using MediatR;

namespace IQCare.Common.BusinessProcess.CommandHandlers.PersonCommand
{
    public class AddPatientCommandHandler : IRequestHandler<AddPatientCommand, Result<AddPatientResponse>>
    {
        private readonly ICommonUnitOfWork _unitOfWork;
        public AddPatientCommandHandler(ICommonUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
        }

        public async Task<Result<AddPatientResponse>> Handle(AddPatientCommand request, CancellationToken cancellationToken)
        {
            try
            {
                using (_unitOfWork)
                {
                    RegisterPersonService registerPersonService = new RegisterPersonService(_unitOfWork);
                    var patient = await registerPersonService.AddPatient(request.PersonId, request.UserId);

                    return Result<AddPatientResponse>.Valid(new AddPatientResponse()
                    {
                        PatientId = patient.Id
                    });
                }
            }
            catch (Exception e)
            {
                return Result<AddPatientResponse>.Invalid(e.Message);
            }
        }
    }
}