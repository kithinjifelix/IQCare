﻿using Entities.CCC.Neonatal;
using Entities.CCC.Encounter;
using System;
using System.Web.Services;
using IQCare.CCC.UILogic;
using IQCare.CCC.UILogic.Baseline;
using IQCare.CCC.UILogic.Encounter;
using System.Data;
using System.Web.Script.Serialization;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Services;
using Entities.CCC.Lookup;
using System.Linq;


namespace IQCare.Web.CCC.WebService
{
    /// <summary>
    /// Summary description for NeonatalEncounterService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class NeonatalEncounterService : System.Web.Services.WebService
    {

        private string Msg { get; set; }
        private int Result{get; set;}

        [WebMethod(EnableSession = true)]
        public string addNeonatalMilestones(int patientId, int patientMasterVisitId, int createdBy, int milestoneAssessed, DateTime milestoneOnsetDate, int milestoneAchieved, int milestoneStatus, string milestoneComment)
        {
            try
            {
                PatientMilestone patientNeonatal = new PatientMilestone()
                {
                    PatientId = patientId,
                    PatientMasterVisitId = patientMasterVisitId,
                    CreatedBy = createdBy,
                    MilestoneAssessedId = milestoneAssessed,
                    MilestoneDate = milestoneOnsetDate,
                    MilestoneAchievedId = milestoneAchieved,
                    MilestoneStatusId = milestoneStatus,
                    MilestoneComments = milestoneComment
                };
                var neonatal = new PatientNeonatalManager();
                //Check if milestone assessed exists
                var MilestonesLogic = new NeonatalHistoryLogic();
                List<PatientMilestone> list = new List<PatientMilestone>();
                list = MilestonesLogic.getMilestoneAssessed(milestoneAssessed);
                int existingMilestone = 0;
                foreach (var items in list)
                {
                    existingMilestone = items.MilestoneAssessedId;
                }

                if(existingMilestone == milestoneAssessed)
                {
                    Msg = "Existing";
                }
                else
                {
                    Result = neonatal.AddPatientNeonatal(patientNeonatal);
                    if (Result > 0)
                    {
                        Msg = "Neonatal Milestone Added Successfully!";
                    }
                }
            }
            catch(Exception e)
            {
                Msg = e.Message;
            }
            
            return Msg;
        }

        [WebMethod(EnableSession = true)]
        public string addImmunizationHistory(int patientId, int patientMasterVisitId, int createdBy, string immunizationPeriod, int immunizationGiven, DateTime immunizationDate)
        {
            try
            {
                PatientVaccination immunizationHistory = new PatientVaccination()
                {
                    PatientId = patientId,
                    PatientMasterVisitId = patientMasterVisitId,
                    CreatedBy = createdBy,
                    VaccineStage = immunizationPeriod,
                    Vaccine = immunizationGiven,
                    VaccineDate = immunizationDate
                };
                var ImmunizationHistory = new PatientVaccinationManager();
                Result = ImmunizationHistory.addPatientVaccination(immunizationHistory);
                if (Result > 0)
                {
                    Msg = "success"; 
                }
            }
            catch(Exception e)
            {
                Msg = e.Message;
            }
            return Msg;
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public ArrayList LoadImmunization()
        {
            LookupLogic ll = new LookupLogic();
            ArrayList rows = new ArrayList();
            var vaccineLogic = new PatientVaccinationManager();
            List<PatientVaccination> list = new List<PatientVaccination>();
            list = vaccineLogic.GetPatientVaccinations(Convert.ToInt32(Session["PatientPK"]));
            foreach (var items in list)
            {
                List<LookupItemView> lookupList = ll.GetItemIdByGroupAndItemName("ImmunizationPeriod", LookupLogic.GetLookupNameById(Convert.ToInt32(items.VaccineStage)).ToString());
                if (lookupList.Any())
                {
                    string[] i = new string[5] { items.Id.ToString(), LookupLogic.GetLookupNameById(Convert.ToInt32(items.VaccineStage)).ToString(), LookupLogic.GetLookupNameById(Convert.ToInt32(items.Vaccine)).ToString(), Convert.ToDateTime(items.VaccineDate).ToString("dd-MMM-yyyy"), "<button type='button' class='btnDelete btn btn-danger fa fa-minus-circle btn-fill' > Remove</button>" };
                    rows.Add(i);
                }
            }
            return rows;
        }

        [WebMethod]
        public string DeleteImmunization(int ImmunizationId)
        {
            try
            {
                var vaccineLogic = new PatientVaccinationManager();
                vaccineLogic.deletePatientVaccination(ImmunizationId);
                Msg = "Deleted";
            }
            catch (Exception e)
            {
                Msg = e.Message;
            }
            return Msg;
        }

        [WebMethod]
        public string updateNeonatalScreeningData(int patientId, int patientMasterVisitId, int screeningType, int screeningCategory, int screeningValue, int userId)
        {
            try
            {
                var NM = new PatientNeonatalManager();
                Result = NM.updateNeonatalScreeningData(patientId, patientMasterVisitId, screeningType, screeningCategory, screeningValue, userId);
                if (Result > 0)
                {
                    Msg = "Social History Added Successfully";
                }
            }
            catch (Exception e)
            {
                Msg = e.Message;
            }
            return Msg;
        }

        //[WebMethod(EnableSession = true)]
        //public string addPatientNeonatalHistory(int patientId, int patientMasterVisitId, string notes, int recordNeonatalHistory)
        //{
        //    try
        //    {
        //        var NeonatalNotes = new PatientNeonatalManager();
        //        Result = NeonatalNotes.addPatientNeonatalHistory(patientId,patientMasterVisitId, notes, recordNeonatalHistory);
        //        if(Result > 0)
        //        {
        //            Msg = "Neonatal notes added successfully";
        //        }
        //    }
        //    catch(Exception e)
        //    {
        //        Msg = e.Message;
        //    }
        //    return Msg;
        //}

        //[WebMethod(EnableSession = true)]
        //public string updatePatientNeonatalHistory(int patientId, int patientMasterVisitId, string notes,int recordNeonatalHistory, int notesid)
        //{
        //    try
        //    {
        //        var SH = new NeonatalHistoryLogic();
        //        Result = SH.updateNeonatalNotes(patientId, patientMasterVisitId, notes, recordNeonatalHistory, notesid);
        //        if (Result > 0)
        //        {
        //            Msg = "Neonatal Notes Updated Successfully";
        //        }
        //    }
        //    catch(Exception e)
        //    {
        //        Msg = e.Message;
        //    }
        //    return Msg;
        //}

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public ArrayList LoadMilestones()
        {
            ArrayList rows = new ArrayList();
            var MilestonesLogic = new NeonatalHistoryLogic();
            List<PatientMilestone> list = new List<PatientMilestone>();
            list = MilestonesLogic.getPatientMilestones(Convert.ToInt32(Session["PatientPK"]));
            if(list.Any())
            {
                foreach (var items in list)
                {
                    string milestoneAssessed = LookupLogic.GetLookupNameById(items.MilestoneAssessedId).ToString();
                    string[] i = new string[7] { items.Id.ToString(), LookupLogic.GetLookupNameById(items.MilestoneAssessedId).ToString(), items.MilestoneDate.ToString("dd-MMM-yyyy"), items.MilestoneAchievedId == 1 ? "Yes" : "No", LookupLogic.GetLookupNameById(items.MilestoneStatusId).ToString(), items.MilestoneComments.ToString(), "<button type='button' class='btnDelete btn btn-danger fa fa-minus-circle btn-fill' > Remove</button>" };
                    rows.Add(i);
                }
            }
            return rows;
        }
        

        [WebMethod]
        public string DeleteMilestone(int milestoneId)
        {
            try
            {
                var milestoneLogic  = new NeonatalHistoryLogic();
                milestoneLogic.DeleteMilestone(milestoneId);
                Msg = "Deleted";
            }
            catch (Exception e)
            {
                Msg = e.Message;
            }
            return Msg;
        }
    }
}
