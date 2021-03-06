SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  View [dbo].[view_patientVisit]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[view_patientVisit]'))
DROP VIEW [dbo].[view_patientVisit]
GO

/****** Object:  View [dbo].[PersonView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PersonView]'))
DROP VIEW [dbo].[PersonView]
GO
/****** Object:  View [dbo].[TestingSummaryStatistics] ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[TestingSummaryStatistics]'))
DROP VIEW [dbo].[TestingSummaryStatistics]
GO
/****** Object:  View [dbo].[PatientStabilitySummary] ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientStabilitySummary]'))
DROP VIEW [dbo].[PatientStabilitySummary]
GO
/****** Object:  View [dbo].[PersonContactView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PersonContactView]'))
DROP VIEW [dbo].[PersonContactView]
GO
/****** Object:  View [dbo].[PatientVisitView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientVisitView]'))
DROP VIEW [dbo].[PatientVisitView]
GO

/****** Object:  View [dbo].[PatientTreatmentTrackerView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentTrackerView]'))
DROP VIEW [dbo].[PatientTreatmentTrackerView]
GO
/****** Object:  View [dbo].[PatientTreatmentSupporterView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientTreatmentSupporterView]'))
DROP VIEW [dbo].[PatientTreatmentSupporterView]
GO
/****** Object:  View [dbo].[PatientPopulationView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientPopulationView]'))
DROP VIEW [dbo].[PatientPopulationView]
GO
/****** Object:  View [dbo].[PatientBaselineView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientBaselineView]'))
DROP VIEW [dbo].[PatientBaselineView]
GO
/****** Object:  View [dbo].[Laboratory_ViralLoad]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_ViralLoad]'))
DROP VIEW [dbo].[Laboratory_ViralLoad]
GO
/****** Object:  View [dbo].[gcPatientView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[gcPatientView]'))
DROP VIEW [dbo].[gcPatientView]
GO
/****** Object:  View [dbo].[PatientRegistrationView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientRegistrationView]'))
DROP VIEW [dbo].[PatientRegistrationView]
GO
/****** Object:  View [dbo].[facilityStatisticsView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[facilityStatisticsView]'))
DROP VIEW [dbo].[facilityStatisticsView]
GO
/****** Object:  View [dbo].[PatientServiceEnrollmentView]    Script Date: 5/9/2017 10:27:05 AM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientServiceEnrollmentView]'))
DROP VIEW [dbo].[PatientServiceEnrollmentView]
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientICFView]'))
DROP VIEW [dbo].[PatientICFView]
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientPopulationView]'))
DROP VIEW [dbo].[PatientPopulationView]
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[BlueCardAppointmentView]'))
DROP VIEW [dbo].[BlueCardAppointmentView]
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[RegimenMapView]'))
DROP VIEW [dbo].[RegimenMapView]
GO
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[LookupItemView]'))
DROP VIEW [dbo].[LookupItemView]
GO

/****** Object:  View [dbo].[LookupItemView]    Script Date: 11/09/2017 11:04:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[LookupItemView]
AS
SELECT        MasterId, ItemId, MasterName, ItemName, DisplayName, ItemDisplayName, OrdRank, ISNULL(ROW_NUMBER() OVER(ORDER BY ItemId DESC), -1) AS RowID
FROM            (SELECT        M.Id AS MasterId, I.Id AS ItemId, M.Name AS MasterName, I.Name AS ItemName, L.DisplayName, L.DisplayName AS ItemDisplayName, L.OrdRank
                          FROM            dbo.LookupMaster AS M INNER JOIN
                                                    dbo.LookupMasterItem AS L ON M.Id = L.LookupMasterId INNER JOIN
                                                    dbo.LookupItem AS I ON L.LookupItemId = I.Id) AS X



GO

/****** Object:  View [dbo].[PatientServiceEnrollmentView]    Script Date: 5/9/2017 10:27:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientServiceEnrollmentView]
AS
SELECT        dbo.PatientIdentifier.IdentifierValue AS EnrollmentNumber, dbo.LookupItemView.DisplayName AS ServiceArea, dbo.PatientEnrollment.EnrollmentDate, 
                         CAST((CASE dbo.PatientEnrollment.CareEnded WHEN 0 THEN 'Active' WHEN 1 THEN 'In-Active' END) AS varchar(50)) AS PatientStatus, dbo.PatientIdentifier.PatientId, dbo.Person.Id AS PersonId,ISNULL(ROW_NUMBER() OVER (ORDER BY PersonId DESC), - 1) AS Id
FROM            dbo.PatientIdentifier INNER JOIN
                         dbo.LookupItemView ON dbo.PatientIdentifier.IdentifierTypeId = dbo.LookupItemView.ItemId INNER JOIN
                         dbo.PatientEnrollment ON dbo.PatientIdentifier.PatientEnrollmentId = dbo.PatientEnrollment.Id INNER JOIN
                         dbo.Patient ON dbo.PatientEnrollment.PatientId = dbo.Patient.Id RIGHT OUTER JOIN
                         dbo.Person ON dbo.Patient.PersonId = dbo.Person.Id


GO

/***** Object:  View [dbo].[gcPatientView]    Script Date: 7/25/2017 12:43:40 PM *****/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE VIEW [dbo].[gcPatientView]
AS
     SELECT DISTINCT 
                         pt.Id, pt.PersonId, pt.ptn_pk, pni.IdentifierValue AS EnrollmentNumber, pt.PatientIndex, CAST(DECRYPTBYKEY(pn.FirstName) AS VARCHAR(50)) AS FirstName, CAST(DECRYPTBYKEY(pn.MidName) AS VARCHAR(50)) 
                         AS MiddleName, CAST(DECRYPTBYKEY(pn.LastName) AS VARCHAR(50)) AS LastName, pn.Sex, pn.Active, pt.RegistrationDate, pe.EnrollmentDate AS [EnrollmentDate ], 
                         ISNULL(CAST((CASE pe.CareEnded WHEN 0 THEN 'Active' WHEN 1 THEN
                             (SELECT        TOP 1 ItemName
                               FROM            LookupItemView
                               WHERE        MasterName = 'CareEnded' AND ItemId = ptC.ExitReason) END) AS VARCHAR(50)),'Active') AS PatientStatus, ptC.ExitReason, pt.DateOfBirth, CAST(DECRYPTBYKEY(pt.NationalId) AS VARCHAR(50)) AS NationalId, 
                         pt.FacilityId, pt.PatientType, pe.TransferIn, CAST(DECRYPTBYKEY(pc.MobileNumber) AS VARCHAR(20)) AS MobileNumber, ISNULL
                             ((SELECT        TOP (1) ScreeningValueId
                                 FROM            dbo.PatientScreening
                                 WHERE        (PatientId = pt.Id) AND (ScreeningTypeId IN
                                                              (SELECT        Id
                                                                FROM            dbo.LookupMaster
                                                                WHERE        (Name = 'TBStatus')))
                                 ORDER BY Id DESC), 0) AS TBStatus, ISNULL
                             ((SELECT        TOP (1) ScreeningValueId
                                 FROM            dbo.PatientScreening AS PatientScreening_1
                                 WHERE        (PatientId = pt.Id) AND (ScreeningTypeId IN
                                                              (SELECT        Id
                                                                FROM            dbo.LookupMaster AS LookupMaster_1
                                                                WHERE        (Name = 'NutritionStatus')))
                                 ORDER BY Id DESC), 0) AS NutritionStatus, ISNULL
                             ((SELECT        TOP (1) Categorization
                                 FROM            dbo.PatientCategorization
                                 WHERE        (PatientId = pt.Id)
                                 ORDER BY id DESC), 0) AS Categorization, pt.DobPrecision
