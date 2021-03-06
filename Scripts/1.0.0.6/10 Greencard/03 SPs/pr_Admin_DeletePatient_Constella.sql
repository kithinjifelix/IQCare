IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Admin_DeletePatient_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Admin_DeletePatient_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Admin_DeletePatient_Constella]    Script Date: 2/7/2018 9:42:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** 
	Updated: Njung'e J
	On	   : 05 May 2014
	Description:  Set all patient identifiers to Null to enable reuse.

 ******/
CREATE PROCEDURE [dbo].[pr_Admin_DeletePatient_Constella]   
@PatientId int, 
@UserID int  
 -- Add the parameters for the stored procedure here  
AS  
BEGIN
Update dbo.mst_Patient Set
	deleteflag = 1,
	UserID = @UserID,
	UpdateDate = Getdate()
Where Ptn_Pk = @PatientId;

Declare @TsqlUpdate varchar(max) ,@FieldName varchar(200) ,@TsqlSelect varchar(max) ;
       
Select @TsqlUpdate = ''  ,@TsqlSelect='';
Declare @SS varchar(4000), @UpdateStat varchar(4000),@SelectStat varchar(4000);
Select @ss=  Substring((Select ',[' + Convert(varchar(Max), FieldName) + ']'
			From dbo.mst_patientidentifier
			Order By Id
			For xml Path (''))
		, 2, 4000);
		
Select @TsqlUpdate = 'Update dbo.mst_Patient Set '+ Replace(@SS, ',', ' = Null,')++ ' = Null' +' Where Ptn_PK = '+ Convert(varchar, @PatientID);

declare @patientpk int = (select top 1 id from patient where ptn_pk = @PatientID)
declare @personId int = (select top 1 personid from patient where id = @patientpk)

update Patient set DeleteFlag = 1 where id = @patientpk
update Person set DeleteFlag = 1 where Id = @personId


Set @TsqlSelect = 'Declare @xml_var XML; Set @xml_var = (Select '+@SS +' From dbo.mst_patient  Where Ptn_pk = ' + convert(varchar,@PatientId) +' FOR XML RAW (''Identifiers''), ELEMENTS );
Insert Into dbo.Dtl_PatientDeleteLog(Ptn_PK , Identifiers , DeleteDate , UserID)  Select '+ convert(varchar,@PatientId) +', @xml_var,getdate(),'+ Convert(varchar,@UserID)

exec (@TsqlSelect);

exec (@TsqlUpdate) ;

End 

       


