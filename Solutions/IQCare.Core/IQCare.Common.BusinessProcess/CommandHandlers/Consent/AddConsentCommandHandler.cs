﻿using System;
using System.Threading;
using System.Threading.Tasks;
using IQCare.Common.BusinessProcess.Commands.Consent;
using IQCare.Common.Core.Models;
using IQCare.Common.Infrastructure;
using MediatR;
using Microsoft.EntityFrameworkCore;

namespace IQCare.Common.BusinessProcess.CommandHandlers.Consent
{
    public class AddConsentCommandHandler : IRequestHandler<AddConsentCommand, Result<AddConsentResponse>>
    {
        private readonly ICommonUnitOfWork _unitOfWork;
        public AddConsentCommandHandler(ICommonUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork ?? throw new ArgumentNullException(nameof(unitOfWork));
        }

        public async Task<Result<AddConsentResponse>> Handle(AddConsentCommand request, CancellationToken cancellationToken)
        {
            try
            {
                for (int i = 0; i < request.ConsentType.Count; i++)
                {
                    var consent = request.ConsentType[i];
                    var consentType = await _unitOfWork.Repository<LookupItemView>().Get(x => x.MasterName == "ConsentType" && x.ItemName == consent.Key).FirstOrDefaultAsync();
                    int consentTypeId = consentType != null ? consentType.ItemId : 0;


                    PatientConsent patientConsent = new PatientConsent()
                    {
                        PatientId = request.PatientID,
                        PatientMasterVisitId = request.PatientMasterVisitId,
                        ServiceAreaId = request.ServiceAreaId,
                        ConsentValue = consent.Value,
                        ConsentType = consentTypeId,
                        DeclineReason = request.DeclineReason,
                        ConsentDate = request.ConsentDate,
                        DeleteFlag = false,
                        CreatedBy = request.UserId,
                        CreateDate = DateTime.Now
                    };

                    await _unitOfWork.Repository<PatientConsent>().AddAsync(patientConsent);
                    await _unitOfWork.SaveAsync();
                }

                return Result<AddConsentResponse>.Valid(new AddConsentResponse()
                {
                    IsConsentAdded = true
                });
            }
            catch (Exception e)
            {
                return Result<AddConsentResponse>.Invalid(e.Message);
            }
        }
    }
}