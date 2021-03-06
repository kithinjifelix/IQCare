﻿using System;
using System.Data;
using Application.Common;
using DataAccess.Base;
using DataAccess.Common;
using DataAccess.Entity;
using Interface.SCM;

namespace BusinessProcess.SCM
{
    /// <summary>
    /// 
    /// </summary>
    public class BDrug : ProcessBase, IDrug
    {
        #region "Constructor"

        /// <summary>
        /// Initializes a new instance of the <see cref="BDrug"/> class.
        /// </summary>
        public BDrug()
        {
        }

        #endregion "Constructor"

        /// <summary>
        /// Checks the dispenced date.
        /// </summary>
        /// <param name="patientId">The patient identifier.</param>
        /// <param name="LocationID">The location identifier.</param>
        /// <param name="dispDate">The disp date.</param>
        /// <param name="orderId">The order identifier.</param>
        /// <returns></returns>
        public DataSet CheckDispencedDate(int patientId, int locationId, DateTime dispDate, int orderId)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddExtendedParameters("@Ptn_Pk", SqlDbType.Int, patientId);
            ClsUtility.AddExtendedParameters("@LocationId", SqlDbType.Int, locationId);
            ClsUtility.AddExtendedParameters("@DispensedByDate", SqlDbType.DateTime, dispDate.ToString());
            ClsUtility.AddExtendedParameters("@OrderId", SqlDbType.Int, orderId);
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_CheckDispencedDate_Futures", ClsUtility.ObjectEnum.DataSet);
        }

