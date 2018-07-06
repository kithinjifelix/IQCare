﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Web.UI.WebControls;
using Application.Presentation;
using Entities.CCC.Lookup;
using Interface.CCC.Lookup;
using System.Web.UI;
using IQCare.Web.UILogic;

namespace IQCare.Web.CCC.Patient
{
    public partial class PatientRegistration : System.Web.UI.Page
    {
        protected int UserId
        {
            get { return Convert.ToInt32(Session["AppUserId"]); }
        }

        public int PersonId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["PersonId"] = 0;
            Session["PersonId"] = 0;
            Session["PersonGuardianId"] = 0;
            Session["PersonTreatmentSupporterId"] = 0;
            Session["PersonContactId"] = 0;
            Session["PersonTreatmentSupporterId"] = 0;
            Session["DobPrecision"] = false;



            if (!IsPostBack)
            {
                ILookupManager mgr =
                    (ILookupManager)
                    ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
                List<LookupItemView> vw = mgr.GetGenderOptions();
                if (vw != null && vw.Count > 0)
                {
                    Gender.Items.Add(new ListItem("select", "0"));
                    GuardianGender.Items.Add(new ListItem("select", "0"));
                    tsGender.Items.Add(new ListItem("select", "0"));

                    foreach (var item in vw)
                    {
                        Gender.Items.Add(new ListItem(item.ItemName, item.ItemId.ToString()));
                        GuardianGender.Items.Add(new ListItem(item.ItemName, item.ItemId.ToString()));
                        tsGender.Items.Add(new ListItem(item.ItemName, item.ItemId.ToString()));
                    }

                    //
                    // vw.ForEach(item=> { Sex.Items.Add(new ListItem(item.ItemName, item.ItemId.ToString())); });
                }

                List<LookupItemView> ms = mgr.GetLookItemByGroup("MaritalStatus");
                if (ms != null && ms.Count > 0)
                {
                    MaritalStatusId.Items.Add(new ListItem("select", "0"));
                    foreach (var k in ms)
                    {
                        MaritalStatusId.Items.Add(new ListItem(k.ItemName, k.ItemId.ToString()));
                    }
                }

                List<LookupItemView> lookItemByGroup = mgr.GetLookItemByGroup("YesNo");
                if (lookItemByGroup != null && lookItemByGroup.Count > 0)
                {
                    Inschool.Items.Add(new ListItem("select", "0"));
                    ChildOrphan.Items.Add(new ListItem("select", "0"));
                    ISGuardian.Items.Add(new ListItem("select", "0"));
                    foreach (var k in lookItemByGroup)
                    {
                        Inschool.Items.Add(new ListItem(k.ItemName, k.ItemId.ToString()));
                        ChildOrphan.Items.Add(new ListItem(k.ItemName, k.ItemId.ToString()));
                        ISGuardian.Items.Add(new ListItem(k.ItemName, k.ItemId.ToString()));
                    }
                }

                List<LookupCounty> ct = mgr.GetLookupCounties();

                if (ct != null && ct.Count > 0)
                {
                    countyId.Items.Add(new ListItem("select", "0"));
                    foreach (var item in ct)
                    {
                        countyId.Items.Add(new ListItem(item.CountyName, item.CountyId.ToString()));
                    }
                }

                //List<LookupItemView> keyPopulationList = mgr.GetLookItemByGroup("KeyPopulation");
                //if (keyPopulationList != null && keyPopulationList.Count > 0)
                //{
                //    KeyPopulationCategoryId.Items.Add(new ListItem("select", "0"));
                //    foreach (var item in keyPopulationList)
                //    {
                //        KeyPopulationCategoryId.Items.Add(new ListItem(item.ItemDisplayName, item.ItemId.ToString()));
                //    }
                //}

                List<LookupItemView> patientTypes = mgr.GetLookItemByGroup("PatientType");
                if (patientTypes != null && patientTypes.Count > 0)
                {
                    foreach (var item in patientTypes)
                    {
                        PatientTypeId.Items.Add(new ListItem(item.ItemName, item.ItemId.ToString()));
                    }
                }

                List<LookupItemView> popTypes = mgr.GetLookItemByGroup("PopulationType");
                if (popTypes != null && popTypes.Count > 0)
                {
                    foreach (var item in popTypes)
                    {
                        PopulationType.Items.Add(new ListItem(item.DisplayName, item.ItemId.ToString()));
                    }
                }

                Session["PersonId"] = 0;
            }
        }

        protected void countyId_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            //ILookupManager lookupManager = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
            //List<LookupCounty> lookupCounties = lookupManager.GetLookupSubcounty(countyId.SelectedItem.Text);
            //if (lookupCounties != null && lookupCounties.Count > 0)
            //{
            //    foreach (var items in lookupCounties)
            //    {
            //        SubcountyId.Items.Add(new ListItem(items.SubcountyName, items.SubcountyId.ToString()));
            //    }
            //}
        }
        
        [WebMethod(EnableSession = true)]
        public static string RedirectToRegistrationEdit(string personId,string isEnrolled)
        {
            HttpContext.Current.Session["editPersonId"] = Convert.ToInt32(personId);
            return "success";
        }

        protected void WardId_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SubcountyId_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ILookupManager lookupManager = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
            //List<LookupCounty> lookupCounties = lookupManager.GetLookupWards(SubcountyId.SelectedItem.Text);
            //if (lookupCounties != null && lookupCounties.Count > 0)
            //{
            //    foreach (var items in lookupCounties)
            //    {
            //        WardId.Items.Add(new ListItem(items.WardName, items.WardId.ToString()));
            //    }
            //}
        }

        [WebMethod(EnableSession = true)]
        public static void SetDobPrecisionSession(bool dobPrecision)
        {
            HttpContext.Current.Session["DobPrecision"] = dobPrecision;
        }
    }
}