/****** Object:  StoredProcedure [dbo].[pr_SCM_GetPharmacyOrderDetail_Web]    Script Date: 8/15/2018 12:52:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[pr_SCM_GetPharmacyOrderDetail_Web] @visit_id INT
AS
BEGIN
	SELECT DISTINCT a.ptn_pharmacy_pk AS orderId
		,a.Drug_Pk [DrugId]
		,a.DrugName [DrugName]
		,a.[Dispensing Unit Id] [DispensingUnitId]
		,a.[Dispensing Unit] [Unit]
		,a.BatchNo
		,a.BatchId
		,CONVERT(VARCHAR(11), a.ExpiryDate, 113) [ExpiryDate]
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
		,ISNULL(a.QtyUnitDisp, 0) QtyUnitDisp
		,ISNULL(a.syrup, 0) syrup
		,a.UserID
		,ISNULL(a.ProgID, 0) TreatmentProgram
		,ISNULL(a.RegimenLine, 0) RegimenLine
		,ISNULL(a.RegimenId, 0) RegimenId
		,ISNULL(a.TreatmentPlan, 0) TreatmentPlan
		,ISNULL(a.StoreId, 0) StoreId
		,ISNULL(a.UnitSellingPrice, 0) AS SellingPrice
		,a.PatientClassification
		,ISNULL(a.IsEnrolDifferenciatedCare,0) as IsEnrolDifferenciatedCare
		,a.ARTRefillModel
	FROM vw_patientpharmacy a
	WHERE a.VisitID = @visit_id;

	SELECT TOP 1 OrderedBy
		,CONVERT(VARCHAR, OrderedByDate, 106) AS OrderedByDate
		,DispensedBy
		,CONVERT(VARCHAR, DispensedByDate, 106) AS DispensedByDate
		,ISNULL(ProgId, 0) [ProgId]
		,ptn_pharmacy_pk
		,StoreId
	FROM vw_patientpharmacy
	WHERE VisitID = @visit_id;

	SELECT CASE 
			WHEN a.OrderStatus = 1
				THEN 'New Order'
			WHEN a.OrderStatus = 3
				THEN 'Partial Dispense'
			ELSE 'Already Dispensed Order'
			END [OrderStatus]
	FROM dbo.ord_PatientPharmacyOrder a
	WHERE VisitID = @visit_id;
END;