FROM            dbo.Patient AS pt INNER JOIN
                         dbo.Person AS pn ON pn.Id = pt.PersonId INNER JOIN
                         dbo.PatientEnrollment AS pe ON pt.Id = pe.PatientId INNER JOIN
                         dbo.PatientIdentifier AS pni ON pni.PatientId = pt.Id INNER JOIN
                         dbo.Identifiers ON pni.IdentifierTypeId = dbo.Identifiers.Id LEFT OUTER JOIN
                         dbo.PatientCareending AS ptC ON pt.Id = ptC.PatientId LEFT OUTER JOIN
                         dbo.PersonContact AS pc ON pc.PersonId = pt.PersonId
WHERE        (dbo.Identifiers.Name = 'CCC Registration Number');
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientRegistrationView]
AS
SELECT        Id, ptn_pk, PersonId, PatientIndex, PatientType, FacilityId, Active, DateOfBirth, DobPrecision, CAST(DECRYPTBYKEY(NationalId) AS VARCHAR(50)) AS NationalId, DeleteFlag, CreatedBy, CreateDate, AuditData, 
                         RegistrationDate
FROM            dbo.Patient

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Laboratory_ViralLoad]
AS
SELECT        labTrac.Id, labTrac.patientId, PatientLabTracker_1.ResultValues, PatientLabTracker_1.FacilityId
FROM            (SELECT        MAX(Id) AS Id, patientId
                          FROM            dbo.PatientLabTracker
                          GROUP BY patientId, LabTestId
                          HAVING         (LabTestId = 3)) AS labTrac INNER JOIN
                         dbo.PatientLabTracker AS PatientLabTracker_1 ON labTrac.Id = PatientLabTracker_1.Id
                        WHERE        (PatientLabTracker_1.Results = 'Complete')
GO

