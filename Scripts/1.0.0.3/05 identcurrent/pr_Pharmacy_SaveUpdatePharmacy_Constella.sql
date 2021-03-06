/****** Object:  StoredProcedure [dbo].[pr_Pharmacy_SaveUpdatePharmacy_Constella]    Script Date: 11/29/2015 07:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- sp_helptext pr_Pharmacy_SaveUpdatePharmacy_Constella

ALTER PROCEDURE [dbo].[pr_Pharmacy_SaveUpdatePharmacy_Constella]                                                
@Ptn_pk int,        
@ptn_pharmacy_pk int,        
@LocationID int,        
@OrderedBy int,        
@OrderedByDate datetime,        
@UserID int,                                                
@RegimenType varchar(50),        
@RegimenLine int,      
@PharmacyNotes varchar(200),    
@DispensedBy int=null,        
@DispensedByDate datetime=null ,        
@Signature int,        
@EmployeeID int,                                                
@OrderType int,        
@HoldMedicine int,        
@ProgID int,        
@ProviderID int,        
@PeriodTaken int,        
@Prophylaxis int=null,        
@Flag int                                                 
                                                
AS                                                    
Declare @ptn_pharmacy int                                                    
Declare @Visit_Pk int                                    
Declare @RegimenId int                                
Declare @ARTStartDate datetime                                
                                              
if @Flag=1                                                   
BEGIN                                                    
                                               
if exists(select * from ord_patientpharmacyorder where ptn_pk = @Ptn_pk and orderedbydate = @OrderedByDate and ordertype = 116)                                              
    begin                                              
  if exists(select a.visitid from ord_patientpharmacyorder a inner join ord_Visit b                                          
          on a.visitID=b.Visit_ID where a.ptn_pk=@Ptn_pk and a.orderedBydate=@OrderedByDate and (b.Deleteflag =0 or b.deleteFlag is null ) and a.ordertype = 116)                                          
  begin                                           
   select 0                                              
   return                                              
  end                                           
    end                                              
                                              
 if(@DispensedByDate is null or @DispensedByDate='' )                 
 begin                                        
  Insert Into ord_Visit(Ptn_pk,LocationID,VisitDate,VisitType,UserID,Createdate)                                                  
  Values (@Ptn_pk,@LocationID,@OrderedByDate,4,@UserID,getdate())                      
    end                
  if(@DispensedByDate is not null)                 
 begin                                        
  Insert Into ord_Visit(Ptn_pk,LocationID,VisitDate,VisitType,UserID,Createdate,DataQuality)                                                  
  Values (@Ptn_pk,@LocationID,@OrderedByDate,4,@UserID,getdate(),1)                      
    end                                                
                                                     
 set @Visit_Pk = scope_identity();                                                   
                                                  
 Insert Into ord_PatientPharmacyOrder(Ptn_pk,VisitID,LocationID,OrderedBy,OrderedByDate,DispensedBy,DispensedByDate,OrderType,                                                
 HoldMedicine,ProgID,Signature,EmployeeID,UserID,CreateDate,ProviderID,PharmacyPeriodTaken, Regimenline, PharmacyNotes)                                                    
 Values (@Ptn_pk,@Visit_Pk,@LocationID,@OrderedBy,@OrderedByDate,@DispensedBy,@DispensedByDate,@OrderType,@HoldMedicine,@ProgID,                                                
 @Signature,@EmployeeID,@UserID,getdate(),@ProviderID,@PeriodTaken,@RegimenLine, @PharmacyNotes)                                                    
                                                  
set @ptn_pharmacy = scope_identity();                                                     
if(@ProgID=222 or @ProgID=223)        
begin                          
  if( @RegimenType <> '')                                        
  begin              
  if(@Prophylaxis=0)            
  begin                                             
     Insert Into dtl_RegimenMap(Ptn_Pk,LocationID,Visit_Pk,RegimenType,OrderId,UserID,CreateDate)                                   
     Values(@Ptn_pk,@LocationID,@Visit_Pk,@RegimenType,@ptn_pharmacy,@UserID,getdate())                                                    
  end            
 end              
  if(@Prophylaxis <> 0)                                        
  begin                                               
   Insert Into dtl_RegimenMap(Ptn_Pk,LocationID,Visit_Pk,RegimenType,OrderId,UserID,CreateDate)                                                    
   Values(@Ptn_pk,@LocationID,@Visit_Pk,@RegimenType,@ptn_pharmacy,@UserID,getdate())                                                    
  end                                        
                           
   set @ARTStartDate= dbo.fn_GetPatientARTStartDate_constella(@Ptn_pk)                          
   update mst_Patient set ARTStartDate=@ARTStartDate where Ptn_Pk=@Ptn_pk                                    
 end                        
declare @ARTCount int                          
select @ARTCount=count(*) from ord_patientpharmacyorder where ptn_pk=@Ptn_pk and progid=222 and (DeleteFlag is null or DeleteFlag=0)                          
 if @ARTCount is null and @ARTCount=0                          
 begin                          
  update mst_Patient set ARTStartDate=null where Ptn_Pk=@Ptn_pk                          
  end                                               
 select @ptn_pharmacy                                                     
                                                    
END          
if @Flag=2          
        
                                             
BEGIN                                              
                                            
 Update [ord_PatientPharmacyOrder] Set [OrderedBy]=@OrderedBy,[OrderedByDate] = @OrderedByDate,[DispensedBy]= @DispensedBy ,                                         
 [DispensedByDate] = @DispensedByDate,[Signature] = @Signature,[EmployeeID] = @EmployeeID,[ProgID]=@ProgID,[HoldMedicine] = @HoldMedicine,                                        
[ProviderId] = @ProviderID,UserID=@UserID,PharmacyPeriodTaken=@PeriodTaken, RegimenLine=@RegimenLine, PharmacyNotes=@PharmacyNotes,                                  
[UpdateDate] = getdate() Where ([ptn_pharmacy_pk] = @ptn_pharmacy_pk)                                               
                                              
if( @RegimenType <> '')               
begin            
 if not exists(select * from dtl_RegimenMap where orderid=@Ptn_Pharmacy_Pk and (deleteflag is null or deleteflag=0))            
 begin            
          
  select @Visit_Pk=visitid from ord_PatientPharmacyOrder where ptn_pharmacy_pk=@ptn_pharmacy_pk            
  set @Ptn_Pk=(select Ptn_Pk from ord_PatientPharmacyOrder where ptn_pharmacy_pk=@ptn_pharmacy_pk)               
                             
  Insert Into dtl_RegimenMap(Ptn_Pk,LocationID,Visit_Pk,RegimenType,OrderId,UserID,CreateDate)                                                        
  Values(@Ptn_pk,@LocationID,@Visit_Pk,@RegimenType,@ptn_pharmacy_pk,@UserID,getdate())            
    end            
end            
             
Select @RegimenId = RegimenMap_Pk from dtl_regimenmap a,ord_patientpharmacyorder b where a.ptn_pk = b.ptn_pk                                            
 and a.orderid = b.ptn_pharmacy_pk and b.Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk                                            
                                 
if(@ProgID=222 or @ProgID=223)                              
begin                
  if( @RegimenType <> '')                                          
  begin                
  if(@Prophylaxis=0)              
  begin                
    if(@ProgID=223)              
   begin   
     Update [dtl_RegimenMap] Set [RegimenType]='' ,[UpdateDate]=getdate()                                             
     Where ([RegimenMap_Pk] = @RegimenId)               
   end              
   if(@ProgID=222)              
   begin                    
     Update [dtl_RegimenMap] Set [RegimenType]=@RegimenType ,[UpdateDate]=getdate()                                             
     Where ([RegimenMap_Pk] = @RegimenId)               
   end                
  end                              
  end              
if(@Prophylaxis <> 0)                                          
  begin                                                 
   Update [dtl_RegimenMap] Set [RegimenType]=@RegimenType ,[UpdateDate]=getdate()                                             
   Where ([RegimenMap_Pk] = @RegimenId)                                                       
  end            
 if( @RegimenType = '')                                          
  begin                 
  Update [dtl_RegimenMap] Set [RegimenType]=@RegimenType ,[UpdateDate]=getdate()                                             
  Where ([RegimenMap_Pk] = @RegimenId)            
             
  end                              
--- Rupesh 08Jan08 -data was not going in ord_visit----                                  
 declare @VID int                                  
 select @VID=VisitID from ord_PatientPharmacyOrder where ptn_pharmacy_pk=@ptn_pharmacy_pk                                  
 if(@DispensedByDate is null or @DispensedByDate='')                    
 begin                              
  update ord_Visit set VisitDate=@OrderedByDate,DataQuality=0 where Visit_Id=@VID                    
 end                    
 if(@DispensedByDate is not null)                    
 begin                              
  update ord_Visit set VisitDate=@OrderedByDate,DataQuality=1 where Visit_Id=@VID                    
 end                                    
                                 
 set @Ptn_Pk=(select Ptn_Pk from ord_PatientPharmacyOrder where ptn_pharmacy_pk=@ptn_pharmacy_pk)                                
 set @ARTStartDate=dbo.fn_GetPatientARTStartDate_constella(@Ptn_Pk)                             
                             
                            
 update mst_Patient set ARTStartDate=@ARTStartDate where Ptn_Pk=@Ptn_Pk                             
                              
  end                            
else                          
begin                        
 --print(1)                      
 set @Ptn_Pk=(select Ptn_Pk from ord_PatientPharmacyOrder where ptn_pharmacy_pk=@ptn_pharmacy_pk)                                  
 update mst_Patient set ARTStartDate=dbo.fn_GetPatientARTStartDate_constella(@Ptn_Pk) where Ptn_Pk=@Ptn_Pk                         
end                   
  
-- update ord_PatientPharmacyOrder set OrderStatus = 1 where DispensedByDate is null and ptn_pharmacy_pk = @ptn_pharmacy_pk  
          
select @ptn_pharmacy_pk                                               
end
