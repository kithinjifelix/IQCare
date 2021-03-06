/****** Object:  View [dbo].[PatientPersonView]    Script Date: 25-May-2018 11:59:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientPersonView]'))
DROP VIEW [dbo].[PatientPersonView]
GO
/****** Object:  View [dbo].[PatientPersonView]    Script Date: 25-May-2018 11:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientPersonView]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[PatientPersonView]
AS


Select A.Id
	, A.PersonId
	, A.ptn_pk
	, A.PatientIndex
	,(Select Top 1 Name From Lookupitem Where Id = A.PatientType) PatientTypeName
	,A.PatientType
	,A.FacilityId
	  ,cast(decryptbykey(FirstName) As varchar(50)) As FirstName
	  ,cast(decryptbykey(MidName) As varchar(50)) As MiddleName
	  ,cast(decryptbykey(LastName) As varchar(50)) As LastName
	  ,(Select Top 1 Name From Lookupitem Where Id = B.Sex)  SexName
	  , B.Sex
	  ,A.Active
	  ,A.DeleteFlag
	  ,A.CreateDate
	  ,A.CreatedBy
	  ,A.AuditData
	  ,Isnull(A.DateOfBirth,B.DateOfBirth) DateOfBirth
	  ,Isnull(A.DobPrecision,B.DobPrecision) DobPrecision
	  ,cast(decryptbykey(A.NationalId) As varchar(50)) As NationalId
	  ,A.RegistrationDate
From Patient A inner join dbo.Person B On A.PersonId=B.Id




' 
GO
