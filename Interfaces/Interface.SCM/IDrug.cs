﻿using System;
using System.Data;

namespace Interface.SCM
{
    public interface IDrug
    {
        DataSet GetPharmacyDispenseMasters(int patientId, int storeId);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="thePatientId"></param>
        /// <param name="theLocationId"></param>
        /// <param name="theStoreId"></param>
        /// <param name="theUserId"></param>
        /// <param name="theDispDate"></param>
        /// <param name="theOrderType"></param>
        /// <param name="theProgramId"></param>
        /// <param name="theRegimen"></param>
        /// <param name="theOrderId"></param>
        /// <param name="theDT"></param>
        /// <returns></returns>
        DataTable SavePharmacyDispense(
            int patientId,
            int locationId,
            int storeId,
            int userId, 
            DateTime dispDate,
            int orderType,
            int programId, 
            string regimen,
            int orderId, 
            DataTable theDT, 
            DateTime? pharmacyRefillDate = null,
            int? periodTaken=null,
            int? regimeLine = null,
            int? providerId = null,
            double? height =null,
            double? weight = null,
            string pharmacyNotes = ""
            );
        /// <summary>
        /// 
        /// </summary>
        /// <param name="thePatientId"></param>
        /// <param name="theStoreId"></param>
        /// <returns></returns>
        DataTable GetPharmacyExistingRecord(int patientId, int storeId);
        DataSet GetPharmacyExistingRecordDetails(int orderId);
        void SavePharmacyReturn(int patientId, int locationId, int storeId, DateTime returnDate, int userId, int pharmacyId, DataTable theDT);
        DataSet GetPharmacyDetailsByDespenced(int orderId);

        DataSet GetAllergyData(int PatientID);
        DataSet GetPharmacyDrugHistory_Web(int PatientID);
        DataSet GetDrugTypeID(int itemId);
        DataSet SaveArtData(int patientId, DateTime dispensedDate);
        DataSet CheckDispencedDate(int patientId, int locationId, DateTime dispDate, int orderId);
        DataTable GetPrescriptionList(int locationId, DateTime prescriptionDate, int orderStatus);
        DataSet SaveHivTreatementPharmacyField(int orderId, string weight, string height, int program, int periodTaken, int provider, int regimenLine, DateTime nextAppDate, int reason);
        DataSet GetPharmacyPrescriptionDetails(int pharmacyId, int patientId, int IQCareFlag);
        DataTable GetPharmacyRegimenClassification();
        int saveUpdatePatientRegistration(string fname, string mname, string lname, string enrollment, string dob, string gender,
            string locationid, string regDate, string userid, string serviceid);
        DataTable getPatientsRegistered();
        DataTable searchPatientsRegistered(string fname, string mname, string lname, string enrollmentId);
        int detelePatientPharmacyOrder(int ptn_pharmacy_pk);
        DataSet pendingPharmacyOrders();
        DataTable GetPMTCTPeriodDrugTaken();
        DataSet GetDrugBatchDetails(int DrugID, int StoreID);
        DataSet GetPharmacyVitals(int PatientID);
        DataTable ReturnDatatableQuery(string theQuery);
        DataSet GetSelectedDrugDetails(int DrugID, int StoreID);
        DataTable SavePharmacyDispense_Web(Int32 PatientId, Int32 LocationId, Int32 StoreId, Int32 UserId, int dispensedBy, string DispDate,
          Int32 OrderType, Int32 ProgramId, string Regimen, Int32 OrderId, DataTable theDT, string PharmacyRefillDate, Int32 DataStatus, int orderedBy, string orderDate,
            string deleteScript, int regimenLine, int regimenCode, int therapyPlan, int patientClassification, int isEnrolDifferenciatedCare);
        void SaveUpdateIPTData(Int32 PatientID, int visitId, DateTime INHStartDate, DateTime INHEndDate);
        void LockpatientForDispensing(int PatientId, int OrderId, string UserName, string StartDate, bool LockPatient);
        void SavePharmacyRefill_Web(DataTable dt, int iserId, int dispensedBy, string DispensedByDate, string deleteScript);
        DataSet SaveHivTreatementPharmacyField(Int32 theOrderId, string weight, string height, int Program, int PeriodTaken, int Provider, int RegimenLine, int RegimenCode, DateTime NxtAppDate, int Reason);
        DataSet GetPriorPrescription(Int32 thePatientId);
        DataSet GetPharmacyExistingRecordDetails_Web(Int32 VisitID);
        DataSet MarkOrderAsFullyDispensed(Int32 orderID, string Reason);
    }
}
