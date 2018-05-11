﻿using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Application.Presentation;
using Interface.Security;
using IQCare.Web.UILogic;
namespace IQCare.Web.MasterPage
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        private String strPathAndQuery;
        private String strUrl;

        /// <summary>
        /// Gets the page script manager.
        /// </summary>
        /// <value>
        /// The page script manager.
        /// </value>
        public ScriptManager PageScriptManager
        {
            get
            {
                return this.masterScriptManager;
            }
        }

        public string SessionExpireDestinationUrl
        {
            get { return Page.ResolveUrl("~/frmLogin.aspx"); }
        }

        public int SessionLengthMinutes
        {
            get { return 60; }
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/frmLogOff.aspx");
        }

        protected void lnkPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AdminForms/frmAdmin_ChangePassword.aspx");
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            //string path = HttpContext.Current.Request.Url.AbsolutePath;
            strPathAndQuery = HttpContext.Current.Request.Url.PathAndQuery;
            strUrl = HttpContext.Current.Request.Url.AbsoluteUri.Replace(strPathAndQuery, "/");
            this.pageHead.Controls.Add(new LiteralControl(String.Format("<meta http-equiv='refresh' content='{0};url={1}'>", SessionLengthMinutes * 60, SessionExpireDestinationUrl)));
        }
        public bool ExecutePatientLevel
        {

            set
            {
                levelTwoNavigationUserControl1.CanExecute = value;                
            }
            get
            {
                return levelTwoNavigationUserControl1.CanExecute;
            }
        }
        protected string show2ndLevel
        {
            get
            {
                return this.ExecutePatientLevel ? "" : "none";
            }
        }
        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.DataBind();
            if (SystemSetting.CurrentSystem.Configured)
            {
                if (Session["AppLocation"] == null)
                {
                    IQCareMsgBox.Show("SessionExpired", this);
                    Response.Redirect("~/frmLogOff.aspx");
                }
                if (Session.Count == 0)
                {
                    IQCareMsgBox.Show("SessionExpired", this);
                    Response.Redirect("~/frmLogOff.aspx");
                }
                if ((Session["AppUserID"] == null && Session["AppUserID"].ToString() == "") || CurrentSession.Current == null)
                {
                    IQCareMsgBox.Show("SessionExpired", this);
                    Response.Redirect("~/frmLogOff.aspx");
                }
            }
            lblTitle.Text = "International Quality Care Patient Management and Monitoring System [" + Session["AppLocation"].ToString() + "]";
            string url = Request.RawUrl.ToString();
            Application["PrvFrm"] = url;
            //string pageName = this.Page.ToString();
            System.IO.FileInfo fileinfo = new System.IO.FileInfo(Request.Url.AbsolutePath);
            string pageName = fileinfo.Name;

            if (Session["PatientID"] != null)
            {
                if (int.Parse(Session["PatientID"].ToString()) > 0)
                {
                    //VY added 2014-10-14 for changing level one navigation Menu depending on whether patient has been selected or not
                    if (Session["TechnicalAreaId"] != null)
                    {
                        MenuItem facilityHome = (levelOneNavigationUserControl1.FindControl("mainMenu") as Menu).FindItem("Facility Home");
                        facilityHome.Text = "<i class='fa fa-search-plus fa-1x text-muted' aria-hidden='true'></i> <span class='fa-1x text-muted'><strong> Find/Add Patient</strong></span>";
                        facilityHome.NavigateUrl = String.Format("~/Patient/FindAdd.aspx?srvNm={0}&mod={1}", Session["TechnicalAreaName"], Session["TechnicalAreaId"]);
                        MenuItem facilityStats = (levelOneNavigationUserControl1.FindControl("mainMenu") as Menu).FindItem("Facility Statistics");
                        facilityStats.Text = "<i class='fa fa-cubes fa-1x text-muted' aria-hidden='true'></i> <span class='fa-1x text-muted'><strong>Select Service</strong></span>";
                        facilityStats.NavigateUrl = "~/frmFacilityHome.aspx";
                    }
                    //if (pageName.Equals("frmFamilyInformation.aspx"))
                    //{
                    //    (levelTwoNavigationUserControl1.FindControl("PanelPatiInfo") as Panel).Visible = false;
                    //}

                    if (pageName.Equals("frmPatient_Home.aspx")
                        || pageName.ToLower().Equals("frmscheduler_appointmentnewhistory.aspx")

                        )
                    {

                        level2Navigation.Style.Add("display", "inline");
                        levelTwoNavigationUserControl1.CanExecute = true;
                    }
                    //else if (pageName.Equals("AddTechnicalArea.aspx"))
                    //{

                    //    level2Navigation.Style.Add("display", "none");
                    //    levelTwoNavigationUserControl1.CanExecute = false;
                    //}
                    //else if (pageName.Equals("frmAdmin_DeletePatient.aspx"))
                    //{

                    //    level2Navigation.Style.Add("display", "none");
                    //    levelTwoNavigationUserControl1.CanExecute = false;
                    //}
                    //else if (pageName.Equals("frmPatientCustomRegistration.aspx"))
                    //{

                    //    level2Navigation.Style.Add("display", "none");
                    //    levelTwoNavigationUserControl1.CanExecute = false;
                    //}
                    //else
                    //{

                    //    level2Navigation.Style.Add("display", "inline");
                    //    level2Navigation.Attributes["class"] = "";
                    //    levelTwoNavigationUserControl1.CanExecute = true;

                    //}
                }
                else
                {
                    level2Navigation.Style.Add("display", "none");
                    levelTwoNavigationUserControl1.CanExecute = false;
                    //VY added 2014-10-14 for changing level one navigation Menu depending on whether patient has been selected or not
                    MenuItem facilityHome = (levelOneNavigationUserControl1.FindControl("mainMenu") as Menu).FindItem("Facility Home");
                    facilityHome.Text = "<i class='fa fa-cubes fa-1x text-muted' aria-hidden='true'></i> <span class='fa-1x text-muted'><strong>Select Service</strong></span>";
                    facilityHome.NavigateUrl = "~/frmFacilityHome.aspx";
                    MenuItem facilityStats = (levelOneNavigationUserControl1.FindControl("mainMenu") as Menu).FindItem("Facility Statistics");
                    facilityStats.Text = "<i class='fa fa-line-chart fa-1x text-muted' aria-hidden='true'></i> <span class='fa-1x text-muted'><strong>Facility Statistics</strong></span>";
                    facilityStats.NavigateUrl = "~/Statistics/Facility.aspx";
                }
            }
            else
            {
                level2Navigation.Style.Add("display", "none");
                levelTwoNavigationUserControl1.CanExecute = false;
            }

            if (Session["AppUserName"] != null)
            {
                lblUserName.Text = Session["AppUserName"].ToString();
            }
            if (Session["AppLocation"] != null)
            {
                lblLocation.Text = Session["AppLocation"].ToString();
            }
            IIQCareSystem AdminManager;
            AdminManager = (IIQCareSystem)ObjectFactory.CreateInstance("BusinessProcess.Security.BIQCareSystem, BusinessProcess.Security");

            if (Session["AppDateFormat"].ToString() != "")
            {
                
                    lblDate.Text = AdminManager.SystemDate().ToString(Session["AppDateFormat"].ToString());
            }
            else
            {
                lblDate.Text = AdminManager.SystemDate().ToString("dd-MMM-yyyy");
            }
            

            lblversion.Text = GblIQCare.VersionName;// AuthenticationManager.AppVersion;
            lblrelDate.Text = GblIQCare.ReleaseDate;//AuthenticationManager.ReleaseDate;
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (this.ExecutePatientLevel)
            {
                level2Navigation.Style.Add("display", "inline");
                level2Navigation.Attributes["class"] = "";
            }
            else
            {
                level2Navigation.Style.Add("display", "none");

            }
        }
    }
}