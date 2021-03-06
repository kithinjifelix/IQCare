/****** Object:  StoredProcedure [dbo].[pr_GetPharmacypriorPrescription_Web]    Script Date: 8/15/2018 12:34:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Update By : <Bhupendra Singh>
-- Ref : <Bug ID 619 [Redmine 3.8.0]>
-- =============================================
Create PROCEDURE [dbo].[pr_GetPharmacypriorPrescription_Web] @ptn_pk INT
AS
/*
pr_GetPharmacypriorPrescription_Web 5118
*/
BEGIN
 SELECT DISTINCT '0' AS orderId
  ,a.Drug_Pk [DrugId]
  ,a.DrugName [DrugName]
  ,a.[Dispensing Unit Id] [DispensingUnitId]
  ,a.[Dispensing Unit] [Unit]
  ,a.BatchNo
  ,a.BatchId
  ,convert(VARCHAR(11), a.ExpiryDate, 113) [ExpiryDate]
  ,a.MorningDose AS Morning
  ,a.MiddayDose AS Midday
  ,a.EveningDose AS Evening
  ,a.NightDose AS Night
  ,a.Duration
  ,a.PillCount
  ,a.OrderedQuantity AS [QtyPrescribed]
  ,a.DispensedQuantity [QtyDispensed]
  ,a.Prophylaxis
  ,a.comments
  ,a.PatientInstructions AS [Instructions]
  ,a.PrintPrescriptionStatus
  ,a.RegimenType [GenericAbbrevation]
  ,isnull(a.QtyUnitDisp, 0) QtyUnitDisp
  ,isnull(a.syrup, 0) syrup
  ,a.UserID
  ,a.StoreId
  ,a.RegimenLine
  ,a.RegimenId
 FROM vw_patientpharmacy a
 WHERE a.VisitID IN (
   SELECT MAX(VisitId)
   FROM ord_PatientPharmacyOrder
   WHERE Ptn_pk = @ptn_pk and (DeleteFlag=0 or DeleteFlag IS NULL)
   )
  --SELECT DISTINCT a.ptn_pharmacy_pk AS orderId
  --	,a.Drug_Pk [DrugId]
  --	,a.DrugName [DrugName]
  --	,a.[Dispensing Unit Id] [DispensingUnitId]
  --	,a.[Dispensing Unit] [Unit]
  --	,''[BatchNo]
  --	,''[BatchId]
  --	,''[ExpiryDate]
  --	,''[Morning]
  --	,''[Midday]
  --	,''[Evening]
  --	,''[Night]
  --	,''[Duration]
  --	,''[PillCount]
  --	,''[QtyPrescribed]
  --	,''[QtyDispensed]
  --	,a.Prophylaxis
  --	,''[comments]
  --	,''[Instructions]
  --	,''[PrintPrescriptionStatus]
  --	,''[GenericAbb]
  --	,'0'[QtyUnitDisp]
  --	,'0'[syrup]
  --	,'' [UserID]
  --FROM vw_patientpharmacy a
  --WHERE a.VisitID IN (
  --		SELECT MAX(VisitId)
  --		FROM ord_PatientPharmacyOrder
  --		WHERE Ptn_pk = @ptn_pk
  --		)
END