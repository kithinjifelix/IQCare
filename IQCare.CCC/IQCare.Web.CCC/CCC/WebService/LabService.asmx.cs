﻿using System;
using System.Web;
using System.Web.Services;
using IQCare.CCC.UILogic;
using Entities.CCC.Visit;
using Interface.CCC.Visit;
using Entities.CCC.Encounter;
using Interface.CCC.Encounter;
using Application.Presentation;
using Entities.CCC.Lookup;
using Interface.CCC.Lookup;
using System.Collections.Generic;
using IQCare.Web.Laboratory;

namespace IQCare.Web.CCC.WebService
{
    public class PatientViralLoad
    {
        public int Id { get; set; }
        public int LabOrderId { get; set; }
        public int LabTestId { get; set; }
        public int LabOrderTestId { get; set; }
        public int ParameterId { get; set; }
        public decimal ResultValue { get; set; }
        public DateTime CreateDate { get; set; }
        public decimal Undetectable { get; set; }
        public decimal DetectionLimit { get; set; }
        public int Month { get; set; }
    }

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LabService : System.Web.Services.WebService
    {

        private readonly IPatientMasterVisitManager _visitManager = (IPatientMasterVisitManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.visit.BPatientmasterVisit, BusinessProcess.CCC");
        private readonly ILookupManager _lookupManager = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
        private readonly IPatientLabOrderManager _lookupData = (IPatientLabOrderManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.visit.BPatientLabOrdermanager, BusinessProcess.CCC");
        private int facilityID { get; set; }
        private int patientId;
        private int locationId;
        private int labOrderId;
        private String theUrl;
        private string Msg { get; set; }
        private int Result { get; set; }
        private int Ptn_pk;



        [WebMethod(EnableSession = true)]
        public string AddLabOrder(int patient_ID, int patient_Pk, int patientMasterVisitId, string patientLabOrder)
        {

            LookupFacility facility = _lookupManager.GetFacility();
            facilityID = facility.FacilityID;
            var labOrder = new PatientLabOrderManager();

            if (patient_ID > 0)
            {
                labOrder.savePatientLabOrder(patient_ID, patient_Pk, facilityID, patientMasterVisitId, patientLabOrder);
                Msg = "Patient Lab Order Recorded Successfully .";

            }
            else
            {

                Msg = "Patient Lab Order Not Recorded Successfully .";
            }
            return Msg;
        }

        [WebMethod(EnableSession = true)]
        public string AddResults(int PatientId)
        {
            List<KeyValuePair<string, object>> param = new List<KeyValuePair<string, object>>();
            PatientLookup patient = _lookupManager.GetPatientPtn_pk(PatientId);
            patientId = patient.ptn_pk ?? 0;

            LookupFacility facility = _lookupManager.GetFacility();
            locationId = facility.FacilityID;

            param.Add(new KeyValuePair<string, object>("PatientID", patientId));
            param.Add(new KeyValuePair<string, object>("LocationID", locationId));

            Session[SessionKey.LabClient] = param;

            return Convert.ToString(Session[SessionKey.LabClient]);

        }

        [WebMethod(EnableSession = true)]
        public string GetLookupPreviousLabsList()
        {


            int patientId = Convert.ToInt32(HttpContext.Current.Session["PatientId"]);

            string jsonObject = LookupLogic.GetLookupPreviousLabsListJson(patientId);

            return jsonObject;
        }
        [WebMethod(EnableSession = true)]
        public string GetLookupPendingLabsList(string patient_ID)
        {


            int patientId = Convert.ToInt32(patient_ID);
            string jsonObject = LookupLogic.GetLookupPendingLabsListJson(patientId);

            return jsonObject;
        }


        [WebMethod(EnableSession = true)]
        public string GetvlTests(string patient_ID)
        {


            int patientId = Convert.ToInt32(patient_ID);
            string jsonObject = LookupLogic.GetvlTestsJson(patientId);

            return jsonObject;
        }

        [WebMethod(EnableSession = true)]
        public string GetPendingvlTests(string patient_ID)
        {


            int patientId = Convert.ToInt32(patient_ID);
            string jsonObject = LookupLogic.GetPendingvlTestsJson(patientId);

            return jsonObject;
        }

        [WebMethod(EnableSession = true)]
        public List<PatientViralLoad> GetViralLoad()
        {
            int PatientId = Convert.ToInt32(HttpContext.Current.Session["PatientId"]);
            PatientLookup ptpk = _lookupManager.GetPatientPtn_pk(PatientId);
            if (ptpk.ptn_pk != null)
            {
                Ptn_pk = ptpk.ptn_pk.Value;
            }

            LabOrderEntity labId = _lookupData.GetPatientLabOrder(Ptn_pk);
            if (labId.Id != null)
            {
                labOrderId = labId.Id;
            }

            List<PatientViralLoad> patientViralDetails = new List<PatientViralLoad>();
            List<LabResultsEntity> list_vl = _lookupData.GetPatientVL(labOrderId);

            if (list_vl != null)
            {
                foreach (var item in list_vl)
                {
                    PatientViralLoad vl = new PatientViralLoad();

                    vl.ResultValue = item.ResultValue;
                    vl.Month = item.CreateDate.Month;

                    patientViralDetails.Add(vl);
                }
            }
            return patientViralDetails;

        }

    }

}

