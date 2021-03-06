
/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePharmacyDispenseOrder_Futures]    Script Date: 11/29/2015 07:48:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[pr_SCM_SavePharmacyDispenseOrder_Futures]                
	@Ptn_Pk int,                
	@LocationId int,                
	@DispensedBy int,                
	@DispensedByDate datetime,                
	@OrderType int,                
	@ProgramId int,                
	@StoreId int,            
	@Regimen varchar(50),                
	@UserId int,        
	@OrderId int = 0   
As             
Begin
	Declare @VisitId int;

	Select @Regimen = Nullif(Ltrim(Rtrim(@Regimen)), '');
	If (@OrderId > 0) Begin		
		Select @VisitId = VisitId
		From dbo.Ord_PatientPharmacyOrder
		Where Ptn_Pharmacy_Pk = @OrderId;

		Update dbo.Ord_Visit Set
			VisitDate = @DispensedByDate,
			DataQuality = 1,
			UserId = @UserId
		Where Ptn_Pk = @VisitId;

		Update dbo.Ord_PatientPharmacyOrder Set
			DispensedBy = @DispensedBy,
			DispensedByDate = @DispensedByDate,
			StoreId = @StoreId,
			UserId = @UserId,
			UpdateDate = Getdate()
		Where Ptn_Pharmacy_Pk = @OrderId;
		
		If (@Regimen Is Not Null) Begin
			Update dbo.Dtl_RegimenMap Set
				RegimenType = @Regimen
			Where ptn_pk = @Ptn_pk
			And Visit_Pk = @VisitId
			And OrderId = @OrderId;
		End
		--  Delete from Dtl_PatientPharmacyOrder where Ptn_Pharmacy_Pk = @OrderId            
		Select	@VisitId [VisitId],
				@OrderId [Ptn_Pharmacy_Pk];
	End 
	Else Begin
		Insert Into dbo.Ord_Visit (
			Ptn_Pk,
			LocationId,
			VisitDate,
			VisitType,
			DataQuality,
			DeleteFlag,
			UserId,
			CreateDate)
		Values (
			@Ptn_Pk, 
			@LocationId, 
			@DispensedByDate, 
			4, 
			0, 
			0, 
			@UserId, 
			Getdate());
		Select @VisitId = scope_identity();	
		Insert Into dbo.Ord_PatientPharmacyOrder (
			Ptn_Pk,
			VisitId,
			LocationId,
			OrderedBy,
			OrderedByDate,
			DispensedBy,
			DispensedByDate,
			OrderType,
			ProgId,
			StoreId,
			DeleteFlag,
			UserId,
			CreateDate)
		Values (
			@Ptn_Pk, 
			@VisitId, 
			@LocationId, 
			0, 
			Null, 
			@DispensedBy, 
			@DispensedByDate, 
			@OrderType, 
			@ProgramId, 
			@StoreId, 
			0, 
			@UserId, 
			Getdate());
		Select @OrderId = scope_identity();
		Update ord_PatientPharmacyOrder Set
			ReportingID = (Select Right('000000' + Convert(varchar, @OrderId), 6))
		Where ptn_pharmacy_pk = @OrderId;


		If (@Regimen Is Not Null) Begin
			Insert Into dbo.Dtl_RegimenMap (
				Ptn_Pk,
				LocationId,
				Visit_Pk,
				RegimenType,
				OrderId,
				DeleteFlag,
				UserId,
				CreateDate)
			Values (
				@Ptn_Pk, 
				@LocationId, 
				@VisitId, 
				@Regimen, 
				@OrderId, 
				0, 
				@UserId, 
				Getdate());
		End

		Select	@VisitId [VisitId],
				@OrderId [Ptn_Pharmacy_Pk];
	End
End
