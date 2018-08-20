﻿using DataAccess.Base;
using DataAccess.Common;
using DataAccess.Entity;
using DataAccess.Records;
using DataAccess.Records.Context;
using Entities.Records;
using Entities.Records.Enrollment;
using Interface.Records.Patient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessProcess.Records.Patient
{
    public class BPatient : ProcessBase,IPatientManager
    { 
    public int AddPatient(PatientEntity patient)
    {
        int patientId = 0;
        ClsObject obj = new ClsObject();
        ClsUtility.Init_Hashtable();
        ClsUtility.AddExtendedParameters("@PersonId", SqlDbType.Int, patient.PersonId);
        ClsUtility.AddExtendedParameters("@ptn_pk", SqlDbType.Int, patient.ptn_pk);
        ClsUtility.AddExtendedParameters("@PatientIndex", SqlDbType.VarChar, patient.PatientIndex);
        ClsUtility.AddExtendedParameters("@DateOfBirth", SqlDbType.DateTime, patient.DateOfBirth);
        ClsUtility.AddExtendedParameters("@NationalId", SqlDbType.VarChar, patient.NationalId);
        ClsUtility.AddExtendedParameters("@FacilityId", SqlDbType.Int, patient.FacilityId);
        ClsUtility.AddExtendedParameters("@UserId", SqlDbType.Int, patient.CreatedBy);
        ClsUtility.AddExtendedParameters("@Active", SqlDbType.Bit, patient.Active);
        ClsUtility.AddExtendedParameters("@PatientType", SqlDbType.Int, patient.PatientType);
        ClsUtility.AddExtendedParameters("@DobPrecision", SqlDbType.Bit, patient.DobPrecision);


        DataTable dt = (DataTable)obj.ReturnObject(ClsUtility.theParams, "Patient_Insert", ClsUtility.ObjectEnum.DataTable);
        if (dt != null && dt.Rows.Count > 0)
        {
            patientId = Convert.ToInt32(dt.Rows[0]["Id"]);
        }

        return patientId;
        /*_unitOfWork.PatientRepository.Add(patient);
        Result = _unitOfWork.Complete();
        return patient.Id;*/
    }

    public int DeletePatient(int id)
    {
        throw new NotImplementedException();
    }

    public PatientEntity GetPatient(int id)
    {
        using (UnitOfWork unitOfWork = new UnitOfWork(new RecordContext()))
        {
            var patientInfo = unitOfWork.PatientRepository.GetById(id);
            unitOfWork.Dispose();
            return patientInfo;
        }

    }

    public int UpdatePatient(PatientEntity patient, int id)
    {
        int patientId = -1;
        ClsObject obj = new ClsObject();
        ClsUtility.Init_Hashtable();

        ClsUtility.AddExtendedParameters("@ptn_pk", SqlDbType.Int, patient.ptn_pk);
        ClsUtility.AddExtendedParameters("@DateOfBirth", SqlDbType.DateTime, patient.DateOfBirth);
        ClsUtility.AddExtendedParameters("@NationalId", SqlDbType.VarChar, patient.NationalId);
        ClsUtility.AddExtendedParameters("@FacilityId", SqlDbType.Int, patient.FacilityId);
        ClsUtility.AddExtendedParameters("@AuditData", SqlDbType.Xml, patient.AuditData);
        ClsUtility.AddExtendedParameters("@Id", SqlDbType.Int, id);

        DataTable dt = (DataTable)obj.ReturnObject(ClsUtility.theParams, "Patient_Update", ClsUtility.ObjectEnum.DataTable);
        if (dt != null && dt.Rows.Count > 0)
        {
            patientId = Convert.ToInt32(dt.Rows[0]["Id"]);
        }
        return patientId;
    }

    public List<PatientEntity> CheckPersonEnrolled(int persionId)
    {
        using (UnitOfWork unitOfWork = new UnitOfWork(new RecordContext()))
        {
            List<PatientEntity> person = unitOfWork.PatientRepository.FindBy(x => x.PersonId == persionId).ToList();
            unitOfWork.Dispose();
            return person;
        }
    }

    public int GetPatientType(int patientId)
    {
        using (UnitOfWork unitOfWork = new UnitOfWork(new RecordContext()))
        {
            var patientTypeId = unitOfWork.PatientRepository.FindBy(x => x.Id == patientId & !x.DeleteFlag)
                                .Select(x => x.PatientType).FirstOrDefault();
            unitOfWork.Dispose();
            return patientTypeId;
            //return patientTypeId.FirstOrDefault();
        }
    }

    public void UpdatePatientType(int PatientId, int PatientType)
    {
        ClsObject obj = new ClsObject();
        ClsUtility.Init_Hashtable();

        ClsUtility.AddExtendedParameters("@PatientId", SqlDbType.Int, PatientId);
        ClsUtility.AddExtendedParameters("@PatientType", SqlDbType.Int, PatientType);

        int i = (int)obj.ReturnObject(ClsUtility.theParams, "PatientType_Update", ClsUtility.ObjectEnum.ExecuteNonQuery);
    }

    public List<PatientRegistrationLookup> GetPatientIdByPersonId(int personId)
    {
        using (UnitOfWork unitOfWork = new UnitOfWork(new LookupContext()))
        {
            List<PatientRegistrationLookup> patientRegistrationLookups = new List<PatientRegistrationLookup>();

            bool patientExists = unitOfWork.PatientRegistrationLookupRepository.FindBy(x => x.PersonId == personId)
                .Any();
            if (patientExists)
            {
                patientRegistrationLookups = unitOfWork.PatientRegistrationLookupRepository.FindBy(x => x.PersonId == personId).ToList();
            }
            unitOfWork.Dispose();
            return patientRegistrationLookups;
        }
    }
}
}
