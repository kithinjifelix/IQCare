﻿using System.Collections.Generic;
using IQ.ApiLogic.Model;

namespace IQ.ApiLogic.Infrastructure.Interface
{
    public interface IApiOutboxManager
    {
        int AddApiOutbox(ApiOutbox apiOutbox);
        int AddApiProcessed(ApiOutbox apiOutbox);
        List<ApiOutbox> GetAllUnsentMessages();
    }
}
