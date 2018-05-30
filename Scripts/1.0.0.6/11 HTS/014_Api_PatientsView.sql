﻿IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Api_PatientsView]'))
DROP VIEW [dbo].[Api_PatientsView]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Api_PatientsView]
AS
SELECT ISNULL(ROW_NUMBER() OVER(ORDER BY PersonId ASC), -1) AS RowID, *
FROM (
SELECT
	   P.[Id] PersonId,
	   PT.Id PatientId,
	   PT.ptn_pk,
	   CAST(DECRYPTBYKEY(P.[FirstName]) AS VARCHAR(50)) AS [FirstName], 
	   CAST(DECRYPTBYKEY(P.[MidName]) AS VARCHAR(50)) AS [MidName],
	   CAST(DECRYPTBYKEY(P.[LastName]) AS VARCHAR(50)) AS [LastName],
	   P.Sex,
	   Gender = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = P.Sex AND MasterName = 'Gender'),
	   PT.[DateOfBirth],
	   PT.[DobPrecision],
	   PatientType = CASE(SELECT ItemName FROM LookupItemView WHERE ItemId = PT.PatientType AND MasterName = 'PatientType') WHEN 'New' THEN 'NEW' WHEN 'Transfer-In' THEN 'TRANSFER-IN' WHEN 'Transit' THEN 'TRANSIT' ELSE '' END,
	   CAST(DECRYPTBYKEY(PT.[NationalId]) AS VARCHAR(50)) AS [NationalId],
	   [RegistrationDate],
	   PE.EnrollmentDate,
	   pni.IdentifierValue,
	   SE.Id ServiceAreaId,
	   SE.Name ServiceAreaName,
	   CAST(DECRYPTBYKEY(PC.PhysicalAddress) AS VARCHAR(50)) AS PhysicalAddress,
	   CAST(DECRYPTBYKEY(PC.MobileNumber) AS VARCHAR(50)) AS MobileNumber,
	   PMS.MaritalStatusId,
	   MaritalStatusName = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = PMS.MaritalStatusId AND MasterName = 'MaritalStatus'),
	   PL.LandMark 
	   
FROM [dbo].[Person] P
INNER JOIN dbo.Patient AS PT ON P.Id = PT.PersonId
INNER JOIN dbo.PatientEnrollment AS PE ON PT.Id = PE.PatientId 
INNER JOIN dbo.PatientIdentifier AS pni ON pni.PatientId = PT.Id 
INNER JOIN dbo.Identifiers ON pni.IdentifierTypeId = dbo.Identifiers.Id
INNER JOIN dbo.ServiceArea SE ON SE.Id = PE.ServiceAreaId
LEFT JOIN dbo.PersonContact PC ON PC.PersonId = P.Id
LEFT JOIN [dbo].[PatientMaritalStatus] PMS ON PMS.PersonId = P.Id
LEFT JOIN [dbo].[PersonLocation] PL ON PL.PersonId = P.Id
--WHERE PL.DeleteFlag = 0 AND PMS.DeleteFlag = 0 AND PC.DeleteFlag = 0 AND pni.DeleteFlag = 0 AND PT.DeleteFlag = 0

union all
SELECT
	PR.Id PersonId, 
	PT.Id PatientId,
	NULL AS ptn_pk,
	CAST(DECRYPTBYKEY(PR.FirstName) AS VARCHAR(50)) AS [FirstName],
	CAST(DECRYPTBYKEY(PR.MidName) AS VARCHAR(50)) AS MidName,
	CAST(DECRYPTBYKEY(PR.LastName) AS VARCHAR(50)) AS LastName,
	PR.Sex,
	Gender = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = PR.Sex AND MasterName = 'Gender'),
	PR.DateOfBirth,
	PR.DobPrecision,
	NULL as PatientType,
	NULL as NationalId,
	NULL as RegistrationDate,
	NULL as EnrollmentDate,
	null as IdentifierValue,
	null as ServiceAreaId,
	null as ServiceAreaName,
	CAST(DECRYPTBYKEY(PC.PhysicalAddress) AS VARCHAR(50)) AS PhysicalAddress,
	CAST(DECRYPTBYKEY(PC.MobileNumber) AS VARCHAR(50)) AS MobileNumber,
	PMS.MaritalStatusId,
	MaritalStatusName = (SELECT TOP 1 ItemName FROM LookupItemView WHERE ItemId = PMS.MaritalStatusId AND MasterName = 'MaritalStatus'),
	PL.LandMark 
FROM Person PR
LEFT JOIN Patient PT ON PR.Id = PT.PersonId
LEFT JOIN [dbo].[PatientMaritalStatus] PMS ON PMS.PersonId = PR.Id
LEFT JOIN [dbo].[PersonLocation] PL ON PL.PersonId = PR.Id
LEFT JOIN dbo.PersonContact PC ON PC.PersonId = PR.Id
WHERE PT.Id IS NULL) B