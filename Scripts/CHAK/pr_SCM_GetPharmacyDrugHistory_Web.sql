

/****** Object:  StoredProcedure [dbo].[pr_SCM_GetPharmacyDrugHistory_Web]    Script Date: 9/19/2018 7:52:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_SCM_GetPharmacyDrugHistory_Web] @Ptn_Pk INT

AS

BEGIN

	SELECT DISTINCT a.ptn_pharmacy_pk AS orderId

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

		,a.comments

		,a.PatientInstructions AS [Instructions]

		,a.PrintPrescriptionStatus

		,a.RegimenType [GenericAbb]

		,convert(VARCHAR, a.OrderedByDate, 106) AS OrderedByDate

		,convert(VARCHAR, a.DispensedByDate, 106) AS DispensedByDate

		,a.DispensedByDate AS DispDate

		,b.UserFirstName + ' ' + b.UserLastName AS PrescribedBy

		,c.UserFirstName + ' ' + c.UserLastName AS DispensedBy

	FROM vw_patientpharmacy a

	LEFT JOIN mst_User b ON a.OrderedBy = b.UserID

	LEFT JOIN mst_User c ON a.DispensedBy = c.UserID

	WHERE a.Ptn_pk = @Ptn_Pk

		AND a.DispensedByDate IS NOT NULL

	ORDER BY a.DispensedByDate DESC

END
GO


