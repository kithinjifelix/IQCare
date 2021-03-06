/****** Object:  StoredProcedure [dbo].[Pharmacy_ModifyPrescription]    Script Date: 28-May-2018 12:47:39 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_ModifyPrescription]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pharmacy_ModifyPrescription]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_ModifyPrescription]    Script Date: 28-May-2018 12:47:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pharmacy_ModifyPrescription]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Pharmacy_ModifyPrescription] AS' 
END
GO
-- =============================================
-- Author:		Joseph N	
-- Create date: <Create Date,,>
-- Description:	Modify a pharmacy prescription
-- =============================================
ALTER PROCEDURE [dbo].[Pharmacy_ModifyPrescription]
@ptn_pharmacy_pk int,   
 @Ptn_pk int,                                                
 @LocationID int,                                                
 @OrderedBy int,                                                
 @OrderedByDate datetime,                                                
 @VisitType int,                                                
 @UserID int,                                                 
 @RegimenType varchar(50),                                                
 @DispensedBy int=null,                                                
 @DispensedByDate datetime=null,                      
 @ReportedByDate datetime=null,                                              
 @OrderType int,                                                
 @Signature int,                                                
 @EmployeeID int,                                                
 @Height decimal(8,1),                                                
 @Weight numeric(8,1),                                                 
 @FDC int,                                        
 @ProgID int,                                  
 @ProviderID int,                      
 @PeriodTaken int,                    
@EditReason varchar(250),
 @flag int=null,                
 @RegimenLine int,                
 @PharmacyNotes varchar(200),              
 @AppntDate datetime=null,              
 @AppntReason int  ,
 @ModuleID int = null   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   declare @VisitPk int;

   Select @VisitPk = VisitID From ord_PatientPharmacyOrder Where ptn_pharmacy_pk=@ptn_pharmacy_pk;

   Update ord_visit set DeleteFlag = 1, UserID=@UserId, UpdateDate = getdate() where Visit_Id=@VisitPk;
   Update dtl_PatientAppointment Set DeleteFlag =1 , UpdateUserId=@UserID, UpdateDate=getdate() where Visit_pk=@VisitPk;
   update dtl_RegimenMap Set DeleteFlag=1, UserId=@UserID, UpdateDate =getdate() where  dtl_RegimenMap.Visit_Pk=@VisitPk
   update ord_PatientPharmacyOrder set DeleteFlag = 1 where ptn_pharmacy_pk =@ptn_pharmacy_pk;
   Delete from [dtl_PatientVitals] where Visit_pk=@VisitPk;
   --- insert a new order
   Declare @NewPrescriptionPk int,@NewVisitPk int ,@RegimenId int,@ARTStartDate datetime     ;

	Select @RegimenType = Nullif(Ltrim(Rtrim(@RegimenType)), '');

	                                               
		Insert Into ord_Visit (
			Ptn_pk,
			LocationID,
			VisitDate,
			VisitType,
			UserID,
			Createdate,
			DataQuality,
			ModuleID)
		Values (
			@Ptn_pk, 
			@LocationID, 
			@OrderedByDate, 
			@VisitType, 
			@UserID, 
			Getdate(), 
			1,
			@ModuleID);		
		Set @NewVisitPk =SCOPE_IDENTITY();

		Insert Into dbo.ord_PatientPharmacyOrder (
			Ptn_pk,
			VisitID,
			LocationID,
			OrderedBy,
			OrderedByDate,
			DispensedBy,
			DispensedByDate,
			OrderType,
			Height,
			Weight,
			FDC,
			ProgID,
			Signature,
			EmployeeID,
			UserID,
			CreateDate,
			ProviderID,
			PharmacyPeriodTaken,
			Regimenline,
			PharmacyNotes)
		Values (
			@Ptn_pk, 
			@NewVisitPk, 
			@LocationID, 
			@OrderedBy, 
			@OrderedByDate, 
			@DispensedBy, 
			@DispensedByDate, 
			@OrderType, 
			@Height, 
			@Weight, 
			@FDC, 
			@ProgID, 
			@Signature, 
			@EmployeeID, 
			@UserID, 
			Getdate(), 
			@ProviderID, 
			@PeriodTaken, 
			@RegimenLine, 
			@PharmacyNotes);
		Set @NewPrescriptionPk =SCOPE_IDENTITY();

		If Not Exists (Select	1	From [dtl_PatientVitals]	Where Visit_pk = @NewVisitPk	And ptn_pk = @Ptn_pk) Begin
			Insert Into [dtl_PatientVitals] (
				[Ptn_pk],
				[LocationID],
				[Visit_pk],
				[Height],
				[Weight],
				[UserID],
				[CreateDate])
			Values (
				@Ptn_pk, 
				@LocationID, 
				@NewVisitPk, 
				@Height, 
				@Weight, 
				@UserID, 
				Getdate());
		End
		Update ord_PatientPharmacyOrder Set
			ReportingID = (Select Right('000000' + Convert(varchar, @NewPrescriptionPk), 6)),
			OrderStatus = (Case when @DispensedByDate Is Not Null And @DispensedBy > 0 Then 2 ELse orderstatus End)
		Where ptn_pharmacy_pk =@NewPrescriptionPk;

		

		If (@AppntDate Is Not Null Or Year(@AppntDate) != '1900') Begin
			Insert Into dtl_patientappointment (
				Ptn_pk,
				Visit_pk,
				LocationID,
				AppDate,
				AppReason,
				AppStatus,
				EmployeeId,
				DeleteFlag,
				UserId,
				CreateDate,
				ModuleId)
			Values (
				@Ptn_pk, 
				@NewVisitPk, 
				@LocationID, 
				@AppntDate, 
				@AppntReason, 
				12, 
				@EmployeeID, 
				0, 
				@UserID, 
				Getdate(),
				@ModuleID);
		End

		
		If(@RegimenType Is Not Null) Begin	
			Insert Into dtl_RegimenMap (
				Ptn_Pk,
				LocationID,
				Visit_Pk,
				RegimenType,
				OrderId,
				UserID,
				CreateDate)
			Values (
				@Ptn_pk, 
				@LocationID, 
				@NewVisitPk, 
				@RegimenType, 
				@NewPrescriptionPk, 
				@UserID, 
				Getdate());
		End
		Select @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@Ptn_pk);
		Update mst_Patient Set
			ARTStartDate = @ARTStartDate
		Where ptn_pk = @Ptn_pk;

		Insert Into AuditTracker_PharmacyOrder (
			OriginalPharmacyPk
		   ,CurrentPharmacyPk
		   ,UserId
		   ,CreateDate
		   ,Justification)
		Values (
			@ptn_pharmacy_pk
		   ,@NewPrescriptionPk
		   ,@UserID
		   ,getdate()
		   ,@EditReason)

		Select @NewPrescriptionPk;
	
	
END

GO
