﻿using Application.Presentation;
using Entities.CCC.Lookup;
using Interface.CCC.Lookup;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
namespace IQCare.CCC.UILogic
{
    public class LookupLogic
    {

        public static string GeSubCountyListJson(string county)
        {
            string jsonObject = "[]";
            ILookupManager lookupManager = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
            List<LookupCounty> lookupCounties = lookupManager.GetLookupSubcounty(county);

            if (lookupCounties != null && lookupCounties.Count > 0)
            {
                jsonObject = new JavaScriptSerializer().Serialize(lookupCounties);
            }
            else
            {
                jsonObject = "[]";
            }
            return jsonObject;
        }

        public static string GetLookupWardListJson(string subcounty)
        {
            string jsonObject;
            ILookupManager lookupManager = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
           List<LookupCounty> lookupwardsList = lookupManager.GetLookupWards(subcounty);

            if (lookupwardsList != null && lookupwardsList.Count > 0)
            {
                jsonObject = new JavaScriptSerializer().Serialize(lookupwardsList);
            }
            else
            {
                jsonObject = "[]";
            }
            return jsonObject;
        }

        /* pw getlablist implementation   */
        public static string GetLookupLabsListJson()
        {
            string jsonObject;
            ILookupManager lookupManager = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
            List<LookupLabs> lookuplabsList = lookupManager.GetLookupLabs();   //Interface ==>similar declaration

            if (lookuplabsList != null && lookuplabsList.Count > 0)
            {
                jsonObject = new JavaScriptSerializer().Serialize(lookuplabsList);
            }
            else
            {
                jsonObject = "[]";
            }
            return jsonObject;
        }
        /* pw .getlablist implementation   */
        /* pw get previous lab list implementation   */
        public static string GetLookupPreviousLabsListJson(int patientId)
        {
            string jsonObject;
            ILookupManager lookupManager = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
            List<LookupPreviousLabs> lookupprevlabsList = lookupManager.GetLookupPreviousLabs(patientId);   //Interface ==>similar declaration

            if (lookupprevlabsList != null && lookupprevlabsList.Count > 0)
            {
                jsonObject = new JavaScriptSerializer().Serialize(lookupprevlabsList);
            }
            else
            {
                jsonObject = "[]";
            }
            return jsonObject;
        }
        /* pw .previous lab list implementation   */
    }
}
