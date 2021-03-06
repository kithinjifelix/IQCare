/****** Object:  View [dbo].[PatientRelationshipView]    Script Date: 25-May-2018 11:59:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientRelationshipView]'))
DROP VIEW [dbo].[PatientRelationshipView]
GO
/****** Object:  View [dbo].[PatientRelationshipView]    Script Date: 25-May-2018 11:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PatientRelationshipView]'))
EXEC dbo.sp_executesql @statement = N'Create VIEW [dbo].[PatientRelationshipView]
AS
Select 
	 P.Id PatientId
	,P.PersonId PatientPersonId
	,PD.FirstName PatientFirstName
	,PD.MiddleName PatientMiddleName
	,PD.LastName PatientLastName
	,(Select Top 1		Name	From LookupItem LI		Where LI.Id = PD.Sex)	PatientSex
	,isnull(PD.DateOfBirth, P.DateOfBirth) PatientDOB
	,R.FirstName RelativeFirstName
	,R.[MiddleName] RelativeMiddleName
	,R.LastName RelativeLastName
	,(Select Top 1	Name	From LookupItem LI	Where LI.Id = R.Sex)	RelativeSex
	,R.DateOfBirth RelativeDateOfBirth
	,(Select Top 1	Name From LookupItem LI	Where LI.Id = PR.RelationshipTypeId) Relationship

From Patient P
Inner Join PersonRelationship PR On P.Id = PR.PatientId
Inner Join PersonView R On R.Id = PR.PersonId
Inner Join PersonView PD On PD.Id = P.PersonId
Where p.DeleteFlag = 0
And PR.DeleteFlag = 0
And R.DeleteFlag = 0 

' 
GO
