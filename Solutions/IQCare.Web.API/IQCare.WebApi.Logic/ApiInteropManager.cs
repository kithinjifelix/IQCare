﻿using Entity.WebApi;
using Interface.WebApi;

namespace IQCare.WebApi.Logic
{
    public class ApiInteropManager : IApiInteropSystemsManager
    {
            private IApiInteropSystemsManager _apiInteropSystemsManager  = (IApiInteropSystemsManager)Application.Presentation.ObjectFactory.CreateInstance("IQCare.Web.ApiLogic.Infrastructure.BusinessProcess.BPApiInteropSystems, IQCare.Web.ApiLogic");

        public int AddApiInteroperabilitySystems(ApiInteropSystem apiInteropSystem)
        {
            return _apiInteropSystemsManager.AddApiInteroperabilitySystems(apiInteropSystem);
        }

        public int EditApiInteroperabilitySystems(ApiInteropSystem apiInteropSystem)
        {
            return _apiInteropSystemsManager.EditApiInteroperabilitySystems(apiInteropSystem);
        }
    }
}
