﻿If Exists(Select * from sys.columns where Name = N'HIVDiagnosisDate' AND Object_ID = Object_ID(N'PatientHivDiagnosis'))
BEGIN
	ALTER TABLE PatientHivDiagnosis ALTER COLUMN HIVDiagnosisDate DATETIME NULL
END
GO

If Exists(Select * from sys.columns where Name = N'Name' AND Object_ID = Object_ID(N'LookupMaster'))
BEGIN
	ALTER TABLE LookupMaster ALTER COLUMN Name varchar(250) NULL
END
GO
If Exists(Select * from sys.columns where Name = N'DisplayName' AND Object_ID = Object_ID(N'LookupMaster'))
BEGIN
	ALTER TABLE LookupMaster ALTER COLUMN DisplayName varchar(250) NULL
END
GO
If Exists(Select * from sys.columns where Name = N'DisplayName' AND Object_ID = Object_ID(N'LookupMasterItem'))
BEGIN
	ALTER TABLE LookupMasterItem ALTER COLUMN DisplayName varchar(250) NULL
END
GO
If NOT Exists(Select * from sys.columns where Name = N'IdentifierType' AND Object_ID = Object_ID(N'Identifiers'))
BEGIN
	ALTER TABLE Identifiers ADD IdentifierType INT NULL
END
GO



If Exists(Select * from sys.columns where Name = N'EnrollmentDate' AND Object_ID = Object_ID(N'PatientHivDiagnosis'))
BEGIN
	ALTER TABLE PatientHivDiagnosis ALTER COLUMN EnrollmentDate DATETIME NULL
END
GO


If Exists(Select * from sys.columns where Name = N'DateStartedOnFirstLine' AND Object_ID = Object_ID(N'PatientTreatmentInitiation'))
BEGIN
	ALTER TABLE PatientTreatmentInitiation ALTER COLUMN DateStartedOnFirstLine DATETIME NULL
END
GO

If Exists(Select * from sys.columns where Name = N'Cohort' AND Object_ID = Object_ID(N'PatientTreatmentInitiation'))
BEGIN
	ALTER TABLE PatientTreatmentInitiation ALTER COLUMN Cohort varchar(20) NULL
END
GO

If Exists(Select * from sys.columns where Name = N'DateLastUsed' AND Object_ID = Object_ID(N'PatientARVHistory'))
BEGIN
	ALTER TABLE PatientARVHistory ALTER COLUMN DateLastUsed DATETIME NULL
END
GO

If Exists(Select * from sys.columns where Name = N'TransferInDate' AND Object_ID = Object_ID(N'PatientTransferIn'))
BEGIN
	ALTER TABLE PatientTransferIn ALTER COLUMN TransferInDate DATETIME NULL
END
GO

IF Not Exists (SELECT * FROM sys.key_constraints WHERE type = 'UQ' AND parent_object_id = OBJECT_ID('dbo.Patient') AND Name = 'unique_ptn_pk')Begin
	ALTER TABLE Patient	ADD CONSTRAINT unique_ptn_pk UNIQUE (ptn_pk);
End
GO

--- Alter Columns for lookup Items-take in more texts.
If Exists(Select * from sys.columns where Name = N'Name' AND Object_ID = Object_ID(N'LookupItem'))
BEGIN
	ALTER TABLE LookupItem ALTER COLUMN Name varchar(200) NOT NULL
END
GO

If Exists(Select * from sys.columns where Name = N'DisplayName' AND Object_ID = Object_ID(N'LookupItem'))
BEGIN
	ALTER TABLE LookupItem ALTER COLUMN DisplayName varchar(200) NOT NULL
END
GO


If NOT Exists(Select * from sys.columns where Name = N'FindingId' AND Object_ID = Object_ID(N'PhysicalExamination'))
BEGIN
	ALTER TABLE [dbo].[PhysicalExamination] ADD FindingId int NULL;
END
GO

If Exists(Select * from sys.columns where Name = N'Finding' AND Object_ID = Object_ID(N'PhysicalExamination'))
BEGIN
	ALTER TABLE [dbo].[PhysicalExamination] DROP  COLUMN Finding;
	ALTER TABLE [dbo].[PhysicalExamination] ADD FindingsNotes varchar(max) NULL;
END
GO
	GO

	-- add AdverseEventId column
	If NOT Exists(Select * from sys.columns where Name = N'AdverseEventId' AND Object_ID = Object_ID(N'AdverseEvent'))
	BEGIN
	  ALTER TABLE adverseEvent Add AdverseEventId int null
	END

	If NOT Exists(Select * from sys.columns where Name = N'AuditData' AND Object_ID = Object_ID(N'ord_Visit'))
	BEGIN
		ALTER TABLE dbo.ord_Visit DROP COLUMN AuditData;
	END
