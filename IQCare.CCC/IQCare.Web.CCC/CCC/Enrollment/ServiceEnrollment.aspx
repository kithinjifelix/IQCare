﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CCC/Greencard.Master" AutoEventWireup="true" CodeBehind="ServiceEnrollment.aspx.cs" Inherits="IQCare.Web.CCC.Enrollment.ServiceEnrollment" %>
<%@ Register TagPrefix="uc" TagName="PatientDetails" Src="~/CCC/UC/ucPatientDetails.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="IQCareContentPlaceHolder" runat="server">

      <%--  <uc:PatientDetails ID="PatientSummary" runat="server" />--%>
   
    
    <div class="col-md-12 bs-callout bs-callout-info">
        <div class="col-md-12">
            <label class="control-lable pull-left"> Patient Enrollment </label>
        </div>
        <div class="col-md-12"><hr/></div>
        <div class="col-md-12 form-group">
            <div class="col-md-3">
                <div class="col-md-12"><label class="control-label pull-left">Enrollment Date </label></div>
                <div class="col-md-12">
                    <div class="datepicker fuelux form-group" id="EnrollmentDate">
                                                                 <div class="input-group">
                                                                     <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control input-sm" ID="DateOfEnrollment"></asp:TextBox>        
                                                                     <%-- <input ClientIDMode="Static" class="form-control input-sm" runat="server" id="DateOfBirth" type="date" />--%>
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
                                                                                            </span> <span class="year">2014</span>
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
                                                                                      <li data-month="0"><button type="button">Jan</button></li>
                                                                                      <li data-month="1"><button type="button">Feb</button></li>
                                                                                      <li data-month="2"><button type="button">Mar</button></li>
                                                                                      <li data-month="3"><button type="button">Apr</button></li>
                                                                                      <li data-month="4"><button type="button">May</button></li>
                                                                                      <li data-month="5"><button type="button">Jun</button></li>
                                                                                      <li data-month="6"><button type="button">Jul</button></li>
                                                                                      <li data-month="7"><button type="button">Aug</button></li>
                                                                                      <li data-month="8"><button type="button">Sep</button></li>
                                                                                      <li data-month="9"><button type="button">Oct</button></li>
                                                                                      <li data-month="10"><button type="button">Nov</button></li>
                                                                                      <li data-month="11"><button type="button">Dec</button></li>
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
            
            <div class="col-md-4">
                  <div class="col-md-12"><label class="pull-left control-label">Enrollment Identifier</label></div>
                  <div class="col-md-12">
                       <asp:DropDownList runat="server" CssClass="form-control input-sm" ID="IdentifierTypeId" ClientIDMode="Static" data-parsley-required="true"/>
                  </div>
             </div> 
            
            <div class="col-md-3">
                     <div class="col-md-12"><label class="pull-left control-label">Enrollment No.#</label></div>
                     <div class="col-md-12">
                         <asp:TextBox runat="server" CssClass="form-control input-sm" ClientIDMode="Static" ID="IdentifierValue" Placeholder="Registration No#..." data-parsley-required="true"></asp:TextBox>
                     </div>
                 </div>

            <div class="col-md-2">
                <div class="col-md-12"><label class="control-label text-danger">Action</label></div>      
                <div class="col-md-12 pull-right">
                          <asp:LinkButton runat="server" ID="btnAdd"  ClientIDMode="Static" OnClientClick="return false" CssClass="btn btn-info fa fa-plus-circle"> Add Identifier</asp:LinkButton>
                      </div>
                 </div>
             
        </div> 
            
            
            <div class="col-md-12 form-group">
                <div class="col-md-12 bg-primary"><span class="pull-left"></span> Identifier Parameters </div>
                <table class="table table-striped table-condensed" id="tblEnrollment" clientidmode="Static" runat="server">
                    <thead>
                        <tr >
                            <th>#</th>
                            <th><i class="fa fa-calendar-check-o text-primary" aria-hidden="true"> Enrollment Date</i> </th>
                            <th> <i class="fa fa-arrow-circle-o-right text-primary" aria-hidden="true"> Enrollement Identifier</i> </th>
                             <th> <i class="fa fa-arrow-circle-o-right " aria-hidden="true"> Identifier Id</i> </th>
                            <th> <i class="fa fa-arrow-circle-o-right text-primary" aria-hidden="true"> Enrollment Number </i></th>
                            <th><span class="fa fa-times text-danger text-primary pull-right"> Action</span></th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
