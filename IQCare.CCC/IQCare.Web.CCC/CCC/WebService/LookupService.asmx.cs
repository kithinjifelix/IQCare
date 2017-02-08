﻿
using System;
using System.Web.Services;
using IQCare.CCC.UILogic;

namespace IQCare.Web.CCC.WebService
{
    /// <summary>
    /// Summary description for LookupService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class LookupService : System.Web.Services.WebService
    {
        private string _jsonObject;

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string GetLookupSubcountyList(string county)
        {
           _jsonObject=  LookupLogic.GeSubCountyListJson(county);
            //ILookupManager lookupManager = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
            //List<LookupCounty> lookupCounties = lookupManager.GetLookupSubcounty(county);
            //if (lookupCounties != null && lookupCounties.Count > 0)
            //{
            //    jsonObject = new JavaScriptSerializer().Serialize(lookupCounties);
            //}
            //else
            //{
            //    jsonObject = "[]";
            //}
            return _jsonObject;
        }

        [WebMethod]
        public string GetLookupWardList(string subcounty)
        {
            //string jsonObject;
            //ILookupManager lookupManager = (ILookupManager)ObjectFactory.CreateInstance("BusinessProcess.CCC.BLookupManager, BusinessProcess.CCC");
            //List<LookupCounty> lookupwardsList = lookupManager.GetLookupWards(subcounty);
            //if (lookupwardsList != null && lookupwardsList.Count > 0)
            //{
            //    jsonObject = new JavaScriptSerializer().Serialize(lookupwardsList);
            //}
            //else
            //{
            //    jsonObject = "[]";
            //}
            //return jsonObject;

            _jsonObject = LookupLogic.GetLookupWardListJson(subcounty);
            return _jsonObject;
        }

        [WebMethod]
        public string GetLookUpItemByName(string itemName)
        {
            try
            {
                _jsonObject =LookupLogic.GetLookupItemByName(itemName);    
            }
            catch (Exception e)
            {
                _jsonObject = e.Message;
            }
            return _jsonObject;
        }

        [WebMethod]
        public string GetLookUpItemViewByMasterName(string masterName)
        {
            try
            {
                _jsonObject = LookupLogic.GetLookUpItemViewByMasterName(masterName);
            }
            catch (Exception e)
            {
                _jsonObject = e.Message;
            }

            return _jsonObject;
        }
    }
}
