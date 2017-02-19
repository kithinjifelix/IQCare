﻿<%@ Page Language="C#" MasterPageFile="~/CCC/Greencard.Master" AutoEventWireup="true" CodeBehind="PatientAppointments.aspx.cs" Inherits="IQCare.Web.CCC.Appointment.TodaysAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IQCareContentPlaceHolder" runat="server">

<%--    <div class="col-md-12">
        <span id="Span1" class="text-capitalize pull-left glyphicon-text-size= fa-2x" runat="server">
            <i class="fa fa-calendar fa-2x" aria-hidden="true"></i>Todays Appointments</span>
    </div>--%>
    <div id="callout-labels-inline-block" class="col-md-12  bs-callout bs-callout-primary" style="padding-bottom: 1%">
        <div class="col-md-12 form-group">
            <div class="col-md-12">
                <label class="control-label pull-left text-info"> Patient Appointment Summary </label>
               
            </div>
            <table class="table table-striped table-condensed" id="tblAppointment" clientidmode="Static" runat="server">
                <thead>
                    <tr>
                        <th><i class="" aria-hidden="true">#</i></th>
                       <%-- <th><i class="fa fa-arrow-circle-o-right text-primary" aria-hidden="true">Patient Name</i> </th>--%>
                        <th><i class="fa fa-arrow-circle-o-right " aria-hidden="true"> Service Area</i> </th>
                        <th><i class="fa fa-arrow-circle-o-right " aria-hidden="true"> Reason</i> </th>
                        <th><i class="fa fa-arrow-circle-o-right " aria-hidden="true"> Description</i> </th>
                        <th><i class="fa fa-arrow-circle-o-right " aria-hidden="true"> Status</i> </th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            var patientId ="<%=PatientId%>";
            jQuery.support.cors = true;
            $.ajax(
            {
                type: "POST",
                url: "../WebService/PatientService.asmx/GetPatientAppointments",
                data: "{'patientId':'" + patientId + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                cache: false,
                success: function (response) {
                    console.log(response.d);
                    var itemList = response.d;
                    var table = '';
                    itemList.forEach(function (item, i) {
                        n = i + 1;
                        table += '<tr><td>' + n + '</td><td>' + item.ServiceAreaId + '</td><td>' + item.ReasonId + '</td><td>' + item.Description + '</td><td>' + item.StatusId + '</td></tr>';
                    });
                   
                    $('#tblAppointment').append(table);

                },

                error: function (msg) {
                    alert(msg.responseText);
                }
            });
           
        })

    </script>
</asp:Content>
