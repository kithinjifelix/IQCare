﻿--Being used when saving lab order -- John
--If Exists(Select * from sys.columns where Name = N'AuditData' AND Object_ID = Object_ID(N'ord_Visit'))
--BEGIN
--	ALTER TABLE ord_Visit DROP COLUMN AuditData
--END
--GO

If Not Exists(Select * from sys.columns where Name = N'HistoryARTUse' AND Object_ID = Object_ID(N'PatientHivDiagnosis'))
BEGIN
	ALTER TABLE PatientHivDiagnosis ADD HistoryARTUse int
END
GO

If NOT Exists(Select * from sys.columns where Name = N'Status' AND Object_ID = Object_ID(N'PatientEncounter'))
BEGIN
	ALTER TABLE patientEncounter ADD Status int NOT NULL default 0
END
GO


If Exists(Select * from sys.columns where Name = N'CreateBy' AND Object_ID = Object_ID(N'PatientEncounter'))
BEGIN
	EXEC sp_rename 'patientEncounter.Createby', 'CreatedBy', 'COLUMN' 
END
GO
---
--LogMessage Column
---
Alter table ApiOutBox Alter Column LogMessage varchar(max)
GO
Alter table ApiInBox Alter Column LogMessage varchar(max)
GO

If Not Exists(Select * from sys.columns where Name = N'OrderedByName' AND Object_ID = Object_ID(N'ord_PatientPharmacyOrder'))
BEGIN
	ALTER TABLE ord_PatientPharmacyOrder ADD OrderedByName varchar(100)
END
GO

If Exists(Select * from sys.columns where Name = N'AuditData' AND Object_ID = Object_ID(N'ord_Visit'))
BEGIN
	ALTER TABLE ord_Visit DROP COLUMN AuditData
END
GO

If NOT Exists(Select * from sys.columns where Name = N'AuditData' AND Object_ID = Object_ID(N'ord_visit'))
BEGIN
	ALTER TABLE ord_visit ADD AuditData XML
END
GO