<%--                    <tfoot>
                      
                        <tr class="bg-primary">
                            <th>#</th>
                            <th><i class="fa fa-calendar-check-o " aria-hidden="true"> Enrollment Date</i> </th>
                            <th> <i class="fa fa-arrow-circle-o-right " aria-hidden="true"> Enrollement Identifier</i> </th>
                            <th> <i class="fa fa-arrow-circle-o-right " aria-hidden="true"> Identifier Id</i> </th>
                            <th> <i class="fa fa-arrow-circle-o-right " aria-hidden="true"> Enrollment Number </i></th>
                            <th><span class="fa fa-times text-danger "></span> Action</th>
                        </tr>
              
                    </tfoot>--%>
                </table>

            </div>
            <div class="col-md-12"><hr /></div>
            <div class="col-md-12">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                     <div class="col-md-4">
                          <asp:LinkButton runat="server" ID="btnEnroll" CssClass="btn btn-info btn-lg fa fa-plus-circle"> Enroll and Continue </asp:LinkButton>
                     </div>
                    <div class="col-md-4">
                          <asp:LinkButton runat="server" ID="btnRese" CssClass="btn btn-warning btn-lg fa fa-refresh"> Enroll and Register New</asp:LinkButton>
                     </div>
                    <div class="col-md-4">
                          <asp:LinkButton runat="server" ID="btnClose" CssClass="btn btn-danger btn-lg fa fa-times"> Close Enrollemnt</asp:LinkButton>
                     </div>
                </div>
                <div class="col-md-3"></div>
            </div>
         
             
    </div>
    
    <script type="text/javascript">
        $(document).ready(function() {

            $('#EnrollmentDate').datepicker({
                allowPastDates: true,
                momentConfig: { culture: 'en', format: 'DD-MMM-YYYY' },
                restricted: [{ from: '01-01-2013', to: '01-01-2014' }]
            });

            var identifierList = new Array();

            /*.. Load the list of identifiers */
            $.ajax({
                        type: "POST",
                        url: "../WebService/LookupService.asmx/GetLookUpItemByName",
                        data: "{'itemName':'PatientIdentifier'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var itemList = JSON.parse(response.d);
                            $("#<%=IdentifierTypeId.ClientID%>").find('option').remove().end();
                            $("#<%=IdentifierTypeId.ClientID%>").append('<option value="0">Select</option>');
                            $.each(itemList, function (index, itemList) {
                                $("#<%=IdentifierTypeId.ClientID%>").append('<option value="' + itemList.ItemId + '">' + itemList.ItemDisplayName + '</option>');
                            }); 
                        },
                        error: function (msg) {
                            alert(msg);
                        }
            });

            $("#btnAdd").click(function(e) {

                var identifierCount = 0;
                var identifierFound = 0;

                var enrollmentDate = $('#EnrollmentDate').datepicker('getDate');
                var identifierId = $("#<%=IdentifierTypeId.ClientID%>").find(':selected').val();
                var identifier = $("#<%=IdentifierTypeId.ClientID%>").find(":selected").text();
                var enrollmentNo = $("#<%=IdentifierValue.ClientID%>").val();

                if (moment(''+enrollmentDate+'').isAfter()) {
                    generate("error","Future dates not allowed during the patient enrollment process.");
                    return false;
                }

                if (identifierId <1) {
                    generate("error", "Please select at least One(1) Identifier Type from the List");
                    return false;
                }
                if (enrollmentNo.length < 4) {
                    generate("error", "Enrollment number should be more than Four Characters");
                    return false;
                }

                identifierFound = $.inArray(""+identifier+"", identifierList);
              
                if (identifierFound > -1) {
                    
                    generate("error",identifier  + "Identifier already exisits in the Lits,");
                    return false; // message box herer
                } else {
                    
                    identifierList.push(""+identifier+"");
                    var tr = "<tr><td align='left'></td><td align='left'>" + moment(enrollmentDate).format('DD-MMM-YYYY') + "</td><td align='left'>" + identifier + "</td><td align='left'>" + identifierId + "</td><td align='left'>" + enrollmentNo + "</td><td align='right'><button type='button' class='btnDelete btn btn-danger fa fa-minus-circle btn-fill' > Remove</button></td></tr>";
                    $("#tblEnrollment>tbody:first").append(''+tr+'');
                }

                e.preventDefault();
            });

            $("#tblEnrollment").on('click', '.btnDelete', function () {
                $(this).closest('tr').remove();
                var x = $(this).closest('tr').find('td').eq(0).html();

                identifierList.splice($.inArray(x, identifierList), 1);
            });

            function generate(type, text) {

                var n = noty({
                    text: text,
                    type: type,
                    dismissQueue: true,
                    progressBar: true,
                    timeout: 5000,
                    layout: 'topRight',
                    closeWith: ['click'],
                    theme: 'relax',
                    maxVisible: 10,
                    animation: {
                        open: 'animated bounceInLeft',
                        close: 'animated bounceOutLeft',
                        easing: 'swing',
                        speed: 500
                    }
                });
                console.log('html: ' + n.options.id);
                return n;
            }

        });
    </script>

</asp:Content>