        /// <summary>
        /// Gets the drug type identifier.
        /// </summary>
        /// <param name="itemId">The item identifier.</param>
        /// <returns></returns>
        public DataSet GetDrugTypeID(int itemId)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddExtendedParameters("@Drug_Pk", SqlDbType.Int, itemId);
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_GetDrugTypeId_futures", ClsUtility.ObjectEnum.DataSet);
        }

        /// <summary>
        /// Gets the pharmacy details by despenced.
        /// </summary>
        /// <param name="orderId">The order identifier.</param>
        /// <returns></returns>
        public DataSet GetPharmacyDetailsByDespenced(int orderId)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddExtendedParameters("@Ptn_Pharmacy_Pk", SqlDbType.Int, orderId);
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_GetPharmacyDetailsByDispenced_Futures", ClsUtility.ObjectEnum.DataSet);
        }

        /// <summary>
        /// Gets the pharmacy dispense masters.
        /// </summary>
        /// <param name="patientId">The patient identifier.</param>
        /// <param name="storeId">The store identifier.</param>
        /// <returns></returns>
        public DataSet GetPharmacyDispenseMasters(int patientId, int storeId)
        {
            lock (this)
            {
                ClsUtility.Init_Hashtable();
                ClsUtility.AddExtendedParameters("@Ptn_Pk", SqlDbType.Int, patientId);
                ClsUtility.AddExtendedParameters("@StoreId", SqlDbType.Int, storeId);
                ClsObject theManager = new ClsObject();
                return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "Pr_SCM_GetPharmacyDispenseMasters_Futures", ClsUtility.ObjectEnum.DataSet);
            }
        }

        /// <summary>
        /// Gets the pharmacy existing record.
        /// </summary>
        /// <param name="patientId">The patient identifier.</param>
        /// <param name="storeId">The store identifier.</param>
        /// <returns></returns>
        public DataTable GetPharmacyExistingRecord(int patientId, int storeId)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddExtendedParameters("@Ptn_Pk", SqlDbType.Int, patientId);
            ClsUtility.AddExtendedParameters("@StoreId", SqlDbType.Int, storeId);
            ClsObject theManager = new ClsObject();
            return (DataTable)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_GetExistingPharmacyDispense_Futures", ClsUtility.ObjectEnum.DataTable);
        }

        public DataTable GetPharmacyRegimenClassification()
        {
            ClsUtility.Init_Hashtable();
            ClsObject theManager = new ClsObject();
            return (DataTable)theManager.ReturnObject(ClsUtility.theParams, "sp_getRegimenClassification", ClsUtility.ObjectEnum.DataTable);
        }

        public DataTable GetPMTCTPeriodDrugTaken()
        {
            ClsUtility.Init_Hashtable();
            ClsObject theManager = new ClsObject();
            return (DataTable)theManager.ReturnObject(ClsUtility.theParams, "sp_getPMTCTPeriodDrugTaken", ClsUtility.ObjectEnum.DataTable);
        }

        /// <summary>
        /// Gets the pharmacy existing record details.
        /// </summary>
        /// <param name="orderId">The order identifier.</param>
        /// <returns></returns>
        public DataSet GetPharmacyExistingRecordDetails(int orderId)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddExtendedParameters("@Ptn_Pharmacy_Pk", SqlDbType.Int, orderId);
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_GetPharmacyOrderDetail_Futures", ClsUtility.ObjectEnum.DataSet);
        }

        /// <summary>
        /// Gets the pharmacy prescription details.
        /// </summary>
        /// <param name="pharmacyId">The pharmacy identifier.</param>
        /// <param name="patientId">The patient identifier.</param>
        /// <param name="IQCareFlag">The iq care flag.</param>
        /// <returns></returns>
        public DataSet GetPharmacyPrescriptionDetails(int pharmacyId, int patientId, int IQCareFlag)
        {
            ClsObject PharmacyManager = new ClsObject();
            ClsUtility.Init_Hashtable();
            ClsUtility.AddExtendedParameters("@Ptn_Pharmacy_Pk", SqlDbType.Int, pharmacyId);
            ClsUtility.AddExtendedParameters("@PatientId", SqlDbType.Int, patientId);
            ClsUtility.AddParameters("@IQCareFlag", SqlDbType.Int, IQCareFlag.ToString());
          //  ClsUtility.AddParameters("@password", SqlDbType.VarChar, ApplicationAccess.DBSecurity);
            return (DataSet)PharmacyManager.ReturnObject(ClsUtility.theParams, "pr_SCM_GetPharmacyPrescription_Futures", ClsUtility.ObjectEnum.DataSet);
        }

        /// <summary>
        /// Gets the prescription list.
        /// </summary>
        /// <param name="locationId">The location identifier.</param>
        /// <param name="prescriptionDate">The prescription date.</param>
        /// <param name="orderStatus">The order status.</param>
        /// <returns></returns>
        public DataTable GetPrescriptionList(int locationId, DateTime prescriptionDate, int orderStatus)
        {
            ClsObject obj = new ClsObject();
            ClsUtility.Init_Hashtable();
            ClsUtility.AddExtendedParameters("@LocationId", SqlDbType.Int, locationId);
            ClsUtility.AddExtendedParameters("@PrescriptionStatus", SqlDbType.Int, orderStatus);
            ClsUtility.AddExtendedParameters("@PrescriptionDate", SqlDbType.DateTime, prescriptionDate);
            return (DataTable)obj.ReturnObject(ClsUtility.theParams, "Pharmacy_GetPrescription", ClsUtility.ObjectEnum.DataTable);
        }

        /// <summary>
        /// Saves the art data.
        /// </summary>
        /// <param name="patientId">The patient identifier.</param>
        /// <param name="dispensedDate">The dispenced date.</param>
        /// <returns></returns>
        public DataSet SaveArtData(int patientId, DateTime dispensedDate)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddExtendedParameters("@Ptn_Pk", SqlDbType.Int, patientId);
            ClsUtility.AddExtendedParameters("@dispencedDate", SqlDbType.DateTime, dispensedDate.ToString());
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SaveUpdateArtData_Futures", ClsUtility.ObjectEnum.DataSet);
        }

        /// <summary>
        /// Saves the hiv treatement pharmacy field.
        /// </summary>
        /// <param name="orderId">The order identifier.</param>
        /// <param name="weight">The weight.</param>
        /// <param name="height">The height.</param>
        /// <param name="Program">The program.</param>
        /// <param name="PeriodTaken">The period taken.</param>
        /// <param name="Provider">The provider.</param>
        /// <param name="RegimenLine">The regimen line.</param>
        /// <param name="nextAppDate">The NXT application date.</param>
        /// <param name="reason">The reason.</param>
        /// <returns></returns>
        public DataSet SaveHivTreatementPharmacyField(int orderId, string weight, string height, int program, int periodTaken, int provider, int regimenLine, DateTime nextAppDate, int reason)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddExtendedParameters("@OrderId", SqlDbType.Int, orderId);
            ClsUtility.AddParameters("@weight", SqlDbType.VarChar, weight.ToString());
            ClsUtility.AddParameters("@height", SqlDbType.VarChar, height.ToString());
            ClsUtility.AddParameters("@Programe", SqlDbType.Int, program.ToString());
            ClsUtility.AddParameters("@Periodtaken", SqlDbType.Int, periodTaken.ToString());
            ClsUtility.AddParameters("@Provider", SqlDbType.Int, provider.ToString());
            ClsUtility.AddParameters("@RegimenLine", SqlDbType.Int, regimenLine.ToString());
            ClsUtility.AddExtendedParameters("@NxtAppDate", SqlDbType.DateTime, nextAppDate.ToString());
            ClsUtility.AddParameters("@Reason", SqlDbType.Int, reason.ToString());

            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SaveUpdateHivTreatementPharmacyField_Futures", ClsUtility.ObjectEnum.DataSet);
        }
        public DataTable SavePharmacyDispense(
            int patientPk,
            int theLocationId,
            int storeId,
            int theUserId,
            DateTime theDispDate,
            int theOrderType,
            int theProgramId,
            string theRegimen,
            int orderId,
            DataTable theDT,
            DateTime? PharmacyRefillDate = null,
            int? PeriodTaken = null,
            int? RegimeLine = null,
            int? ProviderId = null,
            double? Height = null,
            double? Weight = null,
            string pharmacyNotes="")
        {
            DataTable dataTable = new DataTable();
            try
            {
                this.Connection = DataMgr.GetConnection();
                this.Transaction = DataMgr.BeginTransaction(this.Connection);
                ClsObject clsObject = new ClsObject();
                ClsUtility.Init_Hashtable();
                ClsUtility.AddExtendedParameters("@Ptn_Pk", SqlDbType.Int, patientPk);
                ClsUtility.AddExtendedParameters("@LocationId", SqlDbType.Int, theLocationId);
                ClsUtility.AddExtendedParameters("@DispensedBy", SqlDbType.Int, theUserId);
                ClsUtility.AddExtendedParameters("@DispensedByDate", SqlDbType.DateTime, theDispDate);
                ClsUtility.AddParameters("@OrderType", SqlDbType.Int, theOrderType.ToString());
                ClsUtility.AddParameters("@ProgramId", SqlDbType.Int, theProgramId.ToString()); 
                ClsUtility.AddParameters("@StoreId", SqlDbType.Int, storeId.ToString());
                ClsUtility.AddParameters("@Regimen", SqlDbType.VarChar, theRegimen);
                ClsUtility.AddExtendedParameters("@UserId", SqlDbType.Int, theUserId);
                ClsUtility.AddParameters("@OrderId", SqlDbType.Int, orderId.ToString());
                if (PeriodTaken.HasValue)
                {
                    ClsUtility.AddExtendedParameters("@PeriodTaken", SqlDbType.Int, PeriodTaken.Value);
                }
                if (RegimeLine.HasValue)
                {
                    ClsUtility.AddExtendedParameters("@RegimenLine", SqlDbType.Int, RegimeLine.Value);
                }
                if (ProviderId.HasValue)
                {
                    ClsUtility.AddExtendedParameters("@ProviderId", SqlDbType.Int, ProviderId.Value);
                }
                if (Height.HasValue)
                {
                    ClsUtility.AddExtendedParameters("@Height", SqlDbType.Decimal, Height.Value);
                }
                if (Weight.HasValue)
                {
                    ClsUtility.AddExtendedParameters("@Weight", SqlDbType.Decimal, Weight.Value);
                }
                if (!string.IsNullOrEmpty(pharmacyNotes))
                {
                    ClsUtility.AddExtendedParameters("@PharmacyNotes", SqlDbType.VarChar, pharmacyNotes);
                }
                //if (PharmacyRefillDate.HasValue)
                //    ClsUtility.AddExtendedParameters("@PharmacyRefillAppDate", SqlDbType.DateTime, PharmacyRefillDate.Value);
                dataTable = (DataTable)clsObject.ReturnObject(ClsUtility.theParams, "pr_SCM_SavePharmacyDispenseOrder_Futures", ClsUtility.ObjectEnum.DataTable);
                if (PharmacyRefillDate.HasValue)
                {
                    ClsUtility.Init_Hashtable();
                    ClsUtility.AddExtendedParameters("@PtnPk", SqlDbType.Int, patientPk);
                    ClsUtility.AddExtendedParameters("@LocationId", SqlDbType.Int, theLocationId);
                    ClsUtility.AddExtendedParameters("@VisitPk", SqlDbType.Int, Convert.ToInt32(dataTable.Rows[0]["VisitId"]));
                    ClsUtility.AddExtendedParameters("@AppDate", SqlDbType.DateTime, PharmacyRefillDate.Value);
                    ClsUtility.AddExtendedParameters("@UserId", SqlDbType.Int, theUserId);
                    ClsUtility.AddExtendedParameters("@EmpId", SqlDbType.Int, theUserId);
                    clsObject.ReturnObject(ClsUtility.theParams, "pr_SCM_SetPharmacyRefillAppointment", ClsUtility.ObjectEnum.ExecuteNonQuery);
                }
                foreach (DataRow row in (InternalDataCollectionBase)theDT.Rows)
                {
                    ClsUtility.Init_Hashtable();
                    ClsUtility.AddExtendedParameters("@Ptn_Pk", SqlDbType.Int, Convert.ToInt32(patientPk));
                    ClsUtility.AddExtendedParameters("@StoreId", SqlDbType.Int, Convert.ToInt32(storeId));
                    ClsUtility.AddExtendedParameters("@VisitId", SqlDbType.Int, Convert.ToInt32(dataTable.Rows[0]["VisitId"]));
                    ClsUtility.AddExtendedParameters("@Ptn_Pharmacy_Pk", SqlDbType.Int, Convert.ToInt32(dataTable.Rows[0]["Ptn_Pharmacy_Pk"]));
                    ClsUtility.AddExtendedParameters("@Drug_Pk", SqlDbType.Int, Convert.ToInt32(row["ItemId"]));
                    ClsUtility.AddExtendedParameters("@StrengthId", SqlDbType.Int, row["StrengthId"].ToString());
                    ClsUtility.AddExtendedParameters("@FrequencyId", SqlDbType.Int, row["FrequencyId"].ToString());
                    ClsUtility.AddExtendedParameters("@pillCount", SqlDbType.Int, row["PillCount"].ToString() != "" ? row["PillCount"].ToString() : "0");
                    ClsUtility.AddExtendedParameters("@DispensedQuantity", SqlDbType.Int, Convert.ToInt32(row["QtyDisp"]));
                    ClsUtility.AddExtendedParameters("@Prophylaxis", SqlDbType.Int, row["Prophylaxis"].ToString());
                    ClsUtility.AddExtendedParameters("@BatchId", SqlDbType.Int, row["BatchId"].ToString());
                    ClsUtility.AddExtendedParameters("@CostPrice", SqlDbType.Decimal, row["CostPrice"].ToString() != "" ? row["CostPrice"].ToString() : "0");
                    if (row["BatchNo"].ToString().Contains("("))
                        ClsUtility.AddParameters("@BatchNo", SqlDbType.VarChar, row["BatchNo"].ToString().Substring(0, row["BatchNo"].ToString().IndexOf('(')));
                    else
                        ClsUtility.AddParameters("@BatchNo", SqlDbType.VarChar, row["BatchNo"].ToString());
                    ClsUtility.AddParameters("@Margin", SqlDbType.Decimal, row["Margin"].ToString() != "" ? row["Margin"].ToString() : "0");
                    ClsUtility.AddParameters("@SellingPrice", SqlDbType.Decimal, row["SellingPrice"].ToString() != "" ? row["SellingPrice"].ToString() : "0");
                    ClsUtility.AddParameters("@BillAmount", SqlDbType.Decimal, row["BillAmount"].ToString() != "" ? row["BillAmount"].ToString() : "0");
                    ClsUtility.AddExtendedParameters("@ExpiryDate", SqlDbType.DateTime, row["ExpiryDate"].ToString());
                    ClsUtility.AddParameters("@DispensingUnit", SqlDbType.Int, row["DispensingUnitId"].ToString());
                    ClsUtility.AddExtendedParameters("@DispensedByDate", SqlDbType.DateTime, theDispDate.ToString());
                    ClsUtility.AddExtendedParameters("@LocationId", SqlDbType.Int, theLocationId);
                    ClsUtility.AddExtendedParameters("@UserId", SqlDbType.Int, theUserId);
                    ClsUtility.AddParameters("@DataStatus", SqlDbType.Int, row["DataStatus"].ToString());
                    ClsUtility.AddParameters("@PrescribeOrderedQuantity", SqlDbType.Decimal, row["OrderedQuantity"].ToString() != "" ? row["OrderedQuantity"].ToString() : "0");
                    ClsUtility.AddParameters("@Dose", SqlDbType.Decimal, row["Dose"].ToString() != "" ? row["Dose"].ToString() : "0");
                    ClsUtility.AddParameters("@Duration", SqlDbType.Decimal, row["Duration"].ToString() != "" ? row["Duration"].ToString() : "0");
                    ClsUtility.AddParameters("@PrintPrescriptionStatus", SqlDbType.Int, row["PrintPrescriptionStatus"].ToString());
                    ClsUtility.AddParameters("@PatientInstructions", SqlDbType.VarChar, row["PatientInstructions"].ToString());
                    if (row.IsNull("WhyPartial") == false)
                    {
                        ClsUtility.AddParameters("@WhyPartial", SqlDbType.VarChar, row["WhyPartial"].ToString());
                    }
                    int num = (int)clsObject.ReturnObject(ClsUtility.theParams, "pr_SCM_SavePharmacyDispenseOrderDetail_Futures", ClsUtility.ObjectEnum.ExecuteNonQuery);
                }
                DataMgr.CommitTransaction(this.Transaction);
                DataMgr.ReleaseConnection(this.Connection);
            }
            catch
            {
                DataMgr.RollBackTransation(this.Transaction);
                throw;
            }
            finally
            {
                if (this.Connection != null)
                    DataMgr.ReleaseConnection(this.Connection);
            }
            return dataTable;
        }
      
        /// <summary>
        /// Saves the pharmacy return.
        /// </summary>
        /// <param name="patientId">The patient identifier.</param>
        /// <param name="theLocationId">The location identifier.</param>
        /// <param name="storeId">The store identifier.</param>
        /// <param name="theReturnDate">The return date.</param>
        /// <param name="theUserId">The user identifier.</param>
        /// <param name="thePharmacyId">The pharmacy identifier.</param>
        /// <param name="theDT">The dt.</param>
        public void SavePharmacyReturn(int patientId, int theLocationId, int storeId, DateTime theReturnDate, int theUserId, int thePharmacyId, DataTable theDT)
        {
            try
            {
                this.Connection = DataMgr.GetConnection();
                this.Transaction = DataMgr.BeginTransaction(this.Connection);
                ClsObject theManager = new ClsObject();

                foreach (DataRow theDR in theDT.Rows)
                {
                    if (Convert.ToInt32(theDR["ReturnQty"]) > 0)
                    {
                        ClsUtility.Init_Hashtable();
                        ClsUtility.AddParameters("@Ptn_Pk", SqlDbType.Int, patientId.ToString());
                        ClsUtility.AddParameters("@StoreId", SqlDbType.Int, storeId.ToString());
                        ClsUtility.AddParameters("@VisitId", SqlDbType.Int, theDR["visitId"].ToString());
                        ClsUtility.AddParameters("@Ptn_Pharmacy_Pk", SqlDbType.Int, thePharmacyId.ToString());
                        ClsUtility.AddParameters("@Drug_Pk", SqlDbType.Int, theDR["ItemId"].ToString());
                        ClsUtility.AddParameters("@StrengthId", SqlDbType.Int, theDR["StrengthId"].ToString());
                        ClsUtility.AddParameters("@FrequencyId", SqlDbType.Int, theDR["FrequencyId"].ToString());
                        ClsUtility.AddParameters("@ReturnQuantity", SqlDbType.Int, theDR["ReturnQty"].ToString());
                        ClsUtility.AddParameters("@ReturnReason", SqlDbType.Int, theDR["ReturnReason"].ToString());
                        ClsUtility.AddParameters("@Prophylaxis", SqlDbType.Int, theDR["Prophylaxis"].ToString());
                        ClsUtility.AddParameters("@BatchId", SqlDbType.Int, theDR["BatchId"].ToString());
                        ClsUtility.AddParameters("@CostPrice", SqlDbType.Decimal, theDR["CostPrice"].ToString());
                        ClsUtility.AddParameters("@Margin", SqlDbType.Decimal, theDR["Margin"].ToString());
                        ClsUtility.AddParameters("@SellingPrice", SqlDbType.Decimal, theDR["SellingPrice"].ToString());
                        ClsUtility.AddParameters("@BillAmount", SqlDbType.Decimal, theDR["BillAmount"].ToString());
                        ClsUtility.AddParameters("@ExpiryDate", SqlDbType.DateTime, theDR["ExpiryDate"].ToString());
                        ClsUtility.AddParameters("@DispensingUnit", SqlDbType.Int, theDR["DispensingUnitId"].ToString());
                        ClsUtility.AddParameters("@ReturnDate", SqlDbType.DateTime, theReturnDate.ToString());
                        ClsUtility.AddParameters("@LocationId", SqlDbType.Int, theLocationId.ToString());
                        ClsUtility.AddParameters("@UserId", SqlDbType.Int, theUserId.ToString());
                        int theRowCount = (int)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SavePharmacyReturnDetail_Futures", ClsUtility.ObjectEnum.ExecuteNonQuery);
                    }
                }
                DataMgr.CommitTransaction(this.Transaction);
                DataMgr.ReleaseConnection(this.Connection);
            }
            catch
            {
                DataMgr.RollBackTransation(this.Transaction);
                throw;
            }
            finally
            {
                if (this.Connection != null)
                    DataMgr.ReleaseConnection(this.Connection);
            }
        }

        public int saveUpdatePatientRegistration(string fname, string mname, string lname, string enrollment, string dob,string gender,
            string locationid,string regDate, string userid, string serviceid)
        {
            ClsObject PharmacyManager = new ClsObject();
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@firstName", SqlDbType.VarChar, fname);
            ClsUtility.AddParameters("@middleName", SqlDbType.VarChar, mname);
            ClsUtility.AddParameters("@lastName", SqlDbType.VarChar, lname);
            ClsUtility.AddParameters("@patientEnrollmentID", SqlDbType.VarChar, enrollment);
            ClsUtility.AddParameters("@DOB", SqlDbType.VarChar, dob);
            ClsUtility.AddParameters("@gender", SqlDbType.VarChar, gender);
            ClsUtility.AddParameters("@locationID", SqlDbType.VarChar, locationid);
            ClsUtility.AddParameters("@regDate", SqlDbType.VarChar, regDate);
            ClsUtility.AddParameters("@userID", SqlDbType.VarChar, userid);
            ClsUtility.AddParameters("@serviceId", SqlDbType.VarChar, serviceid);

            return (int)PharmacyManager.ReturnObject(ClsUtility.theParams, "Pharmacy_SaveUpdateRegistration", ClsUtility.ObjectEnum.ExecuteNonQuery);
        }

        public DataTable getPatientsRegistered()
        {
            ClsObject PharmacyManager = new ClsObject();
            ClsUtility.Init_Hashtable();

            return (DataTable)PharmacyManager.ReturnObject(ClsUtility.theParams, "Pharmacy_GetAllRegisteredPatients", ClsUtility.ObjectEnum.DataTable);
        }

        public DataTable searchPatientsRegistered(string fname, string mname, string lname, string patientId)
        {
            ClsObject PharmacyManager = new ClsObject();
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@fname", SqlDbType.VarChar, fname);
            ClsUtility.AddParameters("@mname", SqlDbType.VarChar, mname);
            ClsUtility.AddParameters("@lname", SqlDbType.VarChar, lname);
            ClsUtility.AddParameters("@patientid", SqlDbType.VarChar, patientId);

            return (DataTable)PharmacyManager.ReturnObject(ClsUtility.theParams, "Pharmacy_SearchAllRegisteredPatients", ClsUtility.ObjectEnum.DataTable);
        }

        public int detelePatientPharmacyOrder(int ptn_pharmacy_pk)
        {
            ClsObject PharmacyManager = new ClsObject();
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@ptn_pharmacy_pk", SqlDbType.Int, ptn_pharmacy_pk.ToString());

            return (int)PharmacyManager.ReturnObject(ClsUtility.theParams, "sp_deletePatientPharmacyOrder", ClsUtility.ObjectEnum.ExecuteNonQuery);
        }

        public DataSet pendingPharmacyOrders()
        {
            ClsObject PharmacyManager = new ClsObject();
            ClsUtility.Init_Hashtable();

            return (DataSet)PharmacyManager.ReturnObject(ClsUtility.theParams, "sp_PharmacyPendingOrders", ClsUtility.ObjectEnum.DataSet);
        }

        public DataSet GetDrugBatchDetails(int DrugID, int StoreID)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@Drug_id", SqlDbType.Int, DrugID.ToString());
            ClsUtility.AddParameters("@StoreID", SqlDbType.Int, StoreID.ToString());
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_GetDrugBatchDetails", ClsUtility.ObjectEnum.DataSet);
        }

        public DataSet GetPharmacyVitals(int PatientID)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@ptn_pk", SqlDbType.Int, PatientID.ToString());
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_GetPharmacyVitals", ClsUtility.ObjectEnum.DataSet);
        }

        public DataTable ReturnDatatableQuery(string theQuery)
        {
            lock (this)
            {
                ClsObject theQB = new ClsObject();
                ClsUtility.Init_Hashtable();
                ClsUtility.AddParameters("@QryString", SqlDbType.VarChar, theQuery);
                return (DataTable)theQB.ReturnObject(ClsUtility.theParams, "pr_General_SQLTable_Parse", ClsUtility.ObjectEnum.DataTable);
            }
        }

        public DataSet GetSelectedDrugDetails(int DrugID, int StoreID)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@Drug_id", SqlDbType.Int, DrugID.ToString());
            ClsUtility.AddParameters("@StoreID", SqlDbType.Int, StoreID.ToString());
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_GetSelectedDrugDetails", ClsUtility.ObjectEnum.DataSet);
        }

        public DataTable SavePharmacyDispense_Web(Int32 PatientId, Int32 LocationId, Int32 StoreId, Int32 UserId, int dispensedBy, string DispDate,
          Int32 OrderType, Int32 ProgramId, string theRegimen, Int32 OrderId, DataTable theDT, string PharmacyRefillDate, Int32 DataStatus,
            int orderedBy, string orderDate, string deleteScript, int regimenLine = 0, int regimenCode = 0, int therapyPlan = 0
            , int patientClassification = 0, int isEnrolDifferenciatedCare = 0)
        {
            string Morning, Midday, Evening, Night;
            DataTable thePharmacyDT = new DataTable();
            //Added by VY for regimen
            #region "Regimen"

            //string theRegimen = "";
            string thetmpRegimen = "";
            for (int i = 0; i < theDT.Rows.Count; i++)
            {

                if (theDT.Rows[i]["GenericAbbrevation"].ToString() != "")
                {
                    if (thetmpRegimen == "")
                    {
                        thetmpRegimen = theDT.Rows[i]["GenericAbbrevation"].ToString();
                    }
                    else
                    {
                        thetmpRegimen = String.Format("{0}/{1}", thetmpRegimen, theDT.Rows[i]["GenericAbbrevation"]);
                    }
                }
                thetmpRegimen = thetmpRegimen.Trim();


            }

            foreach (string s in thetmpRegimen.Split('/'))
            {
                if (theRegimen == "" && s != "")
                    theRegimen = theRegimen + s;
                else if (theRegimen != "" && s != "")
                    if (!theRegimen.Contains(s))
                        theRegimen = theRegimen + "/" + s;
            }
            #endregion
            try
            {
                this.Connection = DataMgr.GetConnection();
                this.Transaction = DataMgr.BeginTransaction(this.Connection);
                ClsObject theManager = new ClsObject();
                ClsUtility.Init_Hashtable();
                ClsUtility.AddParameters("@Ptn_Pk", SqlDbType.Int, PatientId.ToString());
                ClsUtility.AddParameters("@LocationId", SqlDbType.Int, LocationId.ToString());
                ClsUtility.AddParameters("@DispensedBy", SqlDbType.Int, dispensedBy.ToString());
                if (DispDate.ToString() != "")
                    ClsUtility.AddParameters("@DispensedByDate", SqlDbType.VarChar, DispDate.ToString());
                ClsUtility.AddParameters("@OrderType", SqlDbType.Int, OrderType.ToString());
                ClsUtility.AddParameters("@ProgramId", SqlDbType.Int, ProgramId.ToString());
                ClsUtility.AddParameters("@StoreId", SqlDbType.Int, StoreId.ToString());
                ClsUtility.AddParameters("@Regimen", SqlDbType.VarChar, theRegimen);
                ClsUtility.AddParameters("@UserId", SqlDbType.Int, UserId.ToString());
                ClsUtility.AddParameters("@OrderId", SqlDbType.Int, OrderId.ToString());
                ClsUtility.AddParameters("@AppointmentDate", SqlDbType.VarChar, PharmacyRefillDate.ToString());
                ClsUtility.AddParameters("@OrderedBy", SqlDbType.Int, orderedBy.ToString());
                if (orderDate.ToString() != "")
                    ClsUtility.AddParameters("@OrderDate", SqlDbType.VarChar, orderDate.ToString());
                if (deleteScript != "")
                    ClsUtility.AddParameters("@deleteScript", SqlDbType.VarChar, deleteScript);
                ClsUtility.AddParameters("@RegimenLine", SqlDbType.Int, regimenLine.ToString());
                ClsUtility.AddParameters("@RegimenCode", SqlDbType.Int, regimenCode.ToString());
                ClsUtility.AddParameters("@TherapyPlan", SqlDbType.Int, therapyPlan.ToString());

                ClsUtility.AddParameters("@PatientClassification", SqlDbType.Int, patientClassification.ToString());
                ClsUtility.AddParameters("@IsEnrolDifferenciatedCare", SqlDbType.Int, isEnrolDifferenciatedCare.ToString());

                thePharmacyDT = (DataTable)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SavePharmacyDispenseOrder_Web", ClsUtility.ObjectEnum.DataTable);


                foreach (DataRow theDR in theDT.Rows)
                {
                    ClsUtility.Init_Hashtable();
                    ClsUtility.AddParameters("@Ptn_Pk", SqlDbType.Int, PatientId.ToString());
                    ClsUtility.AddParameters("@StoreId", SqlDbType.Int, StoreId.ToString());
                    ClsUtility.AddParameters("@VisitId", SqlDbType.Int, thePharmacyDT.Rows[0]["VisitId"].ToString());
                    ClsUtility.AddParameters("@Ptn_Pharmacy_Pk", SqlDbType.Int, thePharmacyDT.Rows[0]["Ptn_Pharmacy_Pk"].ToString());
                    ClsUtility.AddParameters("@Drug_Pk", SqlDbType.Int, theDR["DrugId"].ToString());

                    ClsUtility.AddParameters("@MorningDose", SqlDbType.Decimal, Morning = (theDR["Morning"].ToString() == "") ? "0" : theDR["Morning"].ToString());
                    ClsUtility.AddParameters("@MiddayDose", SqlDbType.Decimal, Midday = (theDR["Midday"].ToString() == "") ? "0" : theDR["Midday"].ToString());
                    ClsUtility.AddParameters("@EveningDose", SqlDbType.Decimal, Evening = (theDR["Evening"].ToString() == "") ? "0" : theDR["Evening"].ToString());
                    ClsUtility.AddParameters("@NightDose", SqlDbType.Decimal, Night = (theDR["Night"].ToString() == "") ? "0" : theDR["Night"].ToString());

                    ClsUtility.AddParameters("@DispensedQuantity", SqlDbType.Int, "0");

                    ClsUtility.AddParameters("@Prophylaxis", SqlDbType.Int, theDR["Prophylaxis"].ToString() == "True" ? "1" : "0");

                    ClsUtility.AddParameters("@BatchId", SqlDbType.Int, theDR["BatchId"].ToString());

                    if (theDR["BatchNo"].ToString().Contains("("))
                    {
                        ClsUtility.AddParameters("@BatchNo", SqlDbType.VarChar, theDR["BatchNo"].ToString().Substring(0, theDR["BatchNo"].ToString().IndexOf('(')));
                    }
                    else
                    {
                        ClsUtility.AddParameters("@BatchNo", SqlDbType.VarChar, theDR["BatchNo"].ToString());
                    }

                    ClsUtility.AddParameters("@ExpiryDate", SqlDbType.VarChar, theDR["ExpiryDate"].ToString());
                    ClsUtility.AddParameters("@DispensingUnit", SqlDbType.Int, theDR["DispensingUnitId"].ToString());
                    if (DispDate.ToString() != "")
                        ClsUtility.AddParameters("@DispensedByDate", SqlDbType.VarChar, DispDate.ToString());
                    ClsUtility.AddParameters("@LocationId", SqlDbType.Int, LocationId.ToString());
                    ClsUtility.AddParameters("@UserId", SqlDbType.Int, UserId.ToString());
                    ClsUtility.AddParameters("@DataStatus", SqlDbType.Int, DataStatus.ToString());

                    ClsUtility.AddParameters("@Duration", SqlDbType.Decimal, theDR["Duration"].ToString() != "" ? theDR["Duration"].ToString() : "0");
                    ClsUtility.AddParameters("@PrescribeOrderedQuantity", SqlDbType.Decimal, theDR["QtyPrescribed"].ToString() != "" ? theDR["QtyPrescribed"].ToString() : "0");
                    ClsUtility.AddParameters("@PillCount", SqlDbType.VarChar, theDR["PillCount"].ToString() == "" ? "0" : theDR["PillCount"].ToString());
                    ClsUtility.AddParameters("@PrintPrescriptionStatus", SqlDbType.Int, theDR["PrintPrescriptionStatus"].ToString() == "True" ? "1" : "0");
                    ClsUtility.AddParameters("@PatientInstructions", SqlDbType.VarChar, theDR["Instructions"].ToString());
                    ClsUtility.AddParameters("@Comments", SqlDbType.VarChar, theDR["Comments"].ToString());

                    Int32 theRowCount = (Int32)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SavePharmacyDispenseOrderDetail_Web", ClsUtility.ObjectEnum.ExecuteNonQuery);

                    //Save details to dtl_PatientPharmacyOrderpartialDispense table
                    ClsUtility.Init_Hashtable();
                    ClsUtility.AddParameters("@Ptn_Pk", SqlDbType.Int, PatientId.ToString());
                    ClsUtility.AddParameters("@StoreId", SqlDbType.Int, StoreId.ToString());
                    ClsUtility.AddParameters("@ptn_pharmacy_pk", SqlDbType.Int, thePharmacyDT.Rows[0]["Ptn_Pharmacy_Pk"].ToString());
                    ClsUtility.AddParameters("@drug_pk", SqlDbType.Int, theDR["DrugId"].ToString());
                    ClsUtility.AddParameters("@batchid", SqlDbType.Int, theDR["BatchId"].ToString());
                    ClsUtility.AddParameters("@ExpiryDate", SqlDbType.VarChar, theDR["ExpiryDate"].ToString());
                    ClsUtility.AddParameters("@DispensedQuantity", SqlDbType.Int, theDR["QtyDispensed"].ToString() == "" ? "0" : theDR["QtyDispensed"].ToString());
                    //ClsUtility.AddParameters("@DispensedQuantity", SqlDbType.Decimal, theDR["RefillQty"].ToString() == "" ? "0" : theDR["RefillQty"].ToString());
                    ClsUtility.AddParameters("@DispensedBy", SqlDbType.Int, dispensedBy.ToString());
                    if (DispDate.ToString() != "")
                        ClsUtility.AddParameters("@DispensedByDate", SqlDbType.VarChar, DispDate.ToString());
                    ClsUtility.AddParameters("@PrintPrescriptionStatus", SqlDbType.Int, theDR["PrintPrescriptionStatus"].ToString() == "True" ? "1" : "0");
                    ClsUtility.AddParameters("@comments", SqlDbType.Int, theDR["comments"].ToString());
                    ClsUtility.AddParameters("@UserId", SqlDbType.Int, UserId.ToString());
                    DataTable dt = (DataTable)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SavePharmacyPartialDispense_Web", ClsUtility.ObjectEnum.DataTable);
                }

                DataMgr.CommitTransaction(this.Transaction);
                DataMgr.ReleaseConnection(this.Connection);
            }
            catch
            {
                DataMgr.RollBackTransation(this.Transaction);
                throw;
            }
            finally
            {
                if (this.Connection != null)
                    DataMgr.ReleaseConnection(this.Connection);
            }
            return thePharmacyDT;
        }

        public void SaveUpdateIPTData(Int32 PatientID, int visitId, DateTime INHStartDate, DateTime INHEndDate)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@Ptn_pk", SqlDbType.Int, PatientID.ToString());
            ClsUtility.AddParameters("@Visit_Pk", SqlDbType.Int, PatientID.ToString());
            ClsUtility.AddParameters("@INHStartDate", SqlDbType.VarChar, INHStartDate.ToString("dd-MMM-yyyy"));
            ClsUtility.AddParameters("@INHEndDate", SqlDbType.VarChar, INHEndDate.ToString("dd-MMM-yyyy"));
            ClsObject theManager = new ClsObject();
            Int32 theRowCount = (Int32)theManager.ReturnObject(ClsUtility.theParams, "pr_Clinical_SaveUpdate_IPTDetails", ClsUtility.ObjectEnum.ExecuteNonQuery);
        }

        public void LockpatientForDispensing(int PatientId, int OrderId, string UserName, string StartDate, bool LockPatient)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@ptn_pk", SqlDbType.Int, PatientId.ToString());
            ClsUtility.AddParameters("@ptn_pharmacy_pk", SqlDbType.Int, OrderId.ToString());
            ClsUtility.AddParameters("@UserName", SqlDbType.VarChar, UserName);
            ClsUtility.AddParameters("@StartDate", SqlDbType.VarChar, StartDate.ToString());
            ClsUtility.AddParameters("@LockPatient", SqlDbType.Bit, LockPatient.ToString());
            ClsObject theManager = new ClsObject();
            theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SaveLockpatientForDispensing", ClsUtility.ObjectEnum.DataSet);
        }

        public void SavePharmacyRefill_Web(DataTable dt, int iserId, int dispensedBy, string DispensedByDate, string deleteScript)
        {
            DataTable thePharmacyDT = new DataTable();
            try
            {
                this.Connection = DataMgr.GetConnection();
                this.Transaction = DataMgr.BeginTransaction(this.Connection);
                ClsObject theManager = new ClsObject();

                foreach (DataRow theDR in dt.Rows)
                {

                    ClsUtility.Init_Hashtable();
                    ClsUtility.AddParameters("@ptn_pharmacy_pk", SqlDbType.Int, theDR["orderId"].ToString());
                    ClsUtility.AddParameters("@drug_pk", SqlDbType.Int, theDR["DrugId"].ToString());
                    ClsUtility.AddParameters("@batchid", SqlDbType.Int, theDR["BatchId"].ToString());
                    //ClsUtility.AddParameters("@DispensedQuantity", SqlDbType.Decimal, theDR["RefillQty"].ToString() == "" ? "0" : theDR["RefillQty"].ToString());
                    ClsUtility.AddParameters("@DispensedQuantity", SqlDbType.Decimal, theDR["QtyDispensed"].ToString() == "" ? "0" : theDR["QtyDispensed"].ToString());
                    ClsUtility.AddParameters("@DispensedBy", SqlDbType.Int, dispensedBy.ToString());
                    if (DispensedByDate.ToString() != "")
                        ClsUtility.AddParameters("@DispensedByDate", SqlDbType.VarChar, DispensedByDate.ToString());
                    ClsUtility.AddParameters("@PrintPrescriptionStatus", SqlDbType.Int, theDR["PrintPrescriptionStatus"].ToString() == "True" ? "1" : "0");
                    ClsUtility.AddParameters("@comments", SqlDbType.Int, theDR["comments"].ToString());
                    if (deleteScript != "")
                        ClsUtility.AddParameters("@deleteScript", SqlDbType.VarChar, deleteScript);

                    theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SavePharmacyPartialDispense_Web", ClsUtility.ObjectEnum.DataTable);
                }

                DataMgr.CommitTransaction(this.Transaction);
                DataMgr.ReleaseConnection(this.Connection);
            }
            catch
            {
                DataMgr.RollBackTransation(this.Transaction);
                throw;
            }
            finally
            {
                if (this.Connection != null)
                    DataMgr.ReleaseConnection(this.Connection);
            }
        }

        public DataSet SaveHivTreatementPharmacyField(Int32 theOrderId, string weight, string height, int Program, int PeriodTaken, int Provider, int RegimenLine, int RegimenCode, DateTime NxtAppDate, int Reason)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@OrderID", SqlDbType.Int, theOrderId.ToString());
            ClsUtility.AddParameters("@weight", SqlDbType.VarChar, weight.ToString());
            ClsUtility.AddParameters("@height", SqlDbType.VarChar, height.ToString());
            ClsUtility.AddParameters("@Programe", SqlDbType.Int, Program.ToString());
            ClsUtility.AddParameters("@Periodtaken", SqlDbType.Int, PeriodTaken.ToString());
            ClsUtility.AddParameters("@Provider", SqlDbType.Int, Provider.ToString());
            ClsUtility.AddParameters("@RegimenLine", SqlDbType.Int, RegimenLine.ToString());
            ClsUtility.AddParameters("@RegimenCode", SqlDbType.Int, RegimenCode.ToString());
            ClsUtility.AddParameters("@NxtAppDate", SqlDbType.VarChar, NxtAppDate.ToString("dd-MMM-yyyy"));
            ClsUtility.AddParameters("@Region", SqlDbType.Int, Reason.ToString());

            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SaveUpdateHivTreatementPharmacyField_Futures", ClsUtility.ObjectEnum.DataSet);
        }

        public DataSet GetAllergyData(int PatientID)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@Ptn_Pk", SqlDbType.Int, PatientID.ToString());
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_Clinical_GetAllergy", ClsUtility.ObjectEnum.DataSet);
        }
        public DataSet GetPharmacyDrugHistory_Web(int PatientID)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@Ptn_Pk", SqlDbType.Int, PatientID.ToString());
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_GetPharmacyDrugHistory_Web", ClsUtility.ObjectEnum.DataSet);
        }

        public DataSet GetPriorPrescription(Int32 thePatientId)
        {
            lock (this)
            {
                ClsUtility.Init_Hashtable();
                ClsUtility.AddParameters("@Ptn_Pk", SqlDbType.Int, thePatientId.ToString());
                ClsObject theManager = new ClsObject();
                return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_GetPharmacypriorPrescription_Web", ClsUtility.ObjectEnum.DataSet);
            }
        }

        public DataSet GetPharmacyExistingRecordDetails_Web(Int32 VisitID)
        {
            ClsUtility.Init_Hashtable();
            ClsUtility.AddParameters("@visit_id", SqlDbType.Int, VisitID.ToString());
            ClsObject theManager = new ClsObject();
            return (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_GetPharmacyOrderDetail_web", ClsUtility.ObjectEnum.DataSet);
        }

        public DataSet MarkOrderAsFullyDispensed(Int32 orderID, string Reason)
        {
            DataSet dataset = new DataSet();

            try
            {
                this.Connection = DataMgr.GetConnection();
                this.Transaction = DataMgr.BeginTransaction(this.Connection);
                ClsObject theManager = new ClsObject();

                theManager.Connection = this.Connection;
                theManager.Transaction = this.Transaction;

                ClsUtility.Init_Hashtable();
                ClsUtility.AddParameters("@ptn_pharmacy_pk", SqlDbType.Int, orderID.ToString());
                ClsUtility.AddParameters("@Reason", SqlDbType.VarChar, Reason);

                dataset = (DataSet)theManager.ReturnObject(ClsUtility.theParams, "pr_SCM_SavePharmacyMarkOrderFullyDispensed_Web", ClsUtility.ObjectEnum.DataSet);

                DataMgr.CommitTransaction(this.Transaction);
                DataMgr.ReleaseConnection(this.Connection);
            }
            catch
            {
                DataMgr.RollBackTransation(this.Transaction);
                throw;
            }
            finally
            {
                if (this.Connection != null)
                    DataMgr.ReleaseConnection(this.Connection);
            }
            return dataset;
        }
    }
}