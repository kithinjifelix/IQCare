IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Clinical_DeletePatientForms_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Clinical_DeletePatientForms_Constella]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Clinical_DeletePatientForms_Constella]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Clinical_DeletePatientForms_Constella] AS' 
END
GO
ALTER procedure [dbo].[pr_Clinical_DeletePatientForms_Constella]                                          
@OrderNo int, @FormName varchar(50), @PatientId int, @UserID int                                          
                                          
as                                          
                              
Declare @ARTStartDate datetime                               
                                        
begin                                  
                                   
If(@FormName In('Pharmacy', 'Paediatric Pharmacy','Pharmacy Form') ) Begin       
    declare @Vid int
	Select @Vid = VisitID From ord_PatientPharmacyOrder Where ptn_pharmacy_pk = @OrderNo And Ptn_pk = @PatientId
	Update ord_Visit Set DeleteFlag = 1    ,UserID = @UserID   ,UpdateDate = getdate()
	Where Visit_Id = @Vid And Ptn_pk = @PatientId;

	Update ord_PatientPharmacyOrder	Set DeleteFlag = 1   ,UserID = @UserID   ,UpdateDate = getdate() Where VisitID = @Vid
	And Ptn_pk = @PatientId

	Update dtl_RegimenMap	Set DeleteFlag = 1   ,UpdateDate = getdate()	Where Visit_pk = @Vid
	And Ptn_pk = @PatientId;
	Set @ARTStartDate = dbo.fn_GetPatientARTStartDate_Constella(@PatientId)
	Update mst_Patient Set ARTStartDate = @ARTStartDate Where Ptn_pk = @PatientId

	Declare @ARTCount int
	Select @ARTCount = count(*) From ord_PatientPharmacyOrder Where Ptn_pk = @PatientId And ProgID = 222 And (DeleteFlag Is Null Or DeleteFlag = 0)
	If @ARTCount Is Null	And @ARTCount = 0	Begin
		Update mst_Patient	Set ARTStartDate = Null	Where Ptn_pk = @PatientId
	End
End                          
                          
 Else If (@FormName = 'ART Follow-Up' OR @FormName = 'Non-ART Follow-Up') Begin                                
              
    Update ord_visit set DeleteFlag=1,UserID=@UserID, UpdateDate=getdate() where  Visit_Id = @OrderNo   and  ptn_pk = @PatientId                                                
    Update dtl_patientappointment Set DeleteFlag = 1,UserID=@UserID, UpdateDate=getdate()                             
    Where ptn_pk = @PatientId and LocationId =(select  o.LocationId From ord_visit o                                
    where o.Visit_Id = @OrderNo  and o.ptn_pk = @PatientId)  and Visit_pk = @OrderNo ;                                
   End                          
                        
else if  @FormName = 'Patient Record - Follow Up'                      
begin                        
Update ord_visit set DeleteFlag=1,UserID=@UserID, UpdateDate=getdate() where  Visit_Id = @OrderNo   and  ptn_pk = @PatientId and Visittype = 8                      
                                 
end     
else if  @FormName = 'HIV Care/ART Encounter'                      
begin                        
Update ord_visit set DeleteFlag=1,UserID=@UserID, UpdateDate=getdate() where  Visit_Id = @OrderNo   and  ptn_pk = @PatientId and Visittype = 15                      
                                 
end  
else if  @FormName = 'Initial and Follow up Visits'                      
begin                        
Update ord_visit set DeleteFlag=1,UserID=@UserID, UpdateDate=getdate() where  Visit_Id = @OrderNo   and  ptn_pk = @PatientId and Visittype = 17                      
                                 
end  
    
else if  @FormName = 'Prior ART/HIV Care'                      
begin                        
Update ord_visit set DeleteFlag=1,UserID=@UserID, UpdateDate=getdate() where  Visit_Id = @OrderNo   and  ptn_pk = @PatientId and Visittype = 16                      
                                 
end                              
                                    
                                      
  else if  @FormName = 'Laboratory'   Begin                                
    Update ord_PatientLabOrder set DeleteFlag=1,UserID=@UserID, UpdateDate=getdate() where  LabId = @OrderNo   and  ptn_pk = @PatientId                                  
    Update ord_visit set DeleteFlag=1,UserID=@UserID, UpdateDate=getdate()                             
 where  Visit_Id = (select VisitId from ord_PatientLabOrder where LabId=@OrderNo)                                  
   End                          
                            
  else if  @FormName = 'Home Visit'                                 
  Begin                          
  Update dtl_patienthomevisit set DeleteFlag=1,UserID=@UserID, UpdateDate=getdate() where  HomeVisitID = @OrderNo   and  ptn_pk = @PatientId                                     
                             
  set @ARTStartDate= dbo.fn_GetPatientARTStartDate_constella(@PatientId)                                
  update mst_Patient set ARTStartDate=@ARTStartDate where Ptn_Pk=@PatientId                   
  End                 
  else if  @FormName = 'Custom'                
                  
 update ord_visit set DeleteFlag=1,UserID=@UserID, UpdateDate=getdate() where  Visit_Id = @OrderNo   and  ptn_pk = @PatientId                
                     
 end

GO
