﻿using IQCare.CCC.UILogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IQCare.Web.CCC.Encounter
{
    public partial class EncounterHistory : System.Web.UI.Page
    {
        PatientEncounterLogic PEL = new PatientEncounterLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            PEL.EncounterHistory(TreeViewEncounterHistory);
        }
    }
}