IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[API_DrugPrescription]'))
DROP VIEW [dbo].[API_DrugPrescription]
GO
/****** Object:  View [dbo].[API_DrugPrescription]    Script Date: 22-Jun-2018 16:21:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[API_DrugPrescription]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dbo].[API_DrugPrescription]
AS
SELECT
	o.Ptn_pk AS ptnpk
   ,(SELECT TOP 1 Id FROM Patient	WHERE ptn_pk = o.ptn_pk)	AS PatientId
   ,o.PatientMasterVisitId
   ,i.IdentifierValue [ID]
   ,(SELECT TOP 1	f.NationalId	FROM mst_Facility f	WHERE f.FacilityID=o.LocationID)	[SENDING_FACILITY]
   ,ISNULL((SELECT	gn.IdentifierValue	FROM vw_PersonGodsNumber gn	WHERE gn.PatientId = i.patientId)	, '''') EXT_ID
   ,''GODS_NUMBER'' [EXT_IDENTIFIER_TYPE]
   ,''MPI'' [EXT_ASSIGNING_AUTHOURITY]
   ,''CCC_NUMBER'' [IDENTIFIER_TYPE]
   ,''CCC'' [ASSIGNING_AUTHORITY]
   ,(SELECT top 1 Name	FROM mst_Decode	WHERE ID = o.ProgID)	INDICATION
   ,'''' TREATMENT_INSTRUCTION
   ,CAST(DECRYPTBYKEY(p.NationalId) AS VARCHAR(50)) [ID2]
   ,''NATIONAL_ID'' [IDENTIFIER_TYPE2]
   ,''GOK'' [ASSIGNING_AUTHORITY2]
   ,o.ptn_pharmacy_pk
   ,CAST(DECRYPTBYKEY(g.FirstName) AS VARCHAR(50)) [FIRST_NAME]
   ,CAST(DECRYPTBYKEY(g.MidName) AS VARCHAR(50)) [MIDDLE_NAME]
   ,CAST(DECRYPTBYKEY(g.LastName) AS VARCHAR(50)) [LAST_NAME]
   ,o.OrderedByDate [TRANSACTION_DATETIME]
   ,''CA'' [ORDER_CONTROL]
   ,o.ptn_pharmacy_pk [NUMBER]
   ,''IQCARE'' [ENTITY]
   ,o.OrderedByDate [PHARMACY_ORDER_DATE]
   ,''CA'' [ORDER_STATUS]
   ,(SELECT TOP 1	UserFirstName		FROM mst_user u		WHERE u.UserID = o.OrderedBy)	[ORDERING_PHYSICIAN_FIRST_NAME]
   ,(SELECT TOP 1 UserLastName		FROM mst_user u		WHERE u.UserID = o.OrderedBy)	[ORDERING_PHYSICIAN_LAST_NAME]
   ,d.PatientInstructions [NOTES]
   ,CASE
		WHEN d.Drug_Pk IN (SELECT Drug_Pk	FROM lnk_DrugGeneric g WHERE g.GenericID IN (SELECT	GenericID	FROM lnk_DrugTypeGeneric t
					WHERE t.DrugTypeId = 37)) THEN (SELECT TOP 1 ItemName	FROM LookupItemView		WHERE ItemId = a.RegimenId) --(SELECT g.GenericID FROM lnk_DrugGeneric g where g.Drug_pk= d.Drug_Pk AND g.GenericID IN(SELECT t.Drug_pk FROM lnk_DrugTypeGeneric t WHERE DrugTypeId=37)) THEN '''' -- d.Drug_PK IN IN(SELECT top 1 mst_Drug m WHERE m.Drug_Pk IN()WHERE -- k.GenericId FROM lnk_DrugTypeGeneric k WHERE k.DrugTypeId=37) then (SELECT top 1 l.ItemName  FROM LookupItemView l WHERE ItemId=a.RegimenId)
		ELSE (SELECT TOP 1	GenericName	FROM mst_Generic m	WHERE m.GenericID IN (SELECT g.GenericID FROM lnk_DrugGeneric g	WHERE g.Drug_pk = d.Drug_pk))
	END [DRUG_NAME]
   ,''NASCOP_CODES'' [CODING_SYSTEM]
   ,(SELECT Top 1	StrengthName FROM mst_Strength	WHERE StrengthId IN (SELECT TOP 1 StrengthId	FROM lnk_DrugStrength WHERE DrugId = d.Drug_Pk))	[STRENGTH]
   ,d.SingleDose [DOSAGE]
   ,(SELECT TOP 1	f.Name	FROM mst_Frequency f	WHERE f.ID = d.FrequencyID) [FREQUENCY]
   ,d.Duration [DURATION]
   ,d.OrderedQuantity [QUANTITY_PRESCRIBED]
   ,o.PharmacyNotes [PRESCRIPTION_NOTES]
FROM dtl_PatientPharmacyOrder d
INNER JOIN ord_PatientPharmacyOrder o	ON o.ptn_pharmacy_pk = d.ptn_pharmacy_pk
INNER JOIN Patient p	ON p.ptn_pk = o.Ptn_pk
INNER JOIN Person g	ON g.Id = p.PersonId
LEFT JOIN ARVTreatmentTracker a	ON a.PatientMasterVisitId = o.PatientMasterVisitId	AND a.PatientId = o.PatientId
INNER JOIN PatientIdentifier i	ON i.PatientId = p.Id
WHERE i.IdentifierTypeId = 1
AND o.PatientMasterVisitId IS NOT NULL




' 
GO
