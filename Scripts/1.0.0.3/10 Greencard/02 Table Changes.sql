ALTER TABLE ord_LabOrder ALTER COLUMN OrderNumber VARCHAR(50) NULL
ALTER TABLE PatientHivDiagnosis ALTER COLUMN ARTInitiationDate DATETIME NULL
IF EXISTS(SELECT * FROM sys.columns WHERE Name = N'Void'AND Object_ID = OBJECT_ID(N'ServiceArea'))
    BEGIN
ALTER TABLE [dbo].[ServiceArea] DROP  CONSTRAINT [DF_ServiceArea_Void]  
ALTER TABLE ServiceArea DROP COLUMN Void
    END;
IF EXISTS(SELECT * FROM sys.columns WHERE Name = N'VoidDate'AND Object_ID = OBJECT_ID(N'ServiceArea'))
    BEGIN
ALTER TABLE [dbo].[ServiceArea] DROP  CONSTRAINT [DF_ServiceArea_VoidDate] 
ALTER TABLE ServiceArea DROP COLUMN VoidDate
    END;
IF EXISTS(SELECT * FROM sys.columns WHERE Name = N'VoidBy'AND Object_ID = OBJECT_ID(N'ServiceArea'))
    BEGIN
ALTER TABLE [dbo].[ServiceArea] DROP  CONSTRAINT [DF_ServiceArea_VoidBy] 
ALTER TABLE ServiceArea DROP COLUMN VoidBy
    END;

IF EXISTS(SELECT * FROM sys.columns WHERE Name = N'BaselineResult'AND Object_ID = OBJECT_ID(N'HIVTesting'))
BEGIN
	ALTER TABLE [dbo].[HIVTesting] DROP  COLUMN BaselineResult;
END;

IF EXISTS(SELECT * FROM sys.columns WHERE Name = N'BaselineDate'AND Object_ID = OBJECT_ID(N'HIVTesting'))
BEGIN
	ALTER TABLE [dbo].[HIVTesting] DROP  COLUMN BaselineDate;
END;

IF EXISTS(SELECT * FROM sys.columns WHERE Name = N'CCCNumber'AND Object_ID = OBJECT_ID(N'HIVTesting'))
BEGIN
	ALTER TABLE [dbo].[HIVTesting] DROP  COLUMN CCCNumber;
END;

IF EXISTS(SELECT * FROM sys.columns WHERE Name = N'EnrollmentId'AND Object_ID = OBJECT_ID(N'HIVTesting'))
BEGIN
	ALTER TABLE [dbo].[HIVTesting] DROP  COLUMN EnrollmentId;
END;


IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'TakeMedicine'AND Object_ID = OBJECT_ID(N'AdherenceAssessment'))
BEGIN
	ALTER TABLE [dbo].[AdherenceAssessment] ADD TakeMedicine bit null;
END;


IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'StopMedicine'AND Object_ID = OBJECT_ID(N'AdherenceAssessment'))
BEGIN
	ALTER TABLE [dbo].[AdherenceAssessment] ADD StopMedicine bit NULL;
END;


IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'UnderPressure'AND Object_ID = OBJECT_ID(N'AdherenceAssessment'))
BEGIN
	ALTER TABLE [dbo].[AdherenceAssessment] ADD UnderPressure bit NULL;
END;

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'DifficultyRemembering'AND Object_ID = OBJECT_ID(N'AdherenceAssessment'))
BEGIN
	ALTER TABLE [dbo].[AdherenceAssessment] ADD DifficultyRemembering decimal(10,2) NULL;
END;

ALTER TABLE PersonRelationship
DROP CONSTRAINT [PK_PersonRelationship]

ALTER TABLE PersonRelationship
ADD CONSTRAINT [PK_PersonRelationship] PRIMARY KEY (Id)

IF EXISTS(SELECT * FROM sys.columns WHERE Name = N'RelatedTo' AND Object_ID = OBJECT_ID(N'PersonRelationship'))
BEGIN
	ALTER TABLE [dbo].[PersonRelationship] DROP COLUMN RelatedTo;
END;

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'PatientId' AND Object_ID = OBJECT_ID(N'PersonRelationship'))
BEGIN
	ALTER TABLE [dbo].[PersonRelationship] ADD PatientId int;
END;

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'BaselineResult' AND Object_ID = OBJECT_ID(N'PersonRelationship'))
BEGIN
	ALTER TABLE [dbo].[PersonRelationship] ADD BaselineResult int;
END;

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'BaselineDate' AND Object_ID = OBJECT_ID(N'PersonRelationship'))
BEGIN
	ALTER TABLE [dbo].[PersonRelationship] ADD BaselineDate DATETIME NULL;
