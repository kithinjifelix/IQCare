﻿using IQCare.CCC.UILogic;
using IQCare.CCC.UILogic.HIVEducation;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace IQCare.Web.CCC.WebService
{
    /// <summary>
    /// Summary description for FollowupEducationService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class FollowupEducationService : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public ArrayList GetGetCounsellingTopics(string counsellingtopics)
        {
            LookupLogic lookUp = new LookupLogic();
            DropDownList dll = new DropDownList();
            lookUp.populateDDL(dll, counsellingtopics);
            // String rows = "Rugute";
            //counsellingtopics = "1";
            //HIVEducationLogic hivEducation = new HIVEducationLogic();

            //DataTable theDT = hivEducation.getCounsellingTopics(counsellingtopics);

            ArrayList rows = new ArrayList();

            foreach (DataRow row in dll.Items)
            {
              string[] i = new string[2] { row["LookupItemId"].ToString(), row["DisplayName"].ToString() };
               rows.Add(i);
            }
            return rows;

            

        }

    }
}
