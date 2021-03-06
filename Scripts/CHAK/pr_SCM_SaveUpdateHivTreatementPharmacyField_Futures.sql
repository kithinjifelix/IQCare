/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveUpdateHivTreatementPharmacyField_Futures]    Script Date: 8/15/2018 12:30:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Alter procedure [dbo].[pr_SCM_SaveUpdateHivTreatementPharmacyField_Futures]    

@OrderID int,    

@weight VarChar(50),    

@height VarChar(50),            

@Programe int,    

@Periodtaken int,    

@Provider int,    

@RegimenLine int,
@RegimenCode int,    

@NxtAppDate datetime,    

@Region int    

                      

as                       

begin                          

    

declare @VisitGetID varchar(50)  

declare @PtnGetPk varchar(50)  

declare @LocationID varchar(50)  

declare @EmpID varchar(50)  

declare @deleteflag varchar(50)  

declare @UserID varchar(50)  

           

update  ord_PatientPharmacyOrder set Weight =@weight,Height=@height,ProgID=@Programe,    

PharmacyPeriodTaken=@Periodtaken ,ProviderID=@Provider,RegimenLine=@RegimenLine    

where ptn_pharmacy_pk=@OrderID    

    

set @VisitGetID = (select visitid from ord_PatientPharmacyOrder where ptn_pharmacy_pk =@OrderID)    

set @PtnGetPk = (select Ptn_pk from ord_PatientPharmacyOrder where ptn_pharmacy_pk =@OrderID)    

set @LocationID = (select LocationID from ord_PatientPharmacyOrder where ptn_pharmacy_pk =@OrderID)    

set @EmpID = (select EmployeeID from ord_PatientPharmacyOrder where ptn_pharmacy_pk =@OrderID)    

set @deleteflag = (select DeleteFlag from ord_PatientPharmacyOrder where ptn_pharmacy_pk =@OrderID)    

set @UserID = (select UserID from ord_PatientPharmacyOrder where ptn_pharmacy_pk =@OrderID)    

Update dbo.Dtl_RegimenMap set RegimenId=@RegimenCode where ptn_pk = @PtnGetPk and        

       Visit_Pk = @VisitGetID and OrderId = @OrderID  

declare @AppReason int

select @AppReason = id from mst_decode where name = 'Pharmacy Refill'

  

if exists(select 1 from dtl_PatientAppointment where Visit_pk=@VisitGetID and appreason<>@AppReason)  

 begin  

  update dtl_PatientAppointment set    

  AppDate=@NxtAppDate,AppReason=@Region     

  where Visit_pk= (select visitid from ord_PatientPharmacyOrder where ptn_pharmacy_pk =@OrderID)    

 end    

else  

  begin  

   insert into dtl_PatientAppointment(Ptn_pk ,LocationID,Visit_pk,AppDate,AppReason,AppStatus,EmployeeID,DeleteFlag,UserID ,CreateDate)  

          values(@PtnGetPk,@LocationID,@VisitGetID,@NxtAppDate ,@Region,0,@EmpID   ,@deleteflag ,@UserID ,GETDATE())  

  end  

  

select a.Weight,a.Height,a.ProgID,a.PharmacyPeriodTaken,a.ProviderID,      

a.RegimenLine ,b.AppDate,isnull(b.AppReason,0)AppReason      

from ord_PatientPharmacyOrder a left outer join  dtl_PatientAppointment b      

on a.visitid=b.Visit_pk where a.ptn_pharmacy_pk=@OrderID      

  

 -- select * from ord_PatientPharmacyOrder where ptn_pharmacy_pk=67    

-- select * from dtl_PatientAppointment  where Visit_pk= 591

        

    

end