END;

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'FamilyInfoId' AND Object_ID = OBJECT_ID(N'PersonRelationship'))
BEGIN
	ALTER TABLE [dbo].[PersonRelationship] ADD FamilyInfoId int NOT NULL;
END;

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'DeleteFlag'AND Object_ID = OBJECT_ID(N'ServiceArea'))
    BEGIN
ALTER TABLE ServiceArea ADD  DeleteFlag BIT NULL
ALTER TABLE [dbo].[ServiceArea] ADD  CONSTRAINT [DF_ServiceArea_DeleteFlag]  DEFAULT ((0)) FOR [DeleteFlag]
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'CreatedBy'AND Object_ID = OBJECT_ID(N'ServiceArea'))
    BEGIN
EXEC sp_rename 'ServiceArea.CreateBy', 'CreatedBy', 'COLUMN';
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'AuditData'AND Object_ID = OBJECT_ID(N'ServiceArea'))
    BEGIN
ALTER TABLE ServiceArea ADD AuditData XML NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'VisitDate'AND Object_ID = OBJECT_ID(N'PregnancyIndicator'))
    BEGIN
        ALTER TABLE PregnancyIndicator ADD VisitDate DATETIME;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'DateOfBirth' AND Object_ID = OBJECT_ID(N'Person'))
	BEGIN
		ALTER TABLE Person ADD DateOfBirth DATETIME NULL;
	END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'DobPrecision' AND Object_ID = OBJECT_ID(N'Person'))
	BEGIN
		ALTER TABLE Person ADD DobPrecision BIT NULL;
	END;
IF EXISTS(SELECT * FROM sys.columns WHERE Name = N'LMP'AND Object_ID = OBJECT_ID(N'PregnancyIndicator'))
    BEGIN
        ALTER TABLE PregnancyIndicator ALTER COLUMN LMP DATETIME NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'VisitDate'AND Object_ID = OBJECT_ID(N'PatientFamilyPlanning'))
    BEGIN
        ALTER TABLE PatientFamilyPlanning ADD VisitDate DATETIME;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'VisitDate'AND Object_ID = OBJECT_ID(N'PatientScreening'))
    BEGIN
        ALTER TABLE PatientScreening ADD VisitDate DATETIME;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'PatientMasterVisitId'AND Object_ID = OBJECT_ID(N'ord_PatientPharmacyOrder'))
    BEGIN
        ALTER TABLE ord_PatientPharmacyOrder ADD PatientMasterVisitId INT NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'PatientId'AND Object_ID = OBJECT_ID(N'ord_PatientPharmacyOrder'))
    BEGIN
        ALTER TABLE ord_PatientPharmacyOrder ADD PatientId INT NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'abbreviation'AND Object_ID = OBJECT_ID(N'Mst_ItemMaster'))
    BEGIN
        ALTER TABLE Mst_ItemMaster ADD abbreviation NVARCHAR(50) NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'AuditData'AND Object_ID = OBJECT_ID(N'dtl_LabOrderTest'))
    BEGIN
        ALTER TABLE dtl_LabOrderTest ADD AuditData XML NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ResultUnits'AND Object_ID = OBJECT_ID(N'PatientLabTracker'))
    BEGIN
        ALTER TABLE PatientLabTracker ADD ResultUnits varchar(50) NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ResultDate'AND Object_ID = OBJECT_ID(N'PatientLabTracker'))
    BEGIN
        ALTER TABLE PatientLabTracker ADD ResultDate DATETIME;
    END;	
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ResultOptions'AND Object_ID = OBJECT_ID(N'PatientLabTracker'))
    BEGIN
        ALTER TABLE PatientLabTracker ADD ResultOptions varchar(50) NULL;
    END;	
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'AuditData'AND Object_ID = OBJECT_ID(N'ord_Visit'))
    BEGIN
        ALTER TABLE ord_Visit ADD AuditData xml NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'PatientId'AND Object_ID = OBJECT_ID(N'ord_LabOrder'))
    BEGIN
        ALTER TABLE ord_LabOrder ADD PatientId INT NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'PatientMasterVisitId'AND Object_ID = OBJECT_ID(N'ord_LabOrder'))
    BEGIN
        ALTER TABLE ord_LabOrder ADD	PatientMasterVisitId INT NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'AuditData'AND Object_ID = OBJECT_ID(N'ord_LabOrder'))
    BEGIN
        ALTER TABLE ord_LabOrder ADD AuditData xml NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'AuditData'AND Object_ID = OBJECT_ID(N'dtl_LabOrderTestResult'))
    BEGIN
        ALTER TABLE dtl_LabOrderTestResult ADD AuditData xml NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'CreateDate'AND Object_ID = OBJECT_ID(N'dtl_LabOrderTest'))
    BEGIN
        ALTER TABLE dtl_LabOrderTest ADD CreateDate datetime NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'CreatedBy'AND Object_ID = OBJECT_ID(N'dtl_LabOrderTest'))
    BEGIN
        ALTER TABLE dtl_LabOrderTest ADD CreatedBy int NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'RegimenCode'AND Object_ID = OBJECT_ID(N'PatientTreatmentInitiation'))
    BEGIN
        ALTER TABLE PatientTreatmentInitiation ADD RegimenCode int NULL;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ldl' AND Object_ID = OBJECT_ID(N'PatientTreatmentInitiation'))
	BEGIN
		ALTER TABLE PatientTreatmentInitiation ADD ldl bit NULL;
		ALTER TABLE [dbo].[PatientTreatmentInitiation] ADD  CONSTRAINT [DF_PatientTreatmentInitiation_ldl]  DEFAULT ((0)) FOR [ldl]
	END;

IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'EverBeenOnIpt'AND Object_ID = OBJECT_ID(N'PatientIcf'))
    BEGIN
        ALTER TABLE PatientIcf ADD EverBeenOnIpt bit;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'GeneXpert'AND Object_ID = OBJECT_ID(N'PatientIcfAction'))
    BEGIN
        ALTER TABLE PatientIcfAction ADD GeneXpert int;
    END;
ALTER TABLE PatientIcfAction ALTER COLUMN SputumSmear INT NULL
ALTER TABLE PatientIcfAction ALTER COLUMN ChestXray INT NULL
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'StartIpt'AND Object_ID = OBJECT_ID(N'PatientIptWorkup'))
    BEGIN
        ALTER TABLE PatientIptWorkup ADD StartIpt bit;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'IptStartDate'AND Object_ID = OBJECT_ID(N'PatientIptWorkup'))
    BEGIN
        ALTER TABLE PatientIptWorkup ADD IptStartDate Datetime;
    END;
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'IptRegimen'AND Object_ID = OBJECT_ID(N'PatientIptWorkup'))
    BEGIN
        ALTER TABLE PatientIptWorkup ADD IptRegimen int;
    END;

Go
IF Not Exists (SELECT * FROM sys.columns WHERE Name = 'HeadCircumference' AND object_id = OBJECT_ID('dbo.PatientVitals'))
    ALTER TABLE PatientVitals ADD HeadCircumference DECIMAL(8,2);
GO 
IF Not Exists (SELECT * FROM sys.columns WHERE Name = 'BMI' AND object_id = OBJECT_ID('dbo.PatientVitals'))
    ALTER TABLE PatientVitals ADD BMI DECIMAL(8,2);
GO
IF   EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[County]') AND name = N'IX_County_SubCountyId') Begin
DROP INDEX [IX_County_SubCountyId] ON [dbo].[County]
End
Go
IF   EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[County]') AND name = N'IX_County_CountyId') Begin
DROP INDEX [IX_County_CountyId] ON [dbo].[County]
End
Go
CREATE NONCLUSTERED INDEX [IX_County_CountyId] ON [dbo].[County]([CountyId] ASC)
Go

CREATE NONCLUSTERED INDEX [IX_County_SubCountyId] ON [dbo].[County]([SubCountyId] ASC)

GO
IF   EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[County]') AND name = N'IX_County_SubCountyId') Begin
DROP INDEX [IX_County_SubCountyId] ON [dbo].[County]
End
Go
IF   EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[County]') AND name = N'IX_County_CountyId') Begin
DROP INDEX [IX_County_CountyId] ON [dbo].[County]
End
Go
CREATE NONCLUSTERED INDEX [IX_County_CountyId] ON [dbo].[County]([CountyId] ASC)
Go
CREATE NONCLUSTERED INDEX [IX_County_SubCountyId] ON [dbo].[County]([SubCountyId] ASC)
GO
IF   EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FacilityList]') AND name = N'IX_FacilityList_Name') Begin
DROP INDEX [IX_FacilityList_Name] ON [dbo].[FacilityList]
End
Go
CREATE NONCLUSTERED INDEX [IX_FacilityList_Name] ON [dbo].[FacilityList](	[Name] ASC)
Go
IF   EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[FacilityList]') AND name = N'IX_FacilityList')
DROP INDEX [IX_FacilityList] ON [dbo].[FacilityList]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FacilityList] ON [dbo].[FacilityList](	[MFLCode] ASC)INCLUDE ( 	[Name]) 
Go