/***** Object:  View [dbo].[PatientBaselineView]    Script Date: 7/25/2017 12:44:26 PM *****/

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE VIEW [dbo].[PatientBaselineView]
AS
     SELECT dbo.PatientHivDiagnosis.PatientId,
            dbo.PatientHivDiagnosis.Id,
            dbo.PatientHivDiagnosis.PatientMasterVisitId,
            dbo.PatientTransferIn.ServiceAreaId,
            dbo.PatientTransferIn.TransferInDate,
            dbo.PatientTransferIn.TreatmentStartDate,
            ISNULL(dbo.PatientTransferIn.CurrentTreatment, 0) AS CurrentTreatment,
     (
         SELECT Name+' ('+DisplayName+')' AS Expr1
         FROM dbo.LookupItem
         WHERE(Id = dbo.PatientTransferIn.CurrentTreatment)
     ) AS CurrentTreatmentName,
            dbo.PatientTransferIn.FacilityFrom,
            dbo.PatientTransferIn.MFLCode,
            ISNULL(dbo.PatientTransferIn.CountyFrom, 0) AS CountyFrom,
            dbo.PatientTransferIn.TransferInNotes,
            dbo.PatientHivDiagnosis.HIVDiagnosisDate,
            dbo.PatientHivDiagnosis.EnrollmentDate,
            ISNULL(dbo.PatientHivDiagnosis.EnrollmentWHOStage, 0) AS EnrollmentWHOStage,
     (
         SELECT Name
         FROM dbo.LookupItem AS LookupItem_3
         WHERE(Id = dbo.PatientHivDiagnosis.EnrollmentWHOStage)
     ) AS EnrollmentWHOStageName,
            dbo.PatientHivDiagnosis.ARTInitiationDate,
     (
         SELECT TOP 1 DispensedByDate
         FROM ord_PatientPharmacyOrder
         WHERE PatientId = dbo.PatientHivDiagnosis.PatientId
               AND ptn_pharmacy_pk IN
         (
             SELECT ptn_pharmacy_pk
             FROM dtl_PatientPharmacyOrder
             WHERE Prophylaxis = 0
         ) ORDER BY ptn_pharmacy_pk ASC
     ) AS ARTInitiationDateNew,
            dbo.PatientTreatmentInitiation.DateStartedOnFirstLine,
            dbo.PatientTreatmentInitiation.Cohort,
            ISNULL(dbo.PatientTreatmentInitiation.Regimen, 0) AS Regimen,
     (
         SELECT Name+' ('+DisplayName+')' AS Expr1
         FROM dbo.LookupItem AS LookupItem_2
         WHERE(Id = dbo.PatientTreatmentInitiation.Regimen)
     ) AS RegimenName,
            dbo.PatientTreatmentInitiation.BaselineViralload,
            dbo.PatientTreatmentInitiation.BaselineViralloadDate,
            dbo.PatientBaselineAssessment.HBVInfected,
            dbo.PatientBaselineAssessment.Pregnant,
            dbo.PatientBaselineAssessment.TBinfected,
            dbo.PatientBaselineAssessment.WHOStage,
     (
         SELECT Name
         FROM dbo.LookupItem AS LookupItem_1
         WHERE(Id = dbo.PatientBaselineAssessment.WHOStage)
     ) AS WhoStageName,
            dbo.PatientBaselineAssessment.BreastFeeding,
            dbo.PatientBaselineAssessment.CD4Count,
            dbo.PatientBaselineAssessment.MUAC,
            dbo.PatientBaselineAssessment.Weight,
            dbo.PatientBaselineAssessment.Height,
            dbo.PatientBaselineAssessment.BMI,
            dbo.PatientTreatmentInitiation.ldl
     FROM dbo.PatientHivDiagnosis
          LEFT OUTER JOIN dbo.PatientTransferIn ON dbo.PatientHivDiagnosis.PatientId = dbo.PatientTransferIn.PatientId
          LEFT OUTER JOIN dbo.PatientTreatmentInitiation ON dbo.PatientHivDiagnosis.PatientId = dbo.PatientTreatmentInitiation.PatientId
          LEFT OUTER JOIN dbo.PatientBaselineAssessment ON dbo.PatientHivDiagnosis.PatientId = dbo.PatientBaselineAssessment.PatientId;
GO

