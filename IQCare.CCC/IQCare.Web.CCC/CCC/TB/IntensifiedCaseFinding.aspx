﻿<%@ Page Language="C#" MasterPageFile="~/CCC/Greencard.Master" AutoEventWireup="true" CodeBehind="IntensifiedCaseFinding.aspx.cs" Inherits="IQCare.Web.CCC.TB.IntensifiedCaseFinding" %>

<%@ Register TagPrefix="uc" TagName="PatientDetails" Src="~/CCC/UC/ucPatientDetails.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IQCareContentPlaceHolder" runat="server">
    <div class="col-md-12">
        <uc:PatientDetails runat="server" />

        <div id="callout-labels-inline-block" class="col-md-12  bs-callout bs-callout-primary" style="padding-bottom: 1%">
            <div class="col-md-12" id="IcfForm" data-parsley-validate="true" data-show-errors="true">
                <div class="col-md-12">
                    <div class="col-md-12 form-group">
                        <div class="col-md-12">
                            <label class="control-label pull-left text-primary">TB Intensified Case Finding In Adults</label>
                        </div>
                        <div class="col-md-12">
                            <hr style="margin-bottom: 1%; margin-top: 1%" />
                        </div>
                    </div>
                    <div class="col-md-12 form-group">
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <div class="col-md-12">
                                    <label class="control-label pull-left">ICF</label>
                                </div>
                                <div class="col-md-12 pull-right">
                                    <asp:DropDownList runat="server" ID="ICF" CssClass="form-control input-sm" ClientIDMode="Static" required="true" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="col-md-12">
                                    <label class="control-label pull-left">Result</label>
                                </div>
                                <div class="col-md-12 pull-right">
                                    <asp:DropDownList runat="server" ID="Result" CssClass="form-control input-sm" ClientIDMode="Static" required="true" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label class="control-label pull-left">Date</label>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="datepicker fuelux form-group" id="IcfDate">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control input-sm" ID="IcfResultDate"></asp:TextBox>
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn btn-default dropdown-toggle input-sm" data-toggle="dropdown">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                        <span class="sr-only">Toggle Calendar</span>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-right datepicker-calendar-wrapper" role="menu">
                                                        <div class="datepicker-calendar">
                                                            <div class="datepicker-calendar-header">
                                                                <button type="button" class="prev"><span class="glyphicon glyphicon-chevron-left input-sm"></span><span class="sr-only">Previous Month</span></button>
                                                                <button type="button" class="next"><span class="glyphicon glyphicon-chevron-right input-sm"></span><span class="sr-only">Next Month</span></button>
                                                                <button type="button" class="title" data-month="11" data-year="2014">
                                                                    <span class="month">
                                                                        <span data-month="0">January</span>
                                                                        <span data-month="1">February</span>
                                                                        <span data-month="2">March</span>
                                                                        <span data-month="3">April</span>
                                                                        <span data-month="4">May</span>
                                                                        <span data-month="5">June</span>
                                                                        <span data-month="6">July</span>
                                                                        <span data-month="7">August</span>
                                                                        <span data-month="8">September</span>
                                                                        <span data-month="9">October</span>
                                                                        <span data-month="10">November</span>
                                                                        <span data-month="11" class="current">December</span>
                                                                    </span><span class="year">2017</span>
                                                                </button>
                                                            </div>
                                                            <table class="datepicker-calendar-days">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Su</th>
                                                                        <th>Mo</th>
                                                                        <th>Tu</th>
                                                                        <th>We</th>
                                                                        <th>Th</th>
                                                                        <th>Fr</th>
                                                                        <th>Sa</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody></tbody>
                                                            </table>
                                                            <div class="datepicker-calendar-footer">
                                                                <button type="button" class="datepicker-today">Today</button>
                                                            </div>
                                                        </div>
                                                        <div class="datepicker-wheels" aria-hidden="true">
                                                            <div class="datepicker-wheels-month">
                                                                <h2 class="header">Month</h2>
                                                                <ul>
                                                                    <li data-month="0">
                                                                        <button type="button">Jan</button></li>
                                                                    <li data-month="1">
                                                                        <button type="button">Feb</button></li>
                                                                    <li data-month="2">
                                                                        <button type="button">Mar</button></li>
                                                                    <li data-month="3">
                                                                        <button type="button">Apr</button></li>
                                                                    <li data-month="4">
                                                                        <button type="button">May</button></li>
                                                                    <li data-month="5">
                                                                        <button type="button">Jun</button></li>
                                                                    <li data-month="6">
                                                                        <button type="button">Jul</button></li>
                                                                    <li data-month="7">
                                                                        <button type="button">Aug</button></li>
                                                                    <li data-month="8">
                                                                        <button type="button">Sep</button></li>
                                                                    <li data-month="9">
                                                                        <button type="button">Oct</button></li>
                                                                    <li data-month="10">
                                                                        <button type="button">Nov</button></li>
                                                                    <li data-month="11">
                                                                        <button type="button">Dec</button></li>
                                                                </ul>
                                                            </div>
                                                            <div class="datepicker-wheels-year">
                                                                <h2 class="header">Year</h2>
                                                                <ul></ul>
                                                            </div>
                                                            <div class="datepicker-wheels-footer clearfix">
                                                                <button type="button" class="btn datepicker-wheels-back"><span class="glyphicon glyphicon-arrow-left"></span><span class="sr-only">Return to Calendar</span></button>
                                                                <button type="button" class="btn datepicker-wheels-select">Select <span class="sr-only">Month and Year</span></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <asp:LinkButton runat="server" ID="AddIcf" ClientIDMode="Static" OnClientClick="return false" CssClass=" btn btn-info btn-lg fa fa-plus-circle"> Add ICF</asp:LinkButton>
                    </div>
                    <div class="col-md-12">
                        <hr style="margin-bottom: 1%; margin-top: 1%" />
                    </div>
                    <div class="col-md-12 form-group">
                        <table class="table table-hover" id="tblIcf" clientidmode="Static" runat="server">
                            <thead>
                                <tr class="active">
                                    <th><span class="text-primary" aria-hidden="true">ICF</span> </th>
                                    <th><span class="text-primary" aria-hidden="true">Result</span> </th>
                                    <th><span class="text-primary" aria-hidden="true">Date</span> </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="col-md-12 form-group">
                        <div class="col-md-12">
                            <label class="control-label pull-left text-primary">Action Taken</label>
                        </div>
                        <div class="col-md-12">
                            <hr style="margin-bottom: 1%; margin-top: 1%" />
                        </div>
                    </div>
                    <div class="col-md-12 form-group">
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <div class="col-md-12">
                                    <label class="control-label pull-left">Action</label>
                                </div>
                                <div class="col-md-12 pull-right">
                                    <asp:DropDownList runat="server" ID="Action" CssClass="form-control input-sm" ClientIDMode="Static" required="true" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="col-md-12">
                                    <label class="control-label pull-left">Result</label>
                                </div>
                                <div class="col-md-12 pull-right">
                                    <asp:DropDownList runat="server" ID="ActionResult" CssClass="form-control input-sm" ClientIDMode="Static" required="true" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <label class="control-label pull-left">Date</label>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="datepicker fuelux form-group" id="ActionDate">
                                            <div class="input-group">
                                                <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control input-sm" ID="ActionResultDate"></asp:TextBox>
                                                <div class="input-group-btn">
                                                    <button type="button" class="btn btn-default dropdown-toggle input-sm" data-toggle="dropdown">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                        <span class="sr-only">Toggle Calendar</span>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-right datepicker-calendar-wrapper" role="menu">
                                                        <div class="datepicker-calendar">
                                                            <div class="datepicker-calendar-header">
                                                                <button type="button" class="prev"><span class="glyphicon glyphicon-chevron-left input-sm"></span><span class="sr-only">Previous Month</span></button>
                                                                <button type="button" class="next"><span class="glyphicon glyphicon-chevron-right input-sm"></span><span class="sr-only">Next Month</span></button>
                                                                <button type="button" class="title" data-month="11" data-year="2014">
                                                                    <span class="month">
                                                                        <span data-month="0">January</span>
                                                                        <span data-month="1">February</span>
                                                                        <span data-month="2">March</span>
                                                                        <span data-month="3">April</span>
                                                                        <span data-month="4">May</span>
                                                                        <span data-month="5">June</span>
                                                                        <span data-month="6">July</span>
                                                                        <span data-month="7">August</span>
                                                                        <span data-month="8">September</span>
                                                                        <span data-month="9">October</span>
                                                                        <span data-month="10">November</span>
                                                                        <span data-month="11" class="current">December</span>
                                                                    </span><span class="year">2017</span>
                                                                </button>
                                                            </div>
                                                            <table class="datepicker-calendar-days">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Su</th>
                                                                        <th>Mo</th>
                                                                        <th>Tu</th>
                                                                        <th>We</th>
                                                                        <th>Th</th>
                                                                        <th>Fr</th>
                                                                        <th>Sa</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody></tbody>
                                                            </table>
                                                            <div class="datepicker-calendar-footer">
                                                                <button type="button" class="datepicker-today">Today</button>
                                                            </div>
                                                        </div>
                                                        <div class="datepicker-wheels" aria-hidden="true">
                                                            <div class="datepicker-wheels-month">
                                                                <h2 class="header">Month</h2>
                                                                <ul>
                                                                    <li data-month="0">
                                                                        <button type="button">Jan</button></li>
                                                                    <li data-month="1">
                                                                        <button type="button">Feb</button></li>
                                                                    <li data-month="2">
                                                                        <button type="button">Mar</button></li>
                                                                    <li data-month="3">
                                                                        <button type="button">Apr</button></li>
                                                                    <li data-month="4">
                                                                        <button type="button">May</button></li>
                                                                    <li data-month="5">
                                                                        <button type="button">Jun</button></li>
                                                                    <li data-month="6">
                                                                        <button type="button">Jul</button></li>
                                                                    <li data-month="7">
                                                                        <button type="button">Aug</button></li>
                                                                    <li data-month="8">
                                                                        <button type="button">Sep</button></li>
                                                                    <li data-month="9">
                                                                        <button type="button">Oct</button></li>
                                                                    <li data-month="10">
                                                                        <button type="button">Nov</button></li>
                                                                    <li data-month="11">
                                                                        <button type="button">Dec</button></li>
                                                                </ul>
                                                            </div>
                                                            <div class="datepicker-wheels-year">
                                                                <h2 class="header">Year</h2>
                                                                <ul></ul>
                                                            </div>
                                                            <div class="datepicker-wheels-footer clearfix">
                                                                <button type="button" class="btn datepicker-wheels-back"><span class="glyphicon glyphicon-arrow-left"></span><span class="sr-only">Return to Calendar</span></button>
                                                                <button type="button" class="btn datepicker-wheels-select">Select <span class="sr-only">Month and Year</span></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <asp:LinkButton runat="server" ID="AddAction" ClientIDMode="Static" OnClientClick="return false" CssClass=" btn btn-info btn-lg fa fa-plus-circle"> Add Action</asp:LinkButton>
                    </div>
                    <div class="col-md-12">
                        <hr style="margin-bottom: 1%; margin-top: 1%" />
                    </div>
                    <div class="col-md-12 form-group">
                        <table class="table table-hover" id="ActionTable" clientidmode="Static" runat="server">
                            <thead>
                                <tr class="active">
                                    <th><span class="text-primary" aria-hidden="true">Action</span> </th>
                                    <th><span class="text-primary" aria-hidden="true">Result</span> </th>
                                    <th><span class="text-primary" aria-hidden="true">Date</span> </th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <hr />
            </div>
            <div class="col-md-12">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <div class="col-md-3"></div>
                    <div class="col-md-3">
                        <asp:LinkButton runat="server" ID="btnSaveIcf" CssClass="btn btn-info fa fa-plus-circle btn-lg" ClientIDMode="Static" OnClientClick="return false;"> Save </asp:LinkButton>
                    </div>
                    <div class="col-md-3">
                        <asp:LinkButton runat="server" ID="btnReset" CssClass="btn btn-warning  fa fa-refresh btn-lg " ClientIDMode="Static" OnClientClick="return false;"> Reset </asp:LinkButton>
                    </div>
                    <div class="col-md-3">
                        <asp:LinkButton runat="server" ID="btnCancel" CssClass="btn btn-danger fa fa-times btn-lg" ClientIDMode="Static" OnClientClick="return false;"> Close </asp:LinkButton>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('#IcfDate').datepicker({
            allowPastDates: true,
            Date: 0,
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' }
        });

        $('#ActionDate').datepicker({
            allowPastDates: true,
            Date: 0,
            momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' }
        });
    </script>
</asp:Content>
