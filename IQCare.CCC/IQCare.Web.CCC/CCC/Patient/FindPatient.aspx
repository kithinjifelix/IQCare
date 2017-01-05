﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CCC/Greencard.Master" AutoEventWireup="true" CodeBehind="FindPatient.aspx.cs" Inherits="IQCare.Web.CCC.Patient.FindPatient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="IQCareContentPlaceHolder" runat="server">
    
    <div class="col-md-12">
       
         <div class="panel panel-default">
             <div class="panel-body">
               
                   <div class="col-md-12">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#Find"><i class="fa fa-search-plus fa-2x text-primary " aria-hidden="true"></i> <strong>Find Patient</strong> </a></li>
                            <li><a data-toggle="tab" href="#Register"><i class="fa fa-plus-circle fa-2x" aria-hidden="true"></i> <strong>Register Patient</strong></a></li>
                        </ul>

                        <div class="tab-content">
                 
                            <div id="Find" class="tab-pane fade in active">
                                
                                <div class="col-md-2" style="padding-top:2%">
                                    <div class="col-md-12"><i class="fa fa-search fa-5x pull-left text-danger" aria-hidden="true"></i></div>
                                     <div class="col-md-12"><label class="control-label pull-left text-primary">Patient Search</label>  </div>
                                </div> 
                                <div class="col-md-10" style="padding-top:2%">
                                    
                                     <div class="col-md-12">
                                          <div class="col-md-3 form-group">
                                               <div class="col-md-12"><label class="control-label pull-left">Identification Number</label></div>
                                               <div class="col-md-12">
                                                    <input type="text" runat="server" id="IdentificationNumber" name="IdentificationNumber" class="form-control input-sm" placeholder="patient number.." />
                                               </div>
                                          </div>
                                         <div class="col-md-5">
                                             <div class="col-md-12"><label class="control-label pull-left">Patient Name(s)</label></div>
                                              <div class="col-md-12">
                                                    <input type="text" runat="server" id="PatientNames" name="PatientNames" class="form-control input-sm" placeholder="firstname/middlename/lastname ..." />
                                              </div>
                                         </div>
                                         <div class="col-md-2">
                                             <div class="col-md-12"><label class="control-label pull-left">DoB</label></div>
                                             <div class="col-md-12">
                                                 <div class="datepicker fuelux form-group" id="SearchDoB">
                                                                 <div class="input-group">
                                                                              <input class="form-control input-sm" id="SearchDateOfBirth" type="text" />
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
                                         
                                         <div class="col-md-2">
                                             <div class="col-md-12"><label class="control-label pull-left">Gender</label></div>
                                             <div class="col-md-12">
                                                  <select runat="server" class="form-control input-sm" id="Gender" name="Gender"></select>
                                             </div>
                                         </div>
                                     </div>  

                                     <div class="col-md-12">
                                                 <div class="col-md-3">
                                                      <div class="col-md-12"><label class="control-label pull-left">Facility</label></div>
                                                     <div class="col-md-12">
                                                          <select runat="server" class="form-control input-sm" id="facilityId" name="FacilityId"></select>
                                                     </div>
                                                 </div>
                                                 <div class="col-md-5">

                                                 </div>
                                                 <div class="col-md-4">
                                                     <div class="col-md-12"><label class="control-label pull-left">Registration Date</label></div>
                                                     <div class="col-md-12">
                                                         <div class="datepicker fuelux form-group" id="RegDate">
                                                                 <div class="input-group">
                                                                              <input class="form-control input-sm" id="RegistrationDate" type="text" />
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
                                                 
                                             </div>

                                     <div class="col-md-12">
                                        <div class="form-group">
                                            
                                             <%--<table id="PatientData" border="1" class="display">  
                                                   <thead>
                                                      <tr>
                                                         <th>Code</th>
                                                          <th>Patient Id</th> 
                                                         <th>Patient Name(s)</th>
                                                         <th>Date of Birth</th>
                                                         <th>Gender</th>
                                                         <th>Registration Date</th>
                                                         <th>Status</th>
                                                      </tr>
                                                   </thead>
                                                   <tbody>
                                                       <tr>
                                                           <td>1</td>
                                                           <td>2</td>
                                                           <td>3</td>
                                                           <td>4</td>
                                                           <td>5</td>
                                                           <td>6</td>
                                                           <td>7</td>
                                                          
                                                       </tr>
                                                   </tbody>
                                                   <tfoot>
                                                       <tr>
                                                         <th>Code</th>
                                                          <th>Patient Id</th>
                                                         <th>Patient Name(s)</th>
                                                         <th>Date of Birth</th>
                                                         <th>Gender</th>
                                                         <th>Registration Date</th>
                                                         <th>Status</th>
                                                      </tr>
                                                   </tfoot>
                                        </table> --%>

                                            

                                        </div>
                                     </div>
                                                                        
                                 </div><%--.col-md-10--%>
                            </div>

                             <div id="Register" class="tab-pane fade" style="padding-top:2%">
                                  <div class="col-md-12">
                                       <div class="wizard" data-initialize="wizard" id="myWizard">
                                           <div class="steps-container">
	                                    <ul class="steps">
		                                    <li data-step="1" data-name="profile" class="active">
			                                    <span class="badge">1</span>Patient Profile
			                                    <span class="chevron"></span>
		                                    </li>

		                                    <li data-step="2" data-name="location">
			                                    <span class="badge">2</span>Patient Location
			                                    <span class="chevron"></span>
		                                    </li>

                                            <li data-step="3" data-name="contacts">
			                                    <span class="badge">3</span>Patient Contacts
			                                    <span class="chevron"></span>
		                                    </li>

		                                    <li data-step="4" data-name="socialstatus">
			                                    <span class="badge">4</span>Patient Population
			                                    <span class="chevron"></span>
		                                    </li>


	                                    </ul>
                                  </div>
                      
                                 <div class="actions">
	                                            <button type="button" class="btn btn-default btn-prev">
		                                            <span class="glyphicon glyphicon-arrow-left"></span>Prev</button>
	                                            <button type="button" class="btn btn-primary btn-next" data-last="Complete">Next
		                                            <span class="glyphicon glyphicon-arrow-right"></span>
	                                            </button>
                                           </div>

                                 <div class="step-content">
	                                  <div class="step-pane active sample-pane" data-step="1">
                                           <div class="col-md-12">
                                               <small class="pull-left text-primary">1.Patient Basic Details</small>
                                               <hr />
                                           </div>
		                                   <div class="col-md-12">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <div class="col-md-12"><label class="control-label pull-left">First Name</label></div>
                                                        <div class="col-md-12">
                                                             <input runat="server" type="text" id="fname" name="fname" class="form-control input-sm" placeholder="first name.." />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                   <div class="form-group">
                                                        <div class="col-md-12"><label class="control-label pull-left">Middle Name</label></div>
                                                        <div class="col-md-12">
                                                             <input runat="server" type="text" id="mname" name="mname" class="form-control input-sm" placeholder="middle name.."/>
                                                        </div>
                                                    </div>
                                               </div>
                                                <div class="col-md-3">
                                                   <div class="form-group">
                                                        <div class="col-md-12"><label class="control-label pull-left">Last Name</label></div>
                                                        <div class="col-md-12">
                                                             <input runat="server" type="text" id="lname" name="lname" class="form-control input-sm" placeholder="last name.."/>
                                                        </div>
                                                    </div>
                                               </div>
                                                <div class="col-md-3">
                                                   <div class="form-group">
                                                        <div class="col-md-12"><label class="control-label pull-left">Gender</label></div>
                                                             <div class="col-md-12">
                                                                  <div class="col-md-6">
                                                                     <div class="radio pull-left">
                                                                          <label class="radio-custom highlight" data-initialize="radio" id="GenderMale">
                                                                            <input class="sr-only" name="Gender" id="rdbGenderMale" type="radio" value="option1">
                                                                            Male
                                                                          </label>
                                                                        </div>
                                                                  </div> 
                                                                  <div class="col-md-6">
                                                                     <div class="radio checked pull-left">
                                                                          <label class="radio-custom highlight" data-initialize="radio" id="GenderFemale">
                                                                            <input class="sr-only" checked="checked" name="Gender" id="rdbGenderFemale" type="radio" value="option2">
                                                                            Female
                                                                          </label>
                                                                        </div>
                                                                 </div> 
                                                            </div>
                                                    </div>
                                                </div>
		                                   </div><%--.col-md-12  --%>    

                                           <div class="col-md-12" style="padding-top:2%">
                                               <div class="col-md-3">
                                                   <div class="form-group"><div class="col-md-12"><label class="control-label pull-left text-primary">Social Status </label></div></div>
                                               </div>
                                               <div class="col-md-3">
                                                   <div class="form-group">
                                                        <div class="col-md-12"><label class="control-label pull-left">Date of Birth</label></div>
                                                       <div class="col-md-12">
                                                            <div class="datepicker fuelux form-group" id="DoB">
                                                                 <div class="input-group">
                                                                              <input class="form-control input-sm" id="DateOfBirth" type="text" />
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
                                               </div>
                                               <div class="col-md-3">
                                                    <div class="col-md-5">
                                                         <div class="form-group">
                                                              <div class="col-md-12"><label class="control-label pull-left">Age</label></div>
                                                             <div class="col-md-12">
                                                                  <input type="text" runat="server" id="Age" name="age" placeholder="0" class="form-control input-sm" />
                                                             </div>
                                                         </div>
                                                    </div>
                                                   <div class="col-md-7">
                                                       <div class="form-group">
                                                            <div class="col-md-12"><label class="control-label"> (<18yr) Orphan ?</label></div>
                                                           <div class="col-md-12">
                                                                <div class="col-md-6">
                                                                    <div class="radio">
                                                                      <label class="radio-custom" data-initialize="radio" id="OrphanYes">
                                                                        <input class="sr-only" name="Orphan" id="rdbOrphanYes" type="radio" value="option1">
                                                                        Yes
                                                                      </label>
                                                                    </div> 
                                                                  </div> 
                                                                  <div class="col-md-6">
                                                                     <div class="radio checked">
                                                                          <label class="radio-custom" data-initialize="radio" id="OrphanNo">
                                                                            <input class="sr-only" checked="checked" name="Orphan" id="rdbOrphanNo" type="radio" value="option2">
                                                                            No
                                                                          </label>
                                                                        </div>
                                                                 </div> 
                                                           </div>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="col-md-3">
                                                    <div class="form-group">
                                                         <div class="col-md-12"><label class="control-label pull-left">In School ? </label></div>
                                                         <div class="col-md-12">
                                                             <div class="col-md-6 radio">
                                                                  <label class="radio-custom pull-left" data-initialize="radio" id="InSchoolYes">
                                                                    <input class="sr-only" name="Inschool" id="rdbInSchoolYes"  type="radio" value="option1">
                                                                    Yes
                                                                  </label>
                                                             </div>

                                                             <div class="col-md-6 radio checked">
                                                                  <label class="radio-custom pull-left" data-initialize="radio" id="InSchoolNo">
                                                                    <input class="sr-only" checked="checked" name="Inschool" id="rdbInSchoolNo" type="radio" value="option2">
                                                                   No
                                                                  </label>
                                                             </div>
                                                         </div>
                                                    </div>
                                               </div>
                                               
                                           </div><%-- .col-md-12--%>

                                           <div class="col-md-12" style="padding-top:2%">
                                                <div class="col-md-6">
                                                    <div class="col-md-12"><hr /></div>
                                                    <div class="col-md-12"><label class="control-label pull-left text-primary"><strong>Child:</strong> Parent / Gurdian Name</label></div>
                                                </div>

                                               <div class="col-md-6">
                                                   <div class="col-md-12"><hr /></div>
                                                   <div class="col-md-12"><label class="control-label pull-left text-primary">Adult (<i>provide ID number and marital status</i>)</label></div>
                                               </div>
                                           </div>

                                           <div class="col-md-12" style="padding-top:2%;padding-bottom:3%">
                                                
                                               <div class="col-md-3">
                                                    <div class="form-group">
                                                         <div class="col-md-12"><label class="control-label pull-left">First Name</label></div>
                                                        <div class="col-md-12">
                                                             <input runat="server" type="text" id="GurdianFname" name="GurdianFname" class="form-control input-sm" placeholder="gurdian first name.." />
                                                        </div>
                                                    </div>
                                               </div>
                                               <div class="col-md-3">
                                                   <div class="form-group">
                                                         <div class="col-md-12"><label class="control-label pull-left">Other Names</label></div>
                                                        <div class="col-md-12">
                                                             <input runat="server" type="text" id="GurdianOname" name="GurdianOname" class="form-control input-sm" placeholder="gurdian Other names.." />
                                                        </div>
                                                    </div>
                                               </div>
                                               
                                               <div class="col-md-3">
                                                    <div class="form-group">
                                                         <div class="col-md-12"><label class="control-label pull-left">ID Number</label></div>
                                                         <div class="col-md-12">
                                                              <input type="text" runat="server" id="IdNumber" name="IdNumber" class="form-control input-sm" placeholder="national id no.." />
                                                         </div>
                                                    </div>
                                               </div>
                                               <div class="col-md-3">
                                                    <div class="form-group">
                                                         <div class="col-md-12"><label class="control-label pull-left">Marital Status </label></div>
                                                        <div class="col-md-12">
                                                             <select runat="server" class="form-control input-sm"></select>
                                                        </div>
                                                    </div>
                                               </div>
                                           </div>

	                                  </div><%-- .step-pane--%>

	                                  <div class="step-pane sample-pane " data-step="2">
                                         
                                           <div class="col-md-12">
                                               <small class="pull-left text-primary">2.Patient Location Details</small>
                                              <hr />
                                          </div><%-- .col-md-12--%>
                                         
                                           <div class="col-md-12">
                                               <div class="col-md-3">
                                                   <div class="form-group">
                                                        <div class="col-md-12"><label class="control-label pull-left">County</label></div>
                                                       <div class="col-md-12">
                                                            <select runat="server" id="county" name="county" class="form-control input-sm"></select>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="col-md-3">
                                                   <div class="form-group">
                                                       <div class="col-md-12"><label class="control-label pull-left">Sub-County</label></div>
                                                       <div class="col-md-12">
                                                           <select runat="server" id="subcounty" name="subcounty" class="form-control input-sm"></select>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="col-md-3">
                                                  <div class="form-group">
                                                      <div class="col-md-12"><label class="control-label pull-left">Ward</label></div>
                                                      <div class="col-md-12">
                                                          <select runat="server" id="ward" name="ward" class="form-control input-sm"></select>
                                                      </div>
                                                  </div>
                                              </div>
                                               <div class="col-md-3">
                                                  <div class="form-group">
                                                      <div class="col-md-12"><label class="control-label pull-left">Local Council</label></div>
                                                      <div class="col-md-12">
                                                          <select runat="server" id="localcouncil" name="localcouncil" class="form-control input-sm"></select>
                                                      </div>
                                                  </div>
                                               </div>
                                            </div>

                                           <div class="col-md-12" style="padding-top:2%;padding-bottom:3%">
                                               <div class="col-md-3">
                                                   <div class="form-group">
                                                        <div class="col-md-12"><label class="control-label pull-left">Location</label></div>
                                                       <div class="col-md-12">
                                                           <select runat="server" id="location" name="location" class="form-control input-sm"></select>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="col-md-3">
                                                   <div class="form-group">
                                                       <div class="col-md-12"><label class="control-label pull-left">Sub Location</label></div>
                                                       <div class="col-md-12">
                                                           <input type="text" runat="server" class="form-control input-sm" placeholder="sub location.." id="sublocation" name="sublocation" />
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="col-md-3">
                                                  <div class="form-group">
                                                      <div class="col-md-12"><label class="control-label pull-left">Landmark</label></div>
                                                      <div class="col-md-12">
                                                          <input type="text" runat="server" class="form-control input-sm" placeholder="landmark.." id="landmark" name="landmark" />
                                                      </div>
                                                  </div>
                                              </div>
                                               <div class="col-md-3">
                                                  <div class="form-group">
                                                      <div class="col-md-12"><label class="control-label pull-left">Nearest Health Centre</label></div>
                                                      <div class="col-md-12">
                                                           <select runat="server" id="healthcentre" name="healthcentre" class="form-control input-sm"></select>
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
                                                                                    
                                      </div><%-- .step-pane--%>

	                                  <div class="step-pane sample-pane " data-step="3">
                                           <div class="col-md-12">
                                                <small class="text-primary pull-left"> 3. Patient Conatcts </small>
                                               <hr />
                                           </div>

                                           <div class="col-md-12" style="padding-bottom:3%">
                                               <div class="col-md-4">
                                                   <div class="form-group">
                                                        <div class="col-md-12"><label class="control-label pull-left">Postal Address</label></div>
                                                       <div class="col-md-12">
                                                           <input type="text" runat="server" id="PostalAddress" name="PostalAddress" class="form-control input-sm" placeholder="postal address" />
                                                      </div>
                                                   </div>
                                               </div>
                                              <div class="col-md-2">
                                                   <div class="form-group">
                                                       <div class="col-md-12"><label class="control-label pull-left">Mobile No.</label></div>
                                                       <div class="col-md-12">
                                                           <input type="tel" runat="server" id="MobileNo" name="MobileNo" class="form-control input-sm" placeholder="Mobile No..." />
                                                      </div>
                                                   </div>
                                              </div>
                                              <div class="col-md-2">
                                                   <div class="form-group">
                                                       <div class="col-md-12"><label class="control-label pull-left">Alt. Mobile No.</label></div>
                                                       <div class="col-md-12">
                                                           <input type="tel" runat="server" id="MobileNoAlt" name="MobileNoAlt" class="form-control input-sm" placeholder="alternative mobile no..." />
                                                      </div>
                                                   </div>
                                              </div>

                                              <div class="col-md-4">
                                                  <div class="form-group">
                                                      <div class="col-md-12"><label class="control-label pull-left">Email Address</label></div>
                                                      <div class="col-md-12">
                                                           <input type="email" runat="server" id="emailaddress" name="emaddress" class="form-control input-sm" placeholder="email address" />
                                                      </div>
                                                  </div>
                                              </div>
                                          </div>
	                                  </div>

                                      <div class="step-pane sample-pane " data-step="4">
                                           <div class="col-md-12">
                                                <small class="pull-left text-primary"> 4. Patient population categorization</small>
                                               <hr />
                                           </div>

                                           <div class="col-md-12" style="padding-top:2%;padding-bottom:3%">
                                               <div class="col-md-3">
                                                    <div class="form-group"><label class="control-label pull-left text-primary">Population type</label></div>
                                               </div>
                                               <div class="col-md-4">
                                                    <div class="form-group">
                                                         <div class="form-group"><div class="col-md-12"><label class="control-label pull-left">Select Population type</label></div></div>
                                                        
                                                             <div class="col-md-12 radio">
                                                                  <label class="radio-custom  pull-left" data-initialize="radio" id="GenPopulation">
                                                                    <input class="sr-only" id="rdbGenPopulation" name="Population" type="radio" value="option1">
                                                                    Genenal Population
                                                                  </label>
                                                                </div>

                                                                <div class="col-md-12 radio checked">
                                                                  <label class="radio-custom pull-left" data-initialize="radio" id="KeyPopulation">
                                                                    <input class="sr-only" checked="checked" id="rdbKeyPopulation" name="Population" type="radio" value="option2">
                                                                    Key population
                                                                  </label>
                                                                </div>
                                                        
                                                    </div>
                                               </div>
                                               <div class="col-md-3">
                                                    <div class="form-group">
                                                         <div class="col-md-12"><label class="control-label pull-left">Select if Key.Pop</label></div>
                                                        <div class="col-md-12">
                                                             <select runat="server" class="form-control" id="KeyPopulationChoose" name="KeyPopulationChoose"></select>
                                                        </div>
                                                    </div>
                                               </div>
                                               <div class="col-md-2"></div>
                                           </div>
                                          
	                                  </div>

                                 </div><%-- .step-content--%>

                                       </div><%--.wizard--%>
                                  </div><%-- .col-md-12--%>
                             </div><%-- .tab-pane--%>

                        </div> <%-- .tab-content--%>

                   </div><%-- .col-md-12--%>
             </div><%-- .panel-body--%>
         </div> <%--.panel--%>

          
        
    </div><%-- .col-md-12--%>
    
    <script type="text/javascript">
        $(document).ready(function () {
           
           $("#DoB").datepicker();
           $("#SearchDoB").datepicker();
           $("#RegDate").datepicker();

            $('.wizard').wizard();
        })
    </script>

</asp:Content>