/****** Object:  View [dbo].[PatientPopulationView]    Script Date: 5/9/2017 10:27:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientPopulationView]
AS
SELECT b.ptn_pk AS PatientPK, CASE WHEN a.PopulationType = 'General Population' THEN 'General Population' ELSE c.name END AS PopulationCategory
FROM     dbo.PatientPopulation AS a INNER JOIN
                  dbo.Patient AS b ON a.PersonId = b.PersonId LEFT OUTER JOIN
                  dbo.LookupItem AS c ON a.PopulationCategory = b.Id


GO
/****** Object:  View [dbo].[PatientTreatmentSupporterView]    Script Date: 5/9/2017 10:27:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientTreatmentSupporterView]
AS
SELECT        Id, PersonId, SupporterId, CAST(DECRYPTBYKEY(MobileContact) AS VARCHAR(50)) AS MobileContact, DeleteFlag, CreatedBy, CreateDate, AuditData
FROM            dbo.PatientTreatmentSupporter


GO


CREATE VIEW [dbo].[RegimenMapView]
AS
SELECT ROW_NUMBER() OVER(PARTITION BY R.Ptn_Pk ORDER BY V.VisitDate ASC) as RowNumber,p.Id as patientId,p.ptn_pk,R.Visit_Pk,R.RegimenMap_Pk,ISNULL(R.RegimenType,'NA') as RegimenType,R.UserID,V.VisitDate,R.DeleteFlag

FROM  dtl_RegimenMap R INNER JOIN 
patient p
ON
p.ptn_pk=R.Ptn_Pk
inner join ord_Visit V 
on V.Visit_Id = R.Visit_Pk WHERE R.RegimenType<>''

GO


CREATE VIEW [dbo].[PatientTreatmentTrackerView]
AS
SELECT  a.Id, a.PatientId, p.ptn_pk, a.ServiceAreaId, a.PatientMasterVisitId, a.RegimenStartDate, a.RegimenId,
    (SELECT        Name + '(' + DisplayName + ')' AS Expr1
    FROM            dbo.LookupItem
    WHERE        (Id = a.RegimenId)) AS Regimen, a.RegimenLineId,
    (SELECT        Name
    FROM            dbo.LookupItem AS LookupItem_3
    WHERE        (Id = a.RegimenLineId)) AS RegimenLine, a.DrugId, a.RegimenStatusDate, a.TreatmentStatusId,
    (SELECT        Name
    FROM            dbo.LookupItem AS LookupItem_2
    WHERE        (Id = a.TreatmentStatusId)) AS TreatmentStatus, a.ParentId, a.CreateBy AS CreatedBy, a.CreateDate, a.DeleteFlag, a.TreatmentStatusReasonId,
    (SELECT        Name
    FROM            dbo.LookupItem AS LookupItem_1
    WHERE        (Id = a.TreatmentStatusReasonId)) AS TreatmentReason, dbo.ord_PatientPharmacyOrder.DispensedByDate, (SELECT top 1 isnull(M.visitDate,M.Start) FROM PATIENTMASTERVISIT M WHERE M.PatientId=a.PatientId) as VisitDate
FROM            dbo.ARVTreatmentTracker AS a INNER JOIN
dbo.Patient AS p ON p.Id = a.PatientId INNER JOIN
dbo.ord_PatientPharmacyOrder ON a.PatientMasterVisitId = dbo.ord_PatientPharmacyOrder.PatientMasterVisitId


UNION ALL

SELECT 
	
	R.RegimenMap_Pk,R.patientId,R.ptn_pk,0 as ServiceAreaId,0 as PatientmasterVisitId,
	(SELECT TOP 1  p.DispensedByDate FROM ord_PatientPharmacyOrder p WHERE p.VisitID=R.Visit_Pk) as RegimenStartDate,
	ISNULL((SELECT top 1 id FROM LookupItem WHERE displayName IN(CASE R.RegimenType
			WHEN '3TC/NVP/TDF'	THEN 'TDF + 3TC + NVP'
			WHEN '3TC/AZT/NVP'	THEN 'AZT + 3TC + NVP'
			WHEN '3TC/AZT/EFV'	THEN 'AZT + 3TC + EFV '
			WHEN '3TC/AZT/LOPr' THEN 'AZT + 3TC + LPV/r'
			WHEN '3TC/LOPr/TDF' THEN 'TDF + 3TC + LPV/r'
			WHEN '3TC/ABC/EFV'	THEN 'TDF + 3TC + EFV'
			WHEN '3TC/ABC/LOPr' THEN 'ABC + 3TC + LPV/r'
			WHEN '3TC/ABC/NVP'	THEN 'ABC + 3TC + NVP'
			WHEN '3TC/EFV/TDF'	THEN 'TDF + 3TC + NVP'
			WHEN '3TC/NVP/AZT' THEN  'AZT + 3TC + NVP'
		END)),0) as RegimenId,
	ISNULL((
		CASE R.RegimenType
			WHEN '3TC/NVP/TDF'	THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='TDF + 3TC + NVP')+'(TDF + 3TC + NVP)'
			WHEN '3TC/AZT/NVP'	THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='AZT + 3TC + NVP')+'(AZT + 3TC + NVP)'
			WHEN '3TC/AZT/EFV'	THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='AZT + 3TC + EFV')+'(AZT + 3TC + EFV)'
			WHEN '3TC/AZT/LOPr' THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='AZT + 3TC + LPV/r')+'(AZT + 3TC + LPV/r)'
			WHEN '3TC/LOPr/TDF' THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='TDF + 3TC + LPV/r')+'(TDF + 3TC + LPV/r)'
			WHEN '3TC/ABC/EFV'	THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='TDF + 3TC + EFV')+'(TDF + 3TC + EFV)'
			WHEN '3TC/ABC/LOPr' THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='ABC + 3TC + LPV/r')+'(ABC + 3TC + LPV/r)'
			WHEN '3TC/ABC/NVP'	THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='ABC + 3TC + NVP')+'(ABC + 3TC + NVP)'
			WHEN '3TC/EFV/TDF'	THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='TDF + 3TC + NVP')+'(TDF + 3TC + NVP)'
			WHEN '3TC/NVP/AZT'  THEN (SELECT top 1 Name FROM lookupitem WHERE DisplayName='AZT + 3TC + NVP')+ '(AZT + 3TC + NVP)'
		END
	), (select TOP 1 Name from lookupitem where Name='Unknown')) as Regimen,
	ISNULL((SELECT top 1 id FROM LookupItem WHERE Name IN(SELECT 
	CASE MasterName 
	WHEN 'AdultFirstLineRegimen' THEN 'AdultARTFirstLine'
	WHEN 'AdultSecondlineRegimen' THEN 'AdultARTSecondLine'
	WHEN 'AdultThirdlineRegimen' THEN 'AdultARTThirdLine'
	WHEN 'PaedsFirstLineRegimen' THEN 'PaedsARTFirstLine'
	WHEN 'PaedsSecondlineRegimen' THEN 'PaedsARTSecondLine'
	WHEN 'PaedsThirdlineRegimen' THEN 'PaedsARTThirdLine' 
	END 
	
	FROM LookupItemView WHERE ItemDisplayName IN(CASE R.RegimenType
			WHEN '3TC/NVP/TDF'	THEN 'TDF + 3TC + NVP'
			WHEN '3TC/AZT/NVP'	THEN 'AZT + 3TC + NVP'
			WHEN '3TC/AZT/EFV'	THEN 'AZT + 3TC + EFV '
			WHEN '3TC/AZT/LOPr' THEN 'AZT + 3TC + LPV/r'
			WHEN '3TC/LOPr/TDF' THEN 'TDF + 3TC + LPV/r'
			WHEN '3TC/ABC/EFV'	THEN 'TDF + 3TC + EFV'
			WHEN '3TC/ABC/LOPr' THEN 'ABC + 3TC + LPV/r'
			WHEN '3TC/ABC/NVP'	THEN 'ABC + 3TC + NVP'
			WHEN '3TC/EFV/TDF'	THEN 'TDF + 3TC + NVP'
			WHEN '3TC/NVP/AZT' THEN  'AZT + 3TC + NVP'
		END))),(select TOP 1 Id from lookupitem where Name='Unknown')) as RegimenLineId,
	ISNULL((SELECT top 1 Name FROM LookupItem WHERE Name IN(SELECT 
	CASE MasterName 
	WHEN 'AdultFirstLineRegimen' THEN 'AdultARTFirstLine'
	WHEN 'AdultSecondlineRegimen' THEN 'AdultARTSecondLine'
	WHEN 'AdultThirdlineRegimen' THEN 'AdultARTThirdLine'
	WHEN 'PaedsFirstLineRegimen' THEN 'PaedsARTFirstLine'
	WHEN 'PaedsSecondlineRegimen' THEN 'PaedsARTSecondLine'
	WHEN 'PaedsThirdlineRegimen' THEN 'PaedsARTThirdLine' 
	END  

	FROM LookupItemView WHERE ItemDisplayName IN(CASE R.RegimenType
			WHEN '3TC/NVP/TDF'	THEN 'TDF + 3TC + NVP'
			WHEN '3TC/AZT/NVP'	THEN 'AZT + 3TC + NVP'
			WHEN '3TC/AZT/EFV'	THEN 'AZT + 3TC + EFV '
			WHEN '3TC/AZT/LOPr' THEN 'AZT + 3TC + LPV/r'
			WHEN '3TC/LOPr/TDF' THEN 'TDF + 3TC + LPV/r'
			WHEN '3TC/ABC/EFV'	THEN 'TDF + 3TC + EFV'
			WHEN '3TC/ABC/LOPr' THEN 'ABC + 3TC + LPV/r'
			WHEN '3TC/ABC/NVP'	THEN 'ABC + 3TC + NVP'
			WHEN '3TC/EFV/TDF'	THEN 'TDF + 3TC + NVP'
			WHEN '3TC/NVP/AZT' THEN  'AZT + 3TC + NVP'
		END))),(select TOP 1 Name from lookupitem where Name='Unknown')) as RegimenLine,
	NULL as DrugId,
	NULL as RegimenStatusDate,
	(
	 case R.RowNumber
		  When 1 then (SELECT top 1 ItemId FROM LookupItemView WHERE ItemName='Start Treatment') 
		  ELSE (SELECT top 1 ItemId FROM LookupItemView WHERE ItemName='Continue current treatment') 
	 end
	) as TreatmentStatusId,
	(
	  case R.RowNumber

		when 1 then 'Start Treatment'
		ELSE 'Continue Current Treatment'

	  end
	) as TreatmentStatus,
	0 as ParentId,R.UserID,R.VisitDate,R.DeleteFlag,0 as TreatmentStatusReasonid,NULL as TreatmentReason,
	(SELECT TOP 1 p.DispensedByDate FROM ord_PatientPharmacyOrder p WHERE p.VisitID=R.Visit_Pk ) as DispensedByDate, (SELECT top 1 D.visitDate FROM ord_Visit D Where D.ptn_pk=R.ptn_pk)


	FROM RegimenMapView R
	INNER JOIN ord_PatientPharmacyOrder o 
	ON
	o.VisitID=R.Visit_Pk
	 WHERE R.RegimenType<>'' AND R.RegimenType IS NOT NULL AND o.DispensedByDate IS NOT NULL
GO


CREATE VIEW 
 [dbo].[facilityStatisticsView]
AS
 SELECT        (SELECT        1 AS Expr1) AS Id,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            dbo.Patient
                               WHERE        (Id IN
                                                             (SELECT        PatientId
                                                               FROM            dbo.PatientEnrollment)) AND (PatientType NOT IN
                                                             (SELECT        dbo.Patient.Id
                                                               FROM            dbo.LookupItemView
                                                               WHERE        (ItemName = 'Transit') OR
                                                                                         (ItemName = 'Transfer-In'))) AND (Id IN
                                                             (SELECT        PatientId
                                                               FROM            dbo.PatientIdentifier
                                                               WHERE        (IdentifierTypeId IN
                                                                                             (SELECT        Id
                                                                                               FROM            dbo.Identifiers
                                                                                               WHERE        (Name = 'CCC Registration Number')))))) AS TotalCumulativePatients,
                             (SELECT        COUNT(DISTINCT PatientId) AS Expr1
                               FROM            dbo.PatientTreatmentTrackerView
                               WHERE        (DATEDIFF(DAY, CreateDate, GETDATE()) <= 90) AND (RegimenLine IS NOT NULL)) +
                             (SELECT        COUNT(DISTINCT Ptn_Pk) AS Expr1
                               FROM            dbo.dtl_RegimenMap AS r
                               WHERE        (Ptn_Pk NOT IN
                                                             (SELECT        ptn_pk
                                                               FROM            dbo.PatientTreatmentTrackerView AS PatientTreatmentTrackerView_1)) AND (DATEDIFF(DAY, CreateDate, GETDATE()) <= 90)) AS TotalActiveOnArt,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            dbo.Patient AS Patient_3
                               WHERE        (PatientType IN
                                                             (SELECT        Id
                                                               FROM            dbo.LookupItem
                                                               WHERE        (Name = 'Transfer-In'))) AND (Id IN
                                                             (SELECT        PatientId
                                                               FROM            dbo.PatientEnrollment AS PatientEnrollment_2)) AND (Id IN
                                                             (SELECT        PatientId
                                                               FROM            dbo.PatientIdentifier AS PatientIdentifier_2
                                                               WHERE        (IdentifierTypeId IN
                                                                                             (SELECT        Id
                                                                                               FROM            dbo.Identifiers AS Identifiers_2
                                                                                               WHERE        (Name = 'CCC Registration Number')))))) +
                             (SELECT        COUNT(DISTINCT Ptn_Pk) AS Expr1
                               FROM            dbo.mst_Patient
                               WHERE        (TransferIn IS NOT NULL) AND (Ptn_Pk NOT IN
                                                             (SELECT        ptn_pk
                                                               FROM            dbo.Patient AS Patient_2))) AS TotalTransferIn,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            dbo.PatientCareending
                               WHERE        (ExitReason IN
                                                             (SELECT        Id
                                                               FROM            dbo.LookupItem AS LookupItem_3
                                                               WHERE        (Name = 'Transfer Out')))) +
                             (SELECT        COUNT(DISTINCT Ptn_Pk) AS Expr1
                               FROM            dbo.dtl_PatientCareEnded
                               WHERE        (PatientExitReason IN (118, 349))) AS TotalPatientsTransferedOut,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            dbo.dtl_PatientPharmacyOrder
                               WHERE        (Drug_Pk IN (460, 1095, 1015968, 969, 970, 971, 972, 973, 974, 975, 976, 977, 978, 979, 1005, 1006, 1010, 1011, 1012, 1013, 1014, 1015)) AND (DispensedQuantity > 0) AND (DATEDIFF(Day, 
                                                         CreateDate, GETDATE()) <= 90)) AS TotalOnCtxDapson,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            dbo.PatientCareending AS PatientCareending_1
                               WHERE        (ExitReason IN
                                                             (SELECT        Id
                                                               FROM            dbo.LookupItem AS LookupItem_2
                                                               WHERE        (Name = 'Death')))) +
                             (SELECT        COUNT(DISTINCT Ptn_Pk) AS Expr1
                               FROM            dbo.dtl_PatientCareEnded AS dtl_PatientCareEnded_1
                               WHERE        (PatientExitReason = 93)) AS TotalPatientsDead,
                             (SELECT        ISNULL(COUNT(*), 0) AS Expr1
                               FROM            dbo.Patient AS Patient_1
                               WHERE        (PatientType IN
                                                             (SELECT        Id
                                                               FROM            dbo.LookupItem AS LookupItem_1
                                                               WHERE        (Name = 'Transit'))) AND (Id IN
                                                             (SELECT        PatientId
                                                               FROM            dbo.PatientEnrollment AS PatientEnrollment_1)) AND (Id IN
                                                             (SELECT        PatientId
                                                               FROM            dbo.PatientIdentifier AS PatientIdentifier_1
                                                               WHERE        (IdentifierTypeId IN
                                                                                             (SELECT        Id
                                                                                               FROM            dbo.Identifiers AS Identifiers_1
                                                                                               WHERE        (Name = 'CCC Registration Number')))))) +
                             (SELECT        COUNT(DISTINCT Ptn_Pk) AS Expr1
                               FROM            dbo.mst_Patient AS mst_Patient_1
                               WHERE        (Ptn_Pk IN
                                                             (SELECT        Ptn_pk
                                                               FROM            dbo.Lnk_PatientProgramStart
                                                               WHERE        (ModuleId = 20)))) AS TotalTransit,
                             (SELECT        ISNULL(COUNT(DISTINCT Ptn_Pk), 0) AS Expr1
                               FROM            dbo.dtl_PatientCareEnded AS p
                               WHERE        (PatientExitReason = 91)) AS LostToFollowUp
GO


GO

/****** Object:  View [dbo].[PatientVisitView]    Script Date: 5/9/2017 10:27:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create VIEW [dbo].[PatientVisitView]
AS
Select	V.Visit_Id		VisitId
	,	VisitName
	,	V.Ptn_Pk		PatientId
	,	V.LocationID	LocationId
	,	V.VisitDate
	,	Isnull(V.DataQuality,0) DataQuality
	,	Isnull(V.Signature,0) [Signature]
	,	V.CreateDate
	,	V.UserID		UserId
	,	Cast(Isnull(V.DeleteFlag,0) as bit) DeleteFlag
From Ord_visit V
Inner Join mst_VisitType T On T.VisitTypeID = V.VisitType
Where V.Ptn_Pk > 0


GO
/****** Object:  View [dbo].[PersonContactView]    Script Date: 5/9/2017 10:27:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PersonContactView]
AS
SELECT        Id, PersonId, CAST(DECRYPTBYKEY(PhysicalAddress) AS VARCHAR(50)) AS PhysicalAddress, CAST(DECRYPTBYKEY(MobileNumber) AS VARCHAR(50)) AS MobileNumber, 
                         CAST(DECRYPTBYKEY(AlternativeNumber) AS VARCHAR(50)) AS AlternativeNumber, CAST(DECRYPTBYKEY(EmailAddress) AS VARCHAR(50)) AS EmailAddress, Active, DeleteFlag, CreatedBy, CreateDate
FROM            dbo.PersonContact


GO
/****** Object:  View [dbo].[PersonView]    Script Date: 5/9/2017 10:27:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PersonView]
AS
SELECT        Id, CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) AS FirstName, CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) AS MiddleName, CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) AS LastName, 
                         Sex, Active, DeleteFlag, CreateDate, CreatedBy, AuditData, DateOfBirth, DobPrecision
FROM            dbo.Person


GO



/****** Object:  View [dbo].[TestingSummaryStatistics]    Script Date: 7/27/2017 3:00:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TestingSummaryStatistics]
AS
SELECT        ROW_NUMBER() OVER (ORDER BY Name) AS Id, Name, Value
FROM            (SELECT        'Contacts with known status' AS Name, COUNT(*) AS Value
                          FROM            dbo.PersonRelationship
                          WHERE        (BaselineResult IN
                                                        (SELECT        ItemId
                                                          FROM            dbo.LookupItemView
                                                          WHERE        (MasterName = 'BaseLineHivStatus') AND (ItemName <> 'Unknown') AND (ItemName <> 'Never Tested')))
                          UNION ALL
                          SELECT        'Contacts with unknown status' AS Name, COUNT(*) AS Value
                          FROM            dbo.PersonRelationship LEFT OUTER JOIN
                                                   dbo.HIVTesting ON dbo.PersonRelationship.PersonId = dbo.HIVTesting.PersonId
                          GROUP BY dbo.PersonRelationship.BaselineResult
                          HAVING        (dbo.PersonRelationship.BaselineResult IN
                                                       (SELECT        ItemId
                                                         FROM            dbo.LookupItemView
                                                         WHERE        (MasterName = 'BaseLineHivStatus') AND (ItemName = 'Unknown' OR
                                                                                   ItemName = 'Never Tested')))
                          UNION ALL
                          SELECT        'Total Listed' AS Name, COUNT(*) AS Value
                          FROM            dbo.PersonRelationship
                          UNION ALL
                          SELECT        'Total Positive' AS Name, COUNT(*) AS total
FROM            dbo.PersonRelationship
WHERE        (BaselineResult =
                             (SELECT        ItemId
                               FROM            dbo.LookupItemView
                               WHERE        (MasterName = 'BaseLineHivStatus') AND (ItemName = 'Tested Positive')))
                          UNION ALL
                          SELECT        'Linked to Care' AS Name, COUNT(*) AS Value
                          FROM            PatientLinkage) TestingSummaryStatistics




GO

/****** Object:  View [dbo].[PatientStabilitySummary]    Script Date: 7/27/2017 3:43:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PatientStabilitySummary]
AS
SELECT        ROW_NUMBER() OVER (ORDER BY Category) AS Id,count(*) AS Value, Category FROM (Select Case
  When C.Id Is Null Or C.Categorization = 2 Then 'Unstable'
  Else 'Stable'
 End As Category 
From PatientEnrollment PE
INNER JOIN dbo.PatientIdentifier PI ON PE.Id = PI.PatientEnrollmentId 
INNER JOIN dbo.Identifiers IE ON PI.IdentifierTypeId = IE.Id
Left Outer Join (
Select PatientId
  ,    Id
  ,    Categorization
  ,    row_number() Over (Partition By PatientId Order By DateAssessed Desc) RowNum
From PatientCategorization

) C On C.PatientId = Pe.PatientId
And C.RowNum = 1
Where ServiceAreaId = 1 AND IE.Name = 'CCC Registration Number') AS Categorization
GROUP BY Category

GO
/****** Object:  View [dbo].[view_patientVisit]    Script Date: 5/9/2017 10:27:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_patientVisit]
AS
SELECT        TOP (100) PERCENT dbo.PatientMasterVisit.id AS visitID, 'Green Card' AS VisitName, dbo.PatientMasterVisit.patientId, dbo.PatientMasterVisit.visitDate, 
                         dbo.mst_User.UserName, dbo.PatientMasterVisit.DeleteFlag
FROM            dbo.PatientMasterVisit INNER JOIN
                         dbo.mst_User ON dbo.PatientMasterVisit.createdBy = dbo.mst_User.UserID
WHERE        (dbo.PatientMasterVisit.visitDate IS NOT NULL) AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
                         dbo.PatientMasterVisit.DeleteFlag = 0 AND dbo.PatientMasterVisit.VisitType NOT IN(SELECT Id FROM LookupItem WHERE Name='Enrollment'))



GO


IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VW_PatientCareEnding]'))
DROP VIEW [dbo].[VW_PatientCareEnding]
GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE VIEW [dbo].[VW_PatientCareEnding]
AS
     SELECT dbo.Patient.ptn_pk,
            dbo.PatientMasterVisit.VisitDate,
            dbo.PatientCareending.ExitReason,
            dbo.LookupItemView.ItemName AS [Patient CareEnd Reason],
            dbo.PatientCareending.TransferOutfacility AS LPTFTransfer,
            dbo.PatientCareending.DateOfDeath,
            dbo.PatientCareending.ExitDate AS CareEndedDate,
            dbo.PatientCareending.Id AS CareEndedID,
            dbo.PatientCareending.CareEndingNotes,
            dbo.PatientCareending.Active,
            dbo.PatientCareending.DeleteFlag
     FROM dbo.Patient
          INNER JOIN dbo.PatientCareending ON dbo.Patient.Id = dbo.PatientCareending.PatientId
          INNER JOIN dbo.PatientMasterVisit ON dbo.PatientCareending.PatientMasterVisitId = dbo.PatientMasterVisit.Id
          INNER JOIN dbo.LookupItemView ON dbo.PatientCareending.ExitReason = dbo.LookupItemView.ItemId;
GO

SET QUOTED_IDENTIFIER ON;
GO
CREATE VIEW [dbo].[PatientICFView]
AS
     SELECT Ptn_pk,
            Visit_Pk,
            Symptom,
            SymptomCategory
     FROM
     (
         SELECT Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(Cough = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(Fever = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(WeightLoss = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(Sweat = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Presumed TB' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(ContactTB = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'No signs' AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(Cough = 0
               OR Cough IS NULL)
              AND (WeightLoss = 0
                   OR WeightLoss IS NULL)
              AND (Sweat = 0
                   OR Sweat IS NULL)
              AND (ContactTB = 0
                   OR ContactTB IS NULL)
              AND (Fever = 0
                   OR Fever IS NULL)
         UNION
         SELECT DISTINCT
                a.Ptn_pk,
                a.Visit_pk,
                b.Name AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.dtl_PatientOtherTreatment AS a
              INNER JOIN dbo.mst_BlueDecode AS b ON a.TBStatus = b.ID
         WHERE(b.Name NOT IN('Not Done', 'TB Rx'))
         UNION
         SELECT Ptn_pk,
                Visit_Pk,
                'Yellow Urine' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(YellowUrine = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Numbness Adult' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(NumbnessAdult = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Numbness Peads' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(NumbnessPead = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Yellow Eyes' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(YellowEyes = 1)
         UNION
         SELECT DISTINCT
                Ptn_pk,
                Visit_Pk,
                'Tender Abdomen' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.DTL_FBCUSTOMFIELD_Intensive_Case_Finding AS n
         WHERE(TenderAbdomen = 1)
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                CASE
                    WHEN a.Cough = 1
                         OR a.NightSweats = 1
                         OR a.WeightLoss = 1
                         OR a.Fever = 1
                    THEN 'Presumed TB'
                    ELSE 'No signs'
                END AS Symptom,
                'TB Screening' AS SymptomCategory
         FROM dbo.PatientIcf AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                'Yellow Urine' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.PatientIptWorkup AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         WHERE(a.YellowColouredUrine = 1)
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                'Numbness' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.PatientIptWorkup AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         WHERE(a.Numbness = 1)
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                'Yellow Eyes' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.PatientIptWorkup AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         WHERE(a.YellownessOfEyes = 1)
         UNION
         SELECT b.ptn_pk,
                a.PatientMasterVisitId AS visit_pk,
                'Tender Abdomen' AS Symptom,
                'IPT Workup' AS SymptomCategory
         FROM dbo.PatientIptWorkup AS a
              INNER JOIN dbo.PatientMasterVisit AS v ON v.Id = a.PatientMasterVisitId
                                                        AND a.PatientId = v.PatientId
              INNER JOIN dbo.Patient AS b ON a.PatientId = b.Id
                                             AND v.PatientId = b.Id
         WHERE(a.AbdominalTenderness = 1)
     ) AS a_1;
GO

SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
ALTER VIEW [dbo].[PatientPopulationView]
AS
     SELECT DISTINCT
            b.ptn_pk AS PatientPK,
            CASE
                WHEN a.PopulationType = 'General Population'
                THEN 'General Population'
                WHEN a.PopulationType = 'Key Population'
                THEN c.ItemName
            END AS PopulationCategory
     FROM dbo.PatientPopulation AS a
          INNER JOIN dbo.Patient AS b ON a.PersonId = b.PersonId
          LEFT OUTER JOIN dbo.LookupItemView AS c ON a.PopulationCategory = c.ItemId
     WHERE(a.DeleteFlag = 0);
GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE VIEW [dbo].[BlueCardAppointmentView]
AS
     SELECT Pat.Id PatientId,
            AppointmentId,
            FacilityName =
     (
         SELECT TOP 1 F.FacilityName
         FROM mst_Facility F
         WHERE F.FacilityID = PA.LocationID
     ),
            Pa.Visit_pk VisitId,
            AppDate AppointmentDate,
            AR.Name Reason,
            StatusName [AppointmentStatus],
            E.FirstName+' '+E.LastName AS Provider,
            PA.AppNote Description,
            ServiceArea =
     (
         SELECT ModuleName
         FROM mst_module M
         WHERE M.ModuleId = PA.ModuleID
     ),
            isnull(PA.UpdateDate, PA.CreateDate) StatusDate,ISNULL(ROW_NUMBER() OVER(ORDER BY Pat.Id DESC), -1) AS RowId
     FROM dtl_PatientAppointment PA
          INNER JOIN mst_patient P ON p.Ptn_Pk = PA.Ptn_pk
          INNER JOIN Patient Pat ON P.Ptn_Pk = Pat.ptn_pk
          LEFT OUTER JOIN vw_AppointmentReasons AR ON AR.ID = AppReason
          INNER JOIN
     (
         SELECT ID StatusID,
                Name StatusName
         FROM mst_decode
         WHERE codeId = 3
     ) ST ON ST.StatusID = PA.AppStatus
          INNER JOIN
     (
         SELECT UserId CreatedById,
                UserFirstName+' '+UserLastName CreatedBy
         FROM mst_User
     ) UC ON UC.CreatedById = PA.UserID
          LEFT OUTER JOIN
     (
         SELECT UserId UpdatedById,
                UserFirstName+' '+UserLastName UpdatedBy
         FROM mst_User
     ) MD ON MD.UpdatedById = PA.UpdateUserId
          LEFT OUTER JOIN mst_Employee E ON E.EmployeeID = PA.EmployeeID
     WHERE PA.DeleteFlag = 0
           AND P.DeleteFlag = 0;
GO

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[AppointmentSummaryView]'))
DROP VIEW [dbo].[AppointmentSummaryView]
GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
CREATE VIEW [dbo].[AppointmentSummaryView]
AS
Select Convert(int,row_number() Over(Order by PA.AppointmentDate)) Id
  , PA.AppointmentDate
  , Count(*) Total
  ,	sum(Case L.Name   When 'Missed' Then 1	   Else 0	   End) Missed
  ,	sum(Case L.Name   When 'Met' Then 1	   Else 0	   End) Met
  ,	sum(Case L.Name   When 'Pending' Then 1	   Else 0   End) Pending
  ,	sum(Case L.Name   When 'PreviouslyMissed' Then 1	   Else 0   End) PreviouslyMissed
From PatientAppointment PA
Inner Join LookupItem L On L.Id = PA.StatusId
Where PA.DeleteFlag = 0
Group By PA.AppointmentDate

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
