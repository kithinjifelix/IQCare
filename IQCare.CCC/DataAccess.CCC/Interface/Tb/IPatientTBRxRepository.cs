﻿using System.Collections.Generic;
using DataAccess.Context;
using Entities.CCC.Tb;

namespace DataAccess.CCC.Interface.Tb
{
    public interface IPatientTBRxRepository : IRepository<PatientTBRx>
    {
        List<PatientTBRx> GetByPatientId(int patientId);
    }
}
