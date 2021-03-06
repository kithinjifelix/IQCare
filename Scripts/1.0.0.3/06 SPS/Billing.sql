/****** Object:  StoredProcedure [dbo].[pr_Billing_CancelBill]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_CancelBill]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_CancelBill]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_cashiersTransactionsSummary]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_cashiersTransactionsSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_cashiersTransactionsSummary]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_DaillyCollectionSummaryReport]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_DaillyCollectionSummaryReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_DaillyCollectionSummaryReport]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_DailyCashiersSummaryReport]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_DailyCashiersSummaryReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_DailyCashiersSummaryReport]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetBillDetails]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetBillDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetBillDetails]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_getOpenBills]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_getOpenBills]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_getOpenBills]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPaidLabs]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPaidLabs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetPaidLabs]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DaillyCollectionSummary]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_DaillyCollectionSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_DaillyCollectionSummary]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DailyCashSummary]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_DailyCashSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_DailyCashSummary]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_RefundPayment]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_RefundPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_RefundPayment]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_GetReversalReciept]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_GetReversalReciept]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_GetReversalReciept]
GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_RequestForReversal]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_RequestForReversal]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_RequestForReversal]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetReversals]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billling_GetReversals]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billling_GetReversals]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetReversals]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetReversals]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetReversals]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetBillTransactions]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetBillTransactions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetBillTransactions]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_ApproveRejectReversal]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_ApproveRejectReversal]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_ApproveRejectReversal]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billling_GetReversals]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billling_GetReversals]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billling_GetReversals]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_DailyCollectionsReport]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_DailyCollectionsReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_DailyCollectionsReport]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_DeleteBillItem]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_DeleteBillItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_DeleteBillItem]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GenerateBill]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GenerateBill]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GenerateBill]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetOutstandingBill]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetOutstandingBill]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetOutstandingBill]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPaidDrugs]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPaidDrugs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetPaidDrugs]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetItemPayStatus]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetItemPayStatus]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetItemPayStatus]
GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_PatientConsumablesByDate]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_PatientConsumablesByDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_PatientConsumablesByDate]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPatientDepositSummary]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPatientDepositSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetPatientDepositSummary]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPatientsBilItems]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPatientsBilItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetPatientsBilItems]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_SalesSummaryReport]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_SalesSummaryReport]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_SalesSummaryReport]
GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_UpdateItemsPaid]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_UpdateItemsPaid]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_UpdateItemsPaid]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_UpdateNewItemsPaid]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_UpdateNewItemsPaid]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_UpdateNewItemsPaid]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_OutstandingSalesSummary]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_OutstandingSalesSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_OutstandingSalesSummary]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_SalesSummary]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_SalesSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_SalesSummary]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_RemoveItemFromBill]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_RemoveItemFromBill]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_RemoveItemFromBill]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DailyCollections]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_DailyCollections]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_DailyCollections]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DetailedOutstandingItems]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_DetailedOutstandingItems]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_DetailedOutstandingItems]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_GetDepositTransaction]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_GetDepositTransaction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_GetDepositTransaction]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_SavePriceList]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_SavePriceList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_SavePriceList]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPatientDepositTransactions]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPatientDepositTransactions]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetPatientDepositTransactions]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_ManageDiscountPlans]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_ManageDiscountPlans]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_ManageDiscountPlans]
GO
/****** Object:  StoredProcedure [dbo].[Pr_Billing_ManagePaymentMethods]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Billing_ManagePaymentMethods]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Billing_ManagePaymentMethods]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetItemPriceOnDate]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetItemPriceOnDate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetItemPriceOnDate]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetDiscountPlans]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetDiscountPlans]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetDiscountPlans]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_ExecDepositTransaction]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_ExecDepositTransaction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_ExecDepositTransaction]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPriceList]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPriceList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetPriceList]
GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DepartmentalSummary]    Script Date: 12/16/2015 14:10:57 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_DepartmentalSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_DepartmentalSummary]
GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPriceList]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPriceList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-04-11
-- Description:	get cost/sellingprice associated with each item
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetPriceList]
(
	@ItemTypeID int = Null, 
	@ItemName varchar(50)= Null,
	@WithPriceOnly bit = 0,
	@PageIndex int = 0,
	@Paged bit =0, 
	@PageCount int = 50,
	@PriceDate datetime = null -- to do
)
	
AS
Begin
	Select 
		@ItemName = Nullif(@ItemName,''''), 
		@PriceDate = Isnull(@PriceDate,Convert(datetime,floor(Convert(float,getdate()))));
	

	Select @ItemName = Case When @ItemName Is Null Then Null Else ''%''+Ltrim(Rtrim(@ItemName))+''%'' End;
	Declare @StartIndex int,@LastIndex int,	@RowCount int ;

	Declare @ResultSet Table
	(
		ItemID int, 
		ItemName varchar(250), 
		ItemTypeName varchar(50),
		ItemTypeID int, 
		SellingPrice decimal(18,2),
		PriceDate datetime,
		PharmacyPriceType bit, 
		Active bit,
		VersionStamp bigint,
		RowIndex int
	);
	If (@WithPriceOnly = 0)
	Begin
		Insert Into @ResultSet(
			ItemID,
			ItemName,
			ItemTypeName,
			ItemTypeID,
			SellingPrice,
			PriceDate,
			PharmacyPriceType,
			Active,
			VersionStamp,
			RowIndex
		)
		Select	IL.ItemID,
				IL.ItemName ,
				IL.ItemTypeName,
				IL.ItemTypeID ItemTypeID,
				IL.UnitSellingPrice SellingPrice,
				IL.PriceDate PriceDate,
				IL.PharmacyPriceType,
				~IL.DeleteFlag,
				IL.VersionStamp,
				Row_number() Over( Order By IL.ItemName) RowIndex
		From vw_Master_ItemList IL
		Where (IL.ItemTypeID = @ItemTypeID OR @ItemTypeID Is Null)
		And Case 
				When @ItemName Is Null Or ItemName Like @ItemName Then 1
				Else 0 
			End=1
		And Case 
				When @WithPriceOnly = 1 And IL.PriceDate Is Not Null Then 1 
				When @WithPriceOnly = 0 Then 1 
				Else 0 
			End =1
		And IL.DeleteFlag=0;

		
	End
	Else
	Begin
		
		Insert Into @ResultSet(
			ItemID,
			ItemName,
			ItemTypeName,
			ItemTypeID,
			SellingPrice,
			PriceDate,
			PharmacyPriceType,
			Active,
			VersionStamp,
			RowIndex
		)
		Select	IL.ItemID,
				IL.ItemName ,
				IL.ItemTypeName,
				IL.ItemTypeID ItemTypeID,
				IL.PriceOnDate SellingPrice,
				IL.PriceDate PriceDate,
				IL.PharmacyPriceType,
				Active = 1 ,
				IL.VersionStamp,
				Row_number() Over( Order By IL.ItemName) RowIndex
		From dbo.fn_Billing_PriceList(default,@ItemTypeID,@PriceDate) IL
		Where (IL.ItemTypeID = @ItemTypeID OR @ItemTypeID Is Null)
		And Case 
				When @ItemName Is Null Or ItemName Like @ItemName Then 1
				Else 0 
			End=1
		And PriceIndex = 1 And IL.PriceOnDate > 0.0;
	End
	
	Select @RowCount = count(ItemID) From @ResultSet;
	If (@Paged = 1 And @PageCount < @RowCount)
	Begin
		Select @StartIndex = Case @PageIndex When 0 Then 1 Else 1 + (@PageIndex*@PageCount) - @PageCount End;
		Select @LastIndex = @StartIndex + @PageCount ;
		
		Select 
			ItemID,
			ItemName,
			ItemTypeName,
			ItemTypeID, 
			SellingPrice,
			PriceDate,
			PharmacyPriceType,
			Active,
			VersionStamp
		From @ResultSet Where Active=1 And RowIndex Between @StartIndex And @LastIndex;
		
		Select Pages=ceiling(Cast(@RowCount as decimal)/@PageCount) ;
	 End
	 Else Begin
			Select 
				ItemID,
				ItemName,
				ItemTypeName,
				ItemTypeID, 
				SellingPrice,
				PriceDate,
				PharmacyPriceType,
				Active,
				VersionStamp
		From @ResultSet Where Active=1;
		
		Select Pages=1
	 End

	--Select 
	--	ItemID,
	--	ItemName ,
	--	ItemTypeName,
	--	ItemTypeID,
	--	SellingPrice,
	--	PriceDate,
	--	PharmacyPriceType,
	--	VersionStamp
	--From 
	--(
	--Select	IL.ItemID,
	--		IL.ItemName ,
	--		IL.ItemTypeName,
	--		IL.ItemTypeID ItemTypeID,
	--		IL.UnitSellingPrice SellingPrice,
	--		IL.PriceDate PriceDate,
	--		IL.PharmacyPriceType,
	--		IL.VersionStamp,
	--		Row_number() Over( Order By IL.ItemName) RowIndex
	--From vw_Master_ItemList IL
	--Where IL.ItemTypeID = @ItemTypeID 
	--And Case 
	--		When @ItemName Is Null Or ItemName Like @ItemName Then 1
	--		Else 0 
	--	End=1
	--And Case 
	--		When @WithPriceOnly = 1 And IL.UnitSellingPrice Is Not Null Then 1 
	--		When @WithPriceOnly = 0 Then 1 
	--		Else 0 
	--	End =1
	--And IL.DeleteFlag=0
	----Order By IL.ItemName
	--) Grp Where RowIndex Between @StartRowIndex And @LastIndex;

/*
Select	items.ID,
		items.Name,
		items.BillingTypeID,
		ic.itemSellingPrice [Item Selling Price],
		ic.effectiveDate [Effective Date],
		ic.PharmacyPriceType
From (
	Select	b.ID,
			b.Name,
			0 BillingTypeID,
			b.DeleteFlag
	From mst_Code a
	Inner Join mst_Decode b
		On a.CodeID = b.CodeID
	Where a.CodeID In (Select CodeID From mst_Code Where name = ''billables'' And DeleteFlag = 0) 
	Union 
	Select	vt.VisitTypeID ID,
			vt.VisitName Name,
			(Select Mst_BillingType.BillingTypeID From Mst_BillingType Where Mst_BillingType.Name=''VisitType'')  BillingTypeID,
			vt.DeleteFlag
	From mst_VisitType vt 
	Where vt.DeleteFlag = 0 
	Union 
	Select	LabTestID,
			LabName,
			(Select ItemTypeID From Mst_ItemType Where ItemName=''Lab Tests'') BillTypeID,
			DeleteFlag
	From mst_LabTest
	Where DeleteFlag = 0 
	Union 
	Select	Drug_pk,
			DrugName,
			ItemTypeId BillTypeID,
			DeleteFlag
	From mst_Drug
	Where DeleteFlag = 0 
	Union 
	Select	Item_PK,
			ItemName,
			ItemTypeId BillTypeID,
			DeleteFlag
	From Mst_Consumables
	Where DeleteFlag = 0 --And ItemTypeId = 299
) items
Left Join lnk_itemCostConfiguration ic
	On items.BillingTypeID = ic.itemtype And items.ID = ic.itemid
	And ic.PriceStatus = 1
Where items.BillingTypeID = @BillingTypeID*/
End' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_ExecDepositTransaction]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_ExecDepositTransaction]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 27 Oct 2014
-- Description:	Execute deposit Transaction
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_ExecDepositTransaction] 
	-- Add the parameters for the stored procedure here
	@PatientID int = Null , 
	@UserID int ,
	@LocationID int,
	@Amount decimal(9,2),
	@TransactionType int,
	@AccountID int = Null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare  @StartMonth datetime, @EndMonth datetime, @SettledAmount decimal(18,2), @BillAmount decimal(18,2);
		Select	
			@StartMonth = Dateadd(Month, Datediff(Month, 0, Getdate()), 0),
			@EndMonth = Dateadd(s,-1,dateadd(mm,datediff(m,0,getdate())+1,0));
		
		Declare @Tran_Index Int, @Space Int,@Receipt_Number Varchar(50) ,@ItemCount int;
		Set @Space = 8;
		Select @Tran_Index= Count(TransactionID)+1 From dbo.dtl_BillDepositTransaction Where TransactionDate Between  @StartMonth And @EndMonth;

		Set @Space = @Space - Len(@Tran_Index);

		Select @Receipt_Number = ''DP-''+Replace(Convert(varchar(7),Getdate(),102),''.'','''')+''-'' + Replicate(''0'', @Space)+  Convert(VarChar,@Tran_Index);
    -- Insert statements for procedure here
	Insert Into dbo.dtl_BillDepositTransaction
	(
		ReferenceNumber,
		Ptn_PK,
		AccountID,
		LocationID,
		TransactionDate,
		Amount,
		TransactionDescription,
		DepositType,
		UserID
	)
	Values
	(
		@Receipt_Number,
		@PatientID,
		@AccountID,
		@LocationID,
		Getdate(),
		@Amount,
		Case @TransactionType When 1 Then ''Deposit'' When  2 Then ''Settlement'' When 3 Then ''Refund'' End,
		''Cash'',
		@UserID
	);
	Select   Scope_identity() TransactionID, @Receipt_Number TransactionReference;
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetDiscountPlans]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetDiscountPlans]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 18 May 2015
-- Description:	Get discounts plans 
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetDiscountPlans] 
	-- Add the parameters for the stored procedure here
	@DiscountID int= Null,
	@PaymentTypeID int = Null, 
	@DiscountDate datetime = Null,
	@ShowActiveOnly bit = 1
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
	Set Nocount On;

	Select	D.DiscountID,
			D.DiscountName,
			D.Rate,
			--D.PaymentTypeID,
			--P.PaymentName,
			D.StartDate,
			D.EndDate,
			~D.DeleteFlag Active
	From DTL_PaymentDiscounts D
	--Inner Join
	--	vw_BillPaymentType P On P.ID = D.PaymentTypeID
	Where 
	Case When D.DiscountID = @DiscountID OR @DiscountID Is Null Then 1 Else 0 End = 1
	--And
	--	Case
	--		When @PaymentTypeID Is Null Or @PaymentTypeID = D.PaymentTypeID Then 1
	--		Else 0 End = 1
	And
		Case
			When @DiscountDate Is Null Or @DiscountDate Between D.StartDate And D.EndDate Then 1
			When D.EndDate Is Null And @DiscountDate >= D.StartDate  Then 1
			Else 0 End = 1
	And
		Case
			When @ShowActiveOnly = 1 And D.DeleteFlag = 1 Then 0
			Else 1 End = 1

End


' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetItemPriceOnDate]    Script Date: 09/03/2015 09:04:54 ******/
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetItemPriceOnDate]    Script Date: 01/20/2016 11:15:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 02 Oct 2014
-- Description:	Get Item Selling Price on a given date
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetItemPriceOnDate] 
	-- Add the parameters for the stored procedure here
	@ItemID int , 
	@ItemTypeID int, 
	@BillingDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select Top 1 ItemSellingPrice SellingPrice,
			EffectiveDate,
			statusDate, 
			Isnull(PharmacyPriceType,0) PharmacyPriceType ,
			Convert(bit,CC.PriceStatus) IsCurrentPrice,
			Abs(Datediff(dd,@BillingDate,cc.EffectiveDate))PriceAge,
			CC.VersionStamp,
			CC.CostId PriceId
	From dbo.lnk_ItemCostConfiguration  CC
	Where ItemId=@ItemID  
	And ItemType = @ItemTypeID
	And (DATEADD(dd, 0, DATEDIFF(dd, 0, EffectiveDate)) <=@BillingDate) 
	And DeleteFlag =0
	Order By EffectiveDate Desc, statusDate Desc;
    
END

GO



/****** Object:  StoredProcedure [dbo].[Pr_Billing_ManagePaymentMethods]    Script Date: 09/03/2015 09:04:54 ******/
/****** Object:  StoredProcedure [dbo].[Pr_Billing_ManagePaymentMethods]    Script Date: 12/22/2015 12:30:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: April 01 2015
-- Description:	Manage Payment methods
-- =============================================
CREATE PROCEDURE [dbo].[Pr_Billing_ManagePaymentMethods] 
	-- Add the parameters for the stored procedure here
	@MethodName varchar(50) ,
	@MethodID int = Null,
	--@UserID int, 
	@Active bit = 1,
	@TypeDescription varchar(100)=Null,
	@PluginName varchar(50),
	@Credit bit = 0,
	@Action varchar(10)= 'NEW'
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	If(@MethodID Is Not Null And @Action = 'UPDATE') Begin
	
		If Exists(Select 1 From Mst_BillPaymentType Where TypeName= @MethodName And TypeID <> @MethodID) Begin
			Raiserror ('Duplicate Name found. Try Again.', 16, 1);
			Return(1);
		End
		If (@Active = 0 And Not Exists(Select 1 From ord_bill Where TransactionType = @MethodId)) Begin
			Delete from Mst_BillPaymentType Where TypeID = @MethodId;
			Return(0);
		End
		Update Mst_BillPaymentType Set
			TypeName= @MethodName,
			TypeDescription = @TypeDescription,
			Active = @Active,
			Credit = @Credit,
			PluginName = @PluginName		
		Where TypeID= @MethodID;			
		Return(0);
	End
    If(@MethodID Is  Null And @Action = 'NEW') Begin
	
		If Exists(Select 1 From Mst_BillPaymentType Where  TypeName= @MethodName) Begin
			Raiserror ('Duplicate Name found. Try Again.', 16, 1);
			Return(1);
		End
		Insert Into Mst_BillPaymentType(
			TypeName,			
			Active,
			TypeDescription,
			PluginName,
			Credit,
			Locked
		)
		Values(
			@MethodName,			
			@Active,
			@TypeDescription,
			@PluginName,
			@Credit,
			0
		);
		
		Return(0);
	End
END

GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_ManageDiscountPlans]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_ManageDiscountPlans]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 18 May 2015
-- Description:	Add Update Discount plan
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_ManageDiscountPlans] 
	-- Add the parameters for the stored procedure here
	@DiscountName varchar(100), 
	@Rate decimal(3,2),
	@PaymentTypeID int = null, 
	@StartDate datetime, 
	@EndDate datetime =null, 
	@UserID int, 
	@DeleteFlag bit = 0, 
	@Mode varchar(10) = ''NEW'',
	@DiscountID int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	If (@Mode = ''NEW'') Begin
		
		Insert Into [dbo].[DTL_PaymentDiscounts] (
			[DiscountName],
			[Rate],
			--[PaymentTypeID],
			[StartDate],
			[EndDate],
			[CreatedBy],
			[CreateDate],
			[UserID],
			[UpdateDate],
			[DeleteFlag])
		Values (
			@DiscountName,
			@Rate,
			--@PaymentTypeID,
			@StartDate,
			@EndDate,
			@UserID,
			Getdate(),
			Null,
			Null,
			@DeleteFlag );
	End
	-- Update
	Else If (@Mode = ''UPDATE'') Begin
	
		Update dbo.dtl_PaymentDiscounts Set
			DiscountName = @DiscountName,
			UserID = @UserID,
			EndDate = Case 
						When @EndDate < Getdate() Then EndDate
						Else @EndDate End,
			UpdateDate=Getdate(),
			DeleteFlag=@DeleteFlag
		Where DiscountID = @DiscountID;
		
	End
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPatientDepositTransactions]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPatientDepositTransactions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 27 Oct 2014
-- Description:	Get the deposits transactions for a patient
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetPatientDepositTransactions]
	-- Add the parameters for the stored procedure here
	@PatientID int,
	@LocationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select	D.TransactionID,
		Ptn_PK PatientID,
		TransactionDate,
		D.ReferenceNumber,
		Amount,
		D.TransactionType,
		D.TransactionDescription,
		D.DepositType,
		U.UserLastName +'', ''+ U.UserFirstName ReceivedBy,
		D.UserID	
	From dbo.dtl_BillDepositTransaction D
	Inner Join dbo.mst_User U  On U.UserID = D.UserID
	Where Ptn_PK = @PatientID 
	And LocationID = @LocationID
	Order By TransactionDate Desc;
END

' 
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Billing_GetPaymentMethods]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Billing_GetPaymentMethods]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: April 01 2015
-- Description:	Get Payment methods
-- =============================================
CREATE PROCEDURE [dbo].[Pr_Billing_GetPaymentMethods] 
	@MethodName varchar(50)= Null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
	Set Nocount On;
	Select @MethodName = Nullif(@MethodName, '');
	Select	TypeID
		,	TypeName
		,	TypeDescription
		,	Locked
		,	PluginName
		,	Active
		,	Credit
	From Mst_BillPaymentType
	Where (Active = 1)
		And (Case
			When @MethodName Is Null Or
				TypeName = @MethodName Then 1
			Else 0
		End = 1)
	Order By TypeName
End
GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_SavePriceList]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_SavePriceList]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:  Vincent Yahuma
-- Create date: 2014-Apr-02
-- Description: Procedure for  adding an item from patients bill this procdedure adds record and acts also as the 
-- audit trail for price changes.
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_SavePriceList](
	@itemID int,
	@itemType int,
	@itemSellingPrice decimal(9,2),
	@EffectiveDate datetime=null,
	@PharmacyPriceType int=0,
	@UserID int,
	@VersionStamp bigint=null,
	@Active bit=1
)

AS

BEGIN

	Select @EffectiveDate = Isnull(@EffectiveDate,Getdate());

	If(@Active = 0)
	Begin
		Update lnk_itemCostConfiguration Set 
			DeleteFlag=~@Active ,
			UserID=@UserID,
			statusDate=Getdate(),
			PriceStatus=0
		Where ItemId = @ItemId
		And ItemType = @ItemType
		And VersionStamp=@VersionStamp;		
		Select 1;
		Return;
	End
	If Exists(Select 1 From lnk_ItemCostConfiguration Where ItemId=@ItemID And ItemType=@ItemType
			And DeleteFlag=0  And EffectiveDate = @EffectiveDate
		)
	Begin
		-- This is duplication of different price in day,
		--Raiserror(''Error'',16,1);
		Select 0;
		Return;
	End
	If Not Exists (
		Select	1 From lnk_itemCostConfiguration	
		Where ItemId = @itemID
		And ItemType = @itemType
		And ItemSellingPrice = @itemSellingPrice
		And PriceStatus = 1
		And PharmacyPriceType = @PharmacyPriceType
		And Dateadd(dd, Datediff(dd, 0, EffectiveDate), 0) = @EffectiveDate
	) 
	Begin
	
		Update lnk_itemCostConfiguration Set
			PriceStatus = 0,
			statusDate = Getdate(),
			UserID = @UserID
		Where ItemId = @ItemId
		And ItemType = @ItemType
		And (ItemSellingPrice != @itemSellingPrice
		Or Coalesce(PharmacyPriceType, 0) != Coalesce(@PharmacyPriceType, 0)
		Or Dateadd(dd, Datediff(dd, 0, EffectiveDate), 0) != @EffectiveDate)
		And PriceStatus = 1;
		
		Insert Into lnk_itemCostConfiguration (
			ItemId,
			ItemType,
			ItemSellingPrice,
			EffectiveDate,
			PriceStatus,
			statusDate,
			PharmacyPriceType,
			UserID,
			CreateDate,
			DeleteFlag)
		Values (
			@itemID,
			@itemType,
			@itemSellingPrice,
			@EffectiveDate,
			1,
			Getdate(),
			@PharmacyPriceType,
			@UserID,
			Getdate(),
			0);
		Select 1;
		--Update lnk_itemCostConfiguration Set
		--	PriceStatus = 0,
		--	statusDate = Getdate(),
		--	UserID = @UserID
		--Where ItemId = @ItemId
		--And ItemType = @ItemType
		--And (ItemSellingPrice != @itemSellingPrice
		--Or Coalesce(PharmacyPriceType, 0) != Coalesce(@PharmacyPriceType, 0)
		--Or Dateadd(dd, Datediff(dd, 0, EffectiveDate), 0) != @EffectiveDate)
		--And PriceStatus = 1 ;

	End
	Select 0;
End


' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_GetDepositTransaction]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_GetDepositTransaction]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-May-16
-- Description:	Query to get Reciept
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_Report_GetDepositTransaction](@TransactionID int,@locationID int,@password varchar(50))
	-- Add the parameters for the stored procedure here

AS
BEGIN

Declare @SymKey varchar(400)
Set @SymKey = ''Open symmetric key Key_CTC decryption by password='' + @password + ''''
Exec (@SymKey)


---Items

	Select	T.TransactionID ID,	
		Convert(varchar, T.TransactionDate, 112) BillItemDate,		
		DepositType + '' ''+ T.TransactionDescription Item,		
		1 Quantity,
		Amount SellingPrice,
		Amount,
		UR.UserFirstName,
		UR.UserLastName,
		UR.UserID
	From dbo.dtl_BillDepositTransaction T
	Inner Join 
		dbo.mst_User As UR	On UR.UserID = T.UserID	
	Where T.TransactionId= @TransactionID And T.LocationID=@LocationID;
--Transaction Summary
	Select	P.PatientFacilityID As PatientID,
			Convert(varchar(50), Decryptbykey(P.LastName)) As LastName,
			Convert(varchar(50), Decryptbykey(P.FirstName)) As FirstName,
			(Select Name
				From dbo.mst_Decode As dc
				Where (P.Sex = ID))
			As Sex,
			FacilityName,
			Nullif(ltrim(rtrim(FacilityTel)),'''') FacilityTel,
			F.FacilityCell,
			F.FacilityFax,
			FacilityAddress,
			FacilityEmail,
			FacilityFooter,
			FacilityURL,		
			FacilityLogo,
			Currency,
			T.ReferenceNumber BillNumber,
			T.TransactionDate BillDate,
			T.Amount BillAmount,
			T.ReferenceNumber TransactionID,	
			T.Amount,	
			T.Amount TenderedAmount,	
			T.TransactionDate,
			T.DepositType TransactionType ,
			'''' RefNumber,			
			U.UserLastName ,
			UserFirstName,
			T.userID
	From dbo.mst_Patient P 
	Inner Join 
		dbo.dtl_BillDepositTransaction As T	On P.Ptn_Pk = T.Ptn_PK
	Inner Join
		dbo.mst_Facility F On F.FacilityID = T.LocationID
	Inner Join dbo.mst_User U On U.UserID =T.userID	
	Where T.TransactionID=@TransactionID 
	And F.FacilityID=@LocationID;

	Close symmetric key Key_CTC

END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DetailedOutstandingItems]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_DetailedOutstandingItems]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:        <Author,,Vincent Yahuma>
-- Create date: <2014/03/27,,>
-- Description:   <Gets all open bills or gets the bill based on the specified filter that is passed,,>
-- =============================================
Create PROCEDURE [dbo].[pr_Billing_Report_DetailedOutstandingItems]
( 
      @LocationID as int,
      @password as varchar(50),     
      @ToDate datetime = null,
      @fromDate dateTime = Null

)

AS
BEGIN
Declare @SymKey varchar(400), @StartDate datetime, @EndDate datetime;   
Set @SymKey = ''Open symmetric key Key_CTC decryption by password='' + @password + ''''
Exec (@SymKey)


Select	@StartDate = Dateadd(Second, 0, Dateadd(Day, Datediff(Day, 0, @fromDate), 0)),
		@EndDate = Dateadd(Second, -1, Dateadd(Day, Datediff(Day, 0, @toDate) + 1, 0));
	Select	
		ItemGroup,
		ItemCode,
		billItemdate,
		ItemName,
		PatientName,
		T1.PatientFacilityID,
		Sum(Quantity) Quantity,
		SellingPrice,
		Sum( Case When T1.Invoiced = 1  Then SaleValue Else 0 End) InvoicedAmount,
		Sum(  SaleValue ) SaleValue
From (	
		Select	Case 
			When it.ItemName = ''VisitType'' Then Coalesce(md.ModuleName, db.itemName)
			When it.ItemName = ''Consumables'' Then md.ModuleName
			When db.CostCenter =''X-Ray'' Then ''Imaging''
			Else it.ItemName End ItemGroup,
		P.PatientFacilityID,
		Case P.Sex When 16 Then ''Male'' When 17 Then ''Female'' End Sex,
		dbo.fn_GetPatientAge(P.Ptn_Pk) AgeYears,
		Convert(varchar(50), Decryptbykey(P.firstname)) +'' ''+ Isnull(Convert(varchar(50), Decryptbykey(P.MiddleName)),'''') + '' ''+Convert(varchar(50), Decryptbykey(P.LastName)) PatientName,
		Cast(db.ItemType As varchar) + ''-'' + Cast(db.ItemId As varchar) ItemCode,
		Dateadd(dd, 0, Datediff(dd, 0, db.BillItemDate)) billItemdate,
		Convert(bit, Case	When db.BillID Is Null Then 0	Else 1 End) Invoiced,
		db.ItemName,
		db.Quantity,
		db.SellingPrice - Isnull(db.Discount, 0.0) SellingPrice,
		(db.Quantity * (db.SellingPrice - Isnull(db.Discount, 0.0))) SaleValue
From dtl_bill db
Inner Join
	Mst_ItemType IT On it.ItemTypeID = db.ItemType
Inner Join
	mst_Patient P On P.Ptn_Pk = DB.Ptn_PK
Left Join
	mst_module md On md.ModuleID = db.ModuleID
Where 
DB.DeleteFlag = 0
And db.PaymentStatus = 0
And Db.Ptn_PK > 0
And Convert(datetime, Floor(Convert(float, db.BillItemDate)))
Between Cast(@fromDate As datetime) And Cast(@toDate As datetime)
) T1
Group By	ItemGroup,
			ItemCode,
			billItemdate,
			ItemName,
			SellingPrice,
			T1.PatientFacilityID,
			T1.PatientName
Order By ItemGroup, ItemCode;

Close symmetric key Key_CTC


Select	FacilityName Name,
		FacilityLogo logo,
		'''' motto,
		FacilityAddress,
		FacilityTel,
		FacilityCell,
		FacilityFax,
		FacilityEmail,
		FacilityURL,
		FacilityFooter,
		FacilityTemplate
From dbo.mst_Facility
Where FacilityID = @locationID;

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DailyCollections]    Script Date: 09/03/2015 09:04:54 ******/


/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DailyCollections]    Script Date: 5/12/2016 5:00:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-June-06
-- Description:	summary for populating departmental daily collections report
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_Report_DailyCollections]
(
	@fromDate datetime,
	@toDate datetime,
	@locationID int 
)

AS
Begin
	declare @LabTypeID int, @PharmacyTypeID int, @ConsumableTypeID int;
	Declare @StartDate datetime, @EndDate datetime;

	Select @StartDate = dateadd(second, 0, dateadd(day, datediff(day, 0, @fromDate), 0)) ,
		@EndDate = dateadd(second, -1, dateadd(day, datediff(day, 0, @toDate)+1, 0)) ;

	Select @LabTypeID = BillingTypeID
	From dbo.Mst_BillingType
	Where Name = 'Lab Tests';

	Select @PharmacyTypeID = BillingTypeID
	From dbo.Mst_BillingType
	Where Name = 'Pharmaceuticals';

	Select @ConsumableTypeID = BillingTypeID
	From dbo.Mst_BillingType
	Where Name = 'Consumables';

	Select	[date],
			Department,
			category,
			Sum(billamount) billamount,
			Sum(waivedamount) waivedamount,
			Sum(exemptamount) exemptamount,
			Sum(collectedamount) collectedamount
	From (Select	Convert(varchar, ob.TransactionDate, 102) [date],
					Case
						When db.ItemType = @LabTypeID  Then 	Case When CostCenter= 'X-Ray' Then 'Imaging'	Else 'Laboratory' End
						When db.ItemType = @PharmacyTypeID Then 'Pharmacy'
						When vt.VisitTypeID In (0, 12) Then 'Outpatient'
						--When md.ModuleName Is Null Then vt.VisitName
						When SUBSTRING(VisitName, CHARINDEX('-', VisitName) - 1, LEN(VisitName))  =  ' - Enrollment' Then SUBSTRING(VisitName, 1, CHARINDEX('-', VisitName) - 1)
						Else md.ModuleName End Department,
					db.ItemName category,
					(db.Quantity * db.SellingPrice) billamount,
					0 waivedamount,
					0 exemptamount,
					(db.Quantity * (db.SellingPrice - Isnull(db.Discount,0.0))) collectedamount
		From dbo.dtl_Bill db
		Inner Join	ord_bill ob On db.BillID = ob.BillID
		--Left Join dbo.mst_Decode dc2
		--	On dc2.ID = db.ItemId
		--Left Join dbo.mst_LabTest LT
		--	On LT.LabTestID = db.ItemId
		Left Join	dbo.mst_VisitType vt On vt.VisitTypeID = db.ItemId
		Left Join	dbo.mst_Feature ft On ft.FeatureName = vt.VisitName			And ft.DeleteFlag = 0
		Left Join	dbo.mst_module md On (md.ModuleID = ft.ModuleId		Or md.ModuleID = db.ModuleID)
		Where ob.TransactionDate Between @StartDate And @EndDate
		And db.PaymentStatus = 1
		And ob.TransactionStatus = 'PAID'
		And db.Ptn_PK > 0
		And db.DeleteFlag = 0) T1
	Group By	[date],
				Department,
				category;


Select	FacilityName name,
		FacilityLogo logo,
		'' motto,
		FacilityAddress [address],
		FacilityTel tel,
		FacilityCell cell,
		FacilityFax fax,
		FacilityEmail email,
		FacilityURL url,
		FacilityFooter footer,
		FacilityTemplate template
From dbo.mst_Facility
Where FacilityID = @locationID;
END





GO



GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_RemoveItemFromBill]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_RemoveItemFromBill]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 25 July 2014
-- Description:	Remove an item from a bill or when no transactiona have been made on that bill
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_RemoveItemFromBill] 
	-- Add the parameters for the stored procedure here
	@BillItemID int , 
	@BillID int , 
	@UserID int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
	If Exists (Select 1	From dbo.ord_bill	Where BillID = @BillID)
		Return(1);
		
	Begin Transaction R
	Begin Try
		Update dbo.dtl_Bill Set
			BillID = Null,
			UserID = @UserID,
			UpdateDate = Getdate()
		Where billItemID = @BillItemID And BillID = @BillID And DeleteFlag = 0;
		declare @newAmount decimal(18,2);
		
		Select @newAmount = Sum(D.Quantity * (D.SellingPrice - Isnull(D.Discount, 0)))
		From dbo.dtl_Bill D
		Where D.BillID = @BillID;
		
		Update dbo.mst_Bill Set BillAmount = @newAmount Where BillID = @BillID;
		
		IF @@TRANCOUNT > 0
				Commit Transaction R;
				
	End Try
	Begin Catch
	Declare @ErrorMessage NVARCHAR(4000),@ErrorSeverity Int,@ErrorState Int;

Select	@ErrorMessage = Error_message(),
		@ErrorSeverity = Error_severity(),
		@ErrorState = Error_state();

		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState  );

		IF @@TRANCOUNT > 0
		Rollback Transaction Bill;
	End Catch;
	
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_SalesSummary]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_SalesSummary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-Nov-6
-- Description:	Sales summary report
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_Report_SalesSummary] (@fromDate datetime,@toDate datetime,@locationID int )

AS
BEGIN

Declare @StartDate datetime, @EndDate datetime;

Select	@StartDate = Dateadd(Second, 0, Dateadd(Day, Datediff(Day, 0, @fromDate), 0)),
		@EndDate = Dateadd(Second, -1, Dateadd(Day, Datediff(Day, 0, @toDate) + 1, 0));
declare @LabTypeID int, @CostCenter varchar(50);
	Select @LabTypeID = BillingTypeID	From dbo.Mst_BillingType	Where Name = ''Lab Tests'';
	
Select	ItemGroup,
		ItemCode,
		billItemdate,
		ItemName,
		Sum(Quantity) Quantity,
		SellingPrice,
		Sum(SaleValue) SaleValue
From (Select	 Case When db.ItemType = @LabTypeID  And db.CostCenter = ''X-Ray'' Then ''Imaging''
					When it.ItemName =''Visit Type'' Then Coalesce(md.ModuleName, db.itemName)
					When it.ItemName = ''Consumables'' Then md.ModuleName
					Else it.ItemName End ItemGroup,
				md.ModuleName,
				--it.ItemName itemTypeName,
				Cast(db.ItemType As varchar) + ''-'' + Cast(db.ItemId As varchar) ItemCode,
				Dateadd(dd, 0, Datediff(dd, 0, db.BillItemDate)) billItemdate,
				db.ItemName,
				db.Quantity,								
				db.SellingPrice - Isnull(db.Discount, 0.0) SellingPrice,
				(db.Quantity * (db.SellingPrice - Isnull(db.Discount, 0.0))) SaleValue
	From dtl_bill db
	Inner Join
		Mst_ItemType IT On it.ItemTypeID = db.ItemType
	Left Join
		mst_module md On md.ModuleID = db.ModuleID
	Where db.BillItemDate Between @StartDate And @EndDate
	And db.LocationID = @LocationID
	And DB.DeleteFlag = 0 
	And  DB.Ptn_PK > 0
	--And db.PaymentStatus = 1
	) T1
Group By	ItemGroup,
			ItemCode,
			billItemdate,
			ItemName,
			SellingPrice
Order By ItemGroup, ItemCode




Select	FacilityName Name,
		FacilityLogo logo,
		'''' motto,
		FacilityAddress,
		FacilityTel,
		FacilityCell,
		FacilityFax,
		FacilityEmail,
		FacilityURL,
		FacilityFooter,
		FacilityTemplate
From dbo.mst_Facility
Where FacilityID = @locationID;
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_OutstandingSalesSummary]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_OutstandingSalesSummary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-Nov-6
-- Description:	Sales summary report
-- =============================================
Create PROCEDURE [dbo].[pr_Billing_Report_OutstandingSalesSummary] (@fromDate datetime,@toDate datetime,@locationID int )

AS
BEGIN

Declare @StartDate datetime, @EndDate datetime;

Select	@StartDate = Dateadd(Second, 0, Dateadd(Day, Datediff(Day, 0, @fromDate), 0)),
		@EndDate = Dateadd(Second, -1, Dateadd(Day, Datediff(Day, 0, @toDate) + 1, 0));

Select	ItemGroup,
		ItemCode,
		billItemdate,
		ItemName,
		Sum(Quantity) Quantity,
		SellingPrice,
		Sum(SaleValue) SaleValue
From (Select	Case 
					When it.ItemName = ''Visit Type'' Then Coalesce(md.ModuleName, db.itemName)
					When it.ItemName = ''Consumables'' Then md.ModuleName
					When db.CostCenter=''X-Ray'' Then ''Imaging''
					Else it.ItemName End ItemGroup,
				md.ModuleName,
				--it.ItemName itemTypeName,
				Cast(db.ItemType As varchar) + ''-'' + Cast(db.ItemId As varchar) ItemCode,
				Dateadd(dd, 0, Datediff(dd, 0, db.BillItemDate)) billItemdate,
				db.ItemName,
				db.Quantity,								
				db.SellingPrice - Isnull(db.Discount, 0.0) SellingPrice,
				(db.Quantity * (db.SellingPrice - Isnull(db.Discount, 0.0))) SaleValue
	From dtl_bill db
	Inner Join
		Mst_ItemType IT On it.ItemTypeID = db.ItemType
	Left Join
		mst_module md On md.ModuleID = db.ModuleID
	Where db.BillItemDate Between @StartDate And @EndDate
	And db.LocationID = @LocationID
	And DB.DeleteFlag = 0 
	And db.PaymentStatus = 0
	And DB.Ptn_PK > 0
	) T1
Group By	ItemGroup,
			ItemCode,
			billItemdate,
			ItemName,
			SellingPrice
Order By ItemGroup, ItemCode




Select	FacilityName Name,
		FacilityLogo logo,
		'''' motto,
		FacilityAddress,
		FacilityTel,
		FacilityCell,
		FacilityFax,
		FacilityEmail,
		FacilityURL,
		FacilityFooter,
		FacilityTemplate
From dbo.mst_Facility
Where FacilityID = @locationID;
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_UpdateNewItemsPaid]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_UpdateNewItemsPaid]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-May-5
-- Description:	Procedure for  marking a new  item as paid using the BillID and item ID plus payment Status in patient bill as paid
CREATE PROCEDURE [dbo].[pr_Billing_UpdateNewItemsPaid](@billID int,@itemID int, @itemType int,@TransactionId int, @UserID int)

AS

BEGIN

UPDATE [dbo].[dtl_Bill]
   SET [PaymentStatus] = 1
      ,[TransactionId] = @TransactionId
      ,[UserID] = @userID
      ,[UpdateDate] = GETDATE()
 WHERE itemID=@itemID and billID=@billID and itemType=@itemType and PaymentStatus=0

   if ((Select count(billitemID) from dtl_Bill where billID=@BillID and paymentStatus=0 and deleteflag=0)=0 )
 BEGIN
  update mst_Bill set BillStatus=2,UpdateDate=getDate() where BillID=@BillID
  END
END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_UpdateItemsPaid]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_UpdateItemsPaid]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-Apr-30
-- Description:	Procedure for  marking an item in patient bill as paid
CREATE PROCEDURE [dbo].[pr_Billing_UpdateItemsPaid](@billItemID int,@TransactionId int,@UserID int)

AS

BEGIN

UPDATE [dbo].[dtl_Bill]
   SET [PaymentStatus] = 1
      ,[TransactionId]=@TransactionId
      ,[UserID] = @userID
      ,[UpdateDate] = GETDATE()
 WHERE billitemID=@billItemID

  if ((Select count(billitemID) from dtl_Bill where billID=(Select billID from dtl_Bill   WHERE billitemID=@billItemID) and paymentStatus=0 and deleteflag=0)=0 )
 BEGIN
  update mst_Bill set BillStatus=2, updateDate=getDate() where BillID=(Select billID from dtl_Bill   WHERE billitemID=@billItemID)
 END
 
END

' 
END
GO
 /****** Object:  StoredProcedure [dbo].[pr_Billing_SaveBillItem]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_SaveBillItem]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_SaveBillItem]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-Apr-02
-- Description:	Procedure for  adding an item from patients bill 
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_SaveBillItem](
@BillID int = Null,
@PatientID int,
@ModuleID int = 0,
@LocationID int = Null,
@billItemID int = Null, 
@billItemDate dateTime, 
@PaymentType int = Null,
@PaymentStatus int = 0,
@ItemId int,
@ItemName varchar(250),
@ItemType int,
@Quantity int,
@SellingPrice decimal(9,2) = 0, 
@Discount decimal(18,2) = 0,
@UserID int,
@serviceStatus int = 0,
@ItemSourceReferenceID int = null,
@CostCenter varchar(50) = Null)
--VY added serviceStatus for showing whether the service has been rendered or consumable issued 2014-Jun-12
AS

BEGIN
	If(@PatientId = 0 Or @PatientId Is Null) Return (-1);

	If(@ModuleID = 0  Or @ModuleID Is Null)Begin
		Select Top 1 @ModuleID= ft.ModuleId From mst_Feature ft Where ft.FeatureName=@ItemName
	End

	If Not Exists(Select 1 From lnk_FacilityModule F Inner Join Mst_module M On M.ModuleId = F.ModuleID
	Where M.ModuleName='Billing' And F.FacilityID = @LocationId) Begin
		Return (-1);
	End
	declare @LabTypeID int;
	Select @LabTypeID = BillingTypeID	From dbo.Mst_BillingType	Where Name = 'Lab Tests';

	If(@BillItemID Is Null) Begin -- Insert

		If(@SellingPrice Is Null Or @SellingPrice =0.0) Return(-1);	
	
		Select @LocationID = Isnull(@LocationID,LocationID) From mst_Patient Where Ptn_Pk = @PatientId;
		If(@LabTypeID = @ItemType) Begin
			Select Top 1  @CostCenter= LD.LabDepartmentName 
			From mst_LabDepartment LD 
			Inner Join mst_LabTestMaster LT On LT.DepartmentId = LD.LabDepartmentID Where LT.Id = @ItemId;
		End
		Else If(@CostCenter Is Null) Begin
			Select @CostCenter = Name From dbo.Mst_BillingType Where BillingTypeID = @ItemType
		End
		Insert Into dbo.dtl_Bill (
				Ptn_PK
			,	BillItemDate
			,	PaymentType
			,	ItemId
			,	ItemName
			,	ItemType
			,	Quantity
			,	SellingPrice
			,	Discount
			,	PaymentStatus
			,	ServiceStatus
			,	DeleteFlag
			,	CreatedBy
			,	CreateDate
			,	ModuleID
			,	ItemSourceReferenceID
			,	LocationID
			,	CostCenter)
		Values (
				@PatientID
			,	@billItemDate
			,	Null
			,	@ItemID
			,	@ItemName
			,	@ItemTYpe
			,	@Quantity
			,	@SellingPrice
			,	@Discount
			,	@PaymentStatus
			,	@ServiceStatus
			,	0
			,	@UserID
			,	getdate()
			,	@ModuleID
			,	@ItemSourceReferenceID
			,	@LocationID
			,	@CostCenter);
		Select @BillItemId = scope_identity();
	End
	Else Begin
		Update dbo.dtl_Bill Set
				BillItemDate = @billItemDate
			,	Quantity = @Quantity
			,	PaymentStatus = @PaymentStatus
			,	ServiceStatus = @serviceStatus
			,	UserID = @UserID
			,	UpdateDate = getdate()
			,	ItemSourceReferenceID = Isnull(ItemSourceReferenceID, @ItemSourceReferenceID)
		Where billItemID = @billItemID;	

	End
	Return @BillItemId;

END

GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPatientsBilItems]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPatientsBilItems]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 2014-07-23
-- Description:	Get bill items for a patient.
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetPatientsBilItems](
@LocationID int = Null,
@PatientID int = Null,
@BillID int = Null
)
	
AS
Begin
If(@BillID Is Null And @PatientID Is Null)
Begin
	Raiserror(''Invalid Request::'',16,1);
	Return(1);
End
Select @LocationID = nullif(@LocationID,'''');
Select	D.BillID,
		D.billItemID,
		D.Ptn_PK As PatientID,
		D.LocationID,
		D.BillItemDate,
		D.ItemName,
		D.ItemId,
		D.ItemType,
		D.Quantity,
		D.PaymentType,
		Null PaymentName,
		D.SellingPrice,
		D.Discount,
		D.SellingPrice * D.Quantity As Amount,
		D.PaymentStatus,
		Cast(1 As bit) As PayItem,
		D.ServiceStatus,
		D.ModuleId,
		Case 
			When M.ModuleName Is Null And IT.ItemName =''Pharmaceuticals'' Then ''Pharmacy''
			When M.ModuleName Is Null And IT.ItemName =''Ward Admission'' Then ''Inpatient''
			When M.ModuleName Is Null And IT.ItemName =''Lab Tests'' Then ''Laboratory''
			Else M.ModuleName
		End As CostCenterName,
		IT.ItemName ItemTypeName,
		D.ItemSourceReferenceID
From dbo.dtl_Bill As D
Inner Join
	Mst_ItemType IT On IT.ItemTypeID = D.ItemType
Left Outer Join	
	dbo.mst_module M On D.ModuleID = M.ModuleID 
Where 
Case 
	When @BillID Is Null And (D.Ptn_PK = @PatientId And D.BillID Is Null) Then 1 
	When @PatientID Is Null And  D.BillID = @BillID Then 1 Else 0 End = 1
--(D.Ptn_PK = @PatientID Or @PatientID Is Null) 
And (D.DeleteFlag = 0) 
And (D.BillID = @BillID Or BillID Is Null)
And (@LocationID Is Null OR D.LocationID=@LocationID)
Order By D.BillItemDate;

END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPatientDepositSummary]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPatientDepositSummary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 27 Oct 2014
-- Description:	Get the deposits transactions for a patient
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetPatientDepositSummary]
	-- Add the parameters for the stored procedure here
	@PatientID int ,
	@LocationID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select	Top 1
		Ptn_PK PatientID,
		LocationID,
		TransactionDate DepositDate,
		Amount,
		dbo.fn_Billing_PatientAvailableDeposit(@PatientID, @LocationID) AvailableAmount	,
		U.UserLastName +'', ''+ U.UserFirstName ReceivedBy	
	From dbo.dtl_BillDepositTransaction D
	Inner Join dbo.mst_User U  On U.UserID = D.UserID
	Where Ptn_PK = @PatientID 
	And D.PatientDeposit=1
	And LocationID = @LocationID
	And TransactionType=''Credit''
	Order By TransactionDate Desc;
	END

' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_PatientConsumablesByDate]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_PatientConsumablesByDate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 16 June 2014
-- Description:	Get Patients consumables for the date
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_PatientConsumablesByDate] 
	-- Add the parameters for the stored procedure here
	@Ptn_PK int , 
	@IssueDate datetime 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select	billItemID BillID,
		D.billItemID,
		D.ptn_pk As PatientID,
		D.BillItemDate IssueDate,
		I.ItemName,
		I.Item_PK,
		D.ItemType,
		D.Quantity,
		D.SellingPrice UnitSellingPrice,
		D.SellingPrice * D.Quantity As Amount,	
		1 as ServiceStatus,
		D.CreateDate,
		D.CreatedBy,
		U.UserFirstName +'', ''+U.UserLastName As IssuedBy
	
	From --dbo.mst_Bill As B
	--Inner Join 
	dbo.dtl_Bill As D
		--On D.BillID = B.BillID
	Inner Join dbo.Mst_ItemMaster As I
		On I.Item_PK = D.ItemId
	Inner Join
		dbo.mst_User U On U.UserID = D.CreatedBy
	Where (D.ptn_pk = @Ptn_PK) And (D.BillItemDate = @IssueDate) And (D.DeleteFlag = 0);
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetReciept]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetReciept]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetReciept]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetReciept]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2015-May-16
-- Description:	Query to get Reciept
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetReciept]
(
	@ReceiptNumber varchar(50),
	@password varchar(50)=null
)
AS BEGIN


	Select	Id,
			Ptn_PK,
			ReceiptDate,
			ReceiptType,
			ReceiptNumber,
			TransactionId,
			ReceiptData,--convert(xml, convert(varchar(max), decryptbykey(ReceiptData))) ReceiptData,
			PrintCount
	From dtl_BillingReceipt Where ReceiptNumber=@ReceiptNumber;

	

END



GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetItemPayStatus]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetItemPayStatus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-04-11
-- Description:	get whether the item has been paid for and service not been rendered
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetItemPayStatus](@patientID int,@itemID int,@itemTypeName varchar)
	
AS
BEGIN
Declare @totalpaid int,@itemType int

if(@itemID>1000)--then its a custom form so search using featureID
Select Top 1 @itemID = visittypeid
From mst_VisitType
Where FeatureId = @itemID

Select Top 1 @itemType = BillingTypeID
From Mst_BillingType
Where Name = @itemTypeName;
If Exists(Select 1 From dbo.lnk_ItemCostConfiguration Where ItemId=@ItemID And ItemType = @itemType And PriceStatus = 1 And DeleteFlag = 0)
Begin
	Select Count(db.billItemID) totalPaid
	From dtl_Bill db
	Where db.PaymentStatus = 1
	And db.ServiceStatus = 0
	And db.ptn_pk = @patientID
	And db.ItemId = @itemID
	And db.ItemType = @itemType
End
Else
 Select -1 totalPaid;
 
--Select * 
--From dbo.dtl_Bill B 
--Where B.TransactionId Is Not Null
--And B.PaymentStatus = 1 
--And B.ServiceStatus = 0
--And B.ptn_pk = @patientID
--And B.ItemId = @itemID
--And B.ItemType = @itemType	;
	
--Set @totalpaid = (Select Count(db.billItemID) totalPaid
--	From dtl_Bill db
--	Where db.PaymentStatus = 1
--	And db.ServiceStatus = 0
--	And db.ptn_pk = @patientID
--	And db.ItemId = @itemID
--	And db.ItemType = @itemType)

--If @totalpaid > 0 Select 1 Else Select 0
End
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetInvoice]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetInvoice]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetInvoice]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetInvoice]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-May-16
-- Description:	Procedure to get Invoice Information
--Edited by VY 2014-Aug-21
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetInvoice](
	@BillID int,
	@locationID int,
	@patientID int,
	@password varchar(50)=null
)	
AS
BEGIN

--Get patient information
Select	P.PatientFacilityID  ID,
		Convert(varchar(50), Decryptbykey(p.lastName)) [lastname],
		Convert(varchar(50), Decryptbykey(p.firstname)) [FirstName],
		(Select name From mst_Decode dc			Where p.Sex = dc.ID)Sex
From mst_Patient p
Where p.Ptn_Pk = @patientID
 


--Get Facility Information
Select	FacilityName,
		FacilityTel,
		FacilityAddress,
		FacilityEmail,
		FacilityFooter,
		FacilityURL,
		FacilityLogo,
		Currency
From mst_Facility
Where FacilityID = @locationID;

--Get invoice information 
Select	mb.BillNumber,
		mb.BillDate,
		mb.ptn_pk,
		mb.BillAmount,
		db.BillItemDate,
		db.ItemName,
		db.Quantity,
		db.SellingPrice,
		(db.Quantity * db.SellingPrice) Amount
From mst_bill mb
Inner Join
	dtl_bill db On mb.BillID = db.BillID
Where mb.BillID = @BillID
And mb.LocationID = @LocationID;

--get amount paid
Select Isnull(Sum(AmountPayable), 0) AmountPaid
From dbo.ord_bill
Where Reversed = 0
And BillID = @BillID;
	   
END	   

GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPaidDrugs]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPaidDrugs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'



-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-06-13
-- Description:	get all Drugs that have been paid for and not yet dispensed
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetPaidDrugs](@patientID int)
	
AS
BEGIN

	declare  @PharmacyTypeID int;


Select @PharmacyTypeID = BillingTypeID
From Mst_BillingType
Where Name = ''Pharmaceuticals''

Select	db.ItemName DrugName,
		db.Quantity
From dtl_Bill db
--Join ord_bill ob
--	On ob.BillID = db.BillID
Where db.PaymentStatus = 1 
And ServiceStatus = 0 
And db.ItemType = @PharmacyTypeID 
And db.DeleteFlag = 0
And db.BillID Is Not Null
And db.ptn_pk = @patientID
END




' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetOutstandingBill]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetOutstandingBill]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 19-Apr-2015
-- Description:	Gets all outstanding payments for the patient
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetOutstandingBill](@patientID as int)
AS
BEGIN
	select   convert(varchar, BillItemDate, 106) BillDate,ItemName [Description],Quantity,SellingPrice Price, (Quantity*SellingPrice)Amount from dtl_bill where PaymentStatus=0 and ptn_pk=@patientID
order by ItemType,BillItemDate,ItemName
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GenerateBill]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GenerateBill]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 23/07/2014
-- Description:	Generate A bill/Invoice
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GenerateBill] 
	-- Add the parameters for the stored procedure here
	@ItemsList xml , 
	@PatientID int,
	@LocationID int,
	@BillAmount decimal(18,2),
	@UserID int 
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
	Set Nocount On;
	Begin Transaction Bill
	Begin Try
		declare  @StartMonth datetime, @EndMonth datetime,@BillID int;
		Select	@StartMonth = Dateadd(Month, Datediff(Month, 0, Getdate()), 0),
				@EndMonth = Dateadd(Month, 1, Getdate() - Day(Getdate()));
					
		Declare @Bill_Index Int, @Space Int,@Bill_Number Varchar(50);
		--, @LocationID int;
		Set @Space = 5;
		Select @Bill_Index = Count(BillID) + 1
		From dbo.mst_Bill
		Where BillDate Between @StartMonth And @EndMonth;

		Set @Space = @Space - Len(@Bill_Index);

		Select @Bill_Number = +''INV-'' + Replace(Convert(varchar(7), Getdate(), 102), ''.'', '''') + ''-'' + Replicate(''0'', @Space) + Convert(varchar, @Bill_Index);
		
		--Select @LocationID = LocationID From dbo.mst_Patient Where Ptn_Pk = @PatientID

		Insert Into dbo.mst_Bill (
			ptn_pk,
			LocationID,
			BillStatus,
			BillDate,
			BillAmount,
			BillNumber,
			CreatedBy,
			CreateDate)
		Values (
			@PatientID,
			@LocationID,
			1, -- Open, unpaid
			Getdate(),
			@BillAmount,
			@Bill_Number,
			@UserID,
			Getdate());
			
		Select @BillID = Scope_identity();

		Update B Set
			BillID = @BillID
		From dbo.dtl_Bill B
		Inner Join (Select T.N.value(''billitemid[1]'', ''int'') BillItemID
				From @ItemsList.nodes(''/root/parameter'') As T (N)) I On I.BillItemID = B.billItemID;
		Select @Bill_Number Bill_Number;
			
		IF @@TRANCOUNT > 0
			Commit Transaction Bill;
			
	End Try
	Begin Catch

		Declare @ErrorMessage NVARCHAR(4000),@ErrorSeverity Int,@ErrorState Int;

		Select	@ErrorMessage = Error_message(),@ErrorSeverity = Error_severity(),@ErrorState = Error_state();

		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState  );

		IF @@TRANCOUNT > 0
		Rollback Transaction Bill;
	End Catch;		
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_DeleteBillItem]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_DeleteBillItem]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-Apr-02
-- Description:	Procedure for  dleleting an item from patients bill 
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_DeleteBillItem](@billItemID int, @UserID int)

AS
BEGIN
Update dbo.dtl_Bill Set
	DeleteFlag = 1,
	UserID = @userID,
	UpdateDate = Getdate()
Where billItemID = @billItemID And ServiceStatus = 0;
END

' 
END
GO

/****** Object:  StoredProcedure [dbo].[pr_Billling_GetReversals]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billling_GetReversals]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 23 Jun 2014
-- Description:	Get Bills in the reversal list
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billling_GetReversals] 
	-- Add the parameters for the stored procedure here
	@Reference varchar(50) = Null, 
	@ApprovalStatus int = Null -- null, all 0 pending, 1 approved, 2 = Rejected
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select @Reference = Nullif(ltrim(rtrim(@Reference)),'''')
	If  @Reference Is Not Null
		Select @Reference = ''%''+@Reference+''%''

	Select
		R.TransactionReversalID,
		R.TransactionID,
		O.Ptn_PK PatientID,		
		O.BillID,
		B.BillNumber,
		R.RequestDate,
		O.ReceiptNumber,
		R.ReversalReference,
		O.AmountPayable TransactionAmount,
		B.BillAmount ,
		R.ReversalReason,
		ApprovalStatus=Case R.ApprovalStatus When 0 Then ''Pending'' When 1 Then ''Approved'' When 2 Then ''Rejected'' End,
		U.UserLastName + '', ''+ U.UserFirstName As RequestedBy,
		R.ApprovalDate,
		R.ApprovalNotes,
		A.UserLastName + '', ''+ A.UserFirstName As ApprovedBy
	From dbo.ord_Bill_Reversals R
	Inner Join 
		dbo.ord_bill O On O.TransactionID = R.TransactionID
	Inner Join
		dbo.mst_Bill B On B.BillID = O.BillID
	Inner Join
		dbo.mst_User U On U.UserID = R.UserID
		Left Outer Join
		dbo.mst_User A On A.UserID = R.ApprovedBy
	Where 
		Case When @Reference  Is Null Or O.ReceiptNumber Like @Reference  Then 1
			Else 0 End = 1
		 And (ApprovalStatus= @ApprovalStatus Or @ApprovalStatus Is Null);
		
  
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_ApproveRejectReversal]    Script Date: 09/03/2015 09:04:54 ******/
/****** Object:  StoredProcedure [dbo].[pr_Billing_ApproveRejectReversal]    Script Date: 12/10/2015 21:36:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 23 Jun 2014
-- Description:	Approve Reject reversal Request
-- =============================================
Create PROCEDURE [dbo].[pr_Billing_ApproveRejectReversal] 
	@ReversalID int , 
	@TransactionID int , 
	@ApprovedBy int ,
	@ApprovedStatus varchar(50),
	@ApprovalReason varchar(250),
	@ApprovalDate datetime,
	@RefundCash bit = 0
AS
Begin
	Set Nocount On;
	Begin Transaction Approve
	Begin Try		
		Declare @Space int,@ReversalReference varchar(50);
		Set @Space = 8;
		Set @Space = @Space - Len(@ReversalID);
		Select @ReversalReference = 'RV'+Replace(Convert(varchar(7), Getdate(), 102), '.', '') + '-' + Replicate('0', @Space) + Convert(varchar, @ReversalID);
		Update dbo.ord_Bill_Reversals Set
			ApprovalNotes = @ApprovalReason,
			ApprovalStatus =
				Case @ApprovedStatus
					When 'Pending' Then 0
					When 'APPROVED' Then 1
					When 'REJECTED' Then 2 End,
			ApprovedBy = @ApprovedBy,
			ApprovalDate = Getdate(), --@ApprovalDate,
			ReversalReference = @ReversalReference,
			Refunded =
				Case
					When @ApprovedStatus = 'Approved' Then @RefundCash
					Else 0 End,
			RefundDate =
				Case
					When @ApprovedStatus = 'Approved' And @RefundCash = 0 Then Null
					Else Getdate() End,
			RefundBy =
				Case
					When @ApprovedStatus = 'Approved' And @RefundCash = 0 Then Null
					Else @Approvedby End,
		RefundType =
				Case
					When @ApprovedStatus = 'Approved' And @RefundCash = 1 Then 'Cash' 
					Else Null End
		Where TransactionReversalID = @ReversalID;
		
		If(@ApprovedStatus = 'APPROVED')
		Begin

			Update dbo.ord_bill Set
				TransactionStatus = 'REVERSED',
				Reversed = 1
			Where TransactionID = @TransactionID;
			
			declare @BillID int,@SettledAmount decimal(18,2), @BillAmount decimal(18,2),@DiscountedAmount decimal(18,2);

			Select @BillID = BillID
			From ord_bill
			Where TransactionID = @TransactionID;
			
			If(@RefundCash =1)
			Begin
				Select 
					@SettledAmount = Sum(B.Amount),
					@DiscountedAmount = Sum(B.Amount) - Sum(B.AmountPayable)
				From dbo.vw_Billing_BillTransaction B Where BillID=@BillID And Refunded = 0;
				Update B Set
					BillStatus = 1,
					SettledAmount= Isnull(@SettledAmount,0.00),
					Discount = Isnull(@DiscountedAmount,0.00)
				From dbo.mst_Bill B
				Inner Join
					dbo.ord_bill O On O.BillID = B.BillID
				And O.TransactionID = @TransactionID;
			End		
									
			If Exists (Select 1	From dbo.dtl_Bill	Where TransactionId = @TransactionID)
			Begin
				Update dbo.dtl_Bill Set
					PaymentStatus = 0,
					TransactionId = Null
				Where TransactionId = @TransactionID;
			End
			Else
			Begin
				Update dbo.dtl_Bill Set
					PaymentStatus = 0,
					TransactionId = Null
				Where BillID = @BillID;
			End	
			
		End
		Select  @ReversalReference TransactionReference, @ReversalID TransactionID;
		IF (@@TRANCOUNT > 0)	Commit Transaction Approve;

	End Try
	Begin Catch

		Declare @ErrorMessage NVARCHAR(4000),@ErrorSeverity Int,@ErrorState Int;
		Select	@ErrorMessage = Error_message(),
			@ErrorSeverity = Error_severity(),
			@ErrorState = Error_state();  
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState  );	
		IF (@@TRANCOUNT > 0)		Rollback Transaction Approve;

	End Catch;
END

GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetBillTransactions]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetBillTransactions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 25 July 2014
-- Description:	Get transactions for a bill
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetBillTransactions]
	-- Add the parameters for the stored procedure here
	@BillID int = Null, 
	@TransactionType int = Null,
	@TransactionID int = Null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

		Select	T.TransactionID,
				T.Ptn_PK PatientID,
				T.BillID,
				T.TransactionDate,
				T.RefNumber,
				T.Amount TotalAmount,
				T.AmountPayable,
				U.UserLastName + '', '' + U.UserFirstName As CreatedBy,
				U.UserLastName,
				UserFirstName,
				T.userID,
				T.ReceiptNumber,
				T.TransactionStatus,
				T.TransactionType,
				PT.PaymentName TransactionTypeName,
				Convert(bit,Case  When TransactionStatus In(''Paid'') Then 1  Else 0 End) Reversible,
				Convert(bit,Case  When PT.PaymentName In(''Cash'',''Deposit'') Then 1  Else 0 End) Refundable
		From dbo.ord_bill T
		Inner Join
			dbo.mst_User U On U.UserID = T.userID
		Inner Join
			dbo.vw_BillPaymentType PT On PT.ID = T.TransactionType
		Left Outer Join
			dbo.ord_Bill_Reversals R On R.TransactionID = T.TransactionID
		Where (T.BillID = @BillID
		Or @BillID Is Null)
		And (T.TransactionID = @TransactionID
		Or @TransactionID Is Null)
		And (T.TransactionType = @TransactionType
		Or @TransactionType Is Null)
		Order By T.TransactionID Desc;
  
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetReversals]    Script Date: 09/03/2015 09:04:54 ******/
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetReversals]    Script Date: 12/10/2015 21:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 23 Jun 2014
-- Description:	Get Bills in the reversal list
-- =============================================
Create PROCEDURE [dbo].[pr_Billing_GetReversals] 
	@LocationID int,
	@Reference varchar(50) = Null, 
	@ApprovalStatus int = Null, -- null, all 0 pending, 1 approved, 2 = Rejected,
	@PatientID int = Null
AS
BEGIN
	SET NOCOUNT ON;
	Select @Reference = Nullif(ltrim(rtrim(@Reference)),'')
	If  (@Reference Is Not Null) Select @Reference = '%'+@Reference+'%'

	Select
		R.TransactionReversalID,
		R.TransactionID,
		O.Ptn_PK PatientID,		
		O.BillID,
		B.BillNumber,
		R.RequestDate,
		O.ReceiptNumber,
		R.ReversalReference,
		O.AmountPayable TransactionAmount,
		B.BillAmount ,
		R.ReversalReason,
		ApprovalStatus=Case R.ApprovalStatus When 0 Then 'Pending' When 1 Then 'Approved' When 2 Then 'Rejected' End,
		U.UserLastName + ', '+ U.UserFirstName As RequestedBy,
		R.ApprovalDate,
		R.ApprovalNotes,
		A.UserLastName + ', '+ A.UserFirstName As ApprovedBy,
		R.Refunded,
		R.RefundDate,
		R.RefundType,
		C.UserLastName + ', '+ C.UserFirstName As CashRefundBy,
		Refundable = Convert(bit,Case When PT.TypeName In('Cash','Deposit') Then 1 Else 0 End),
		PT.TypeName As PaymentName
	From dbo.ord_Bill_Reversals R
	Inner Join 
		dbo.ord_bill O On O.TransactionID = R.TransactionID	
	Inner Join Mst_BillPaymentType PT On PT.TypeID = O.TransactionType
	Inner Join
		dbo.mst_Bill B On B.BillID = O.BillID
	Inner Join
		dbo.mst_User U On U.UserID = R.UserID
	Left Outer Join
		dbo.mst_User A On A.UserID = R.ApprovedBy
	Left Outer Join
		dbo.mst_User C On C.UserID = R.RefundBy
	Where 
		B.LocationID=@LocationID
	And	Case When @Reference  Is Null Or O.ReceiptNumber Like @Reference  Then 1
			Else 0 End = 1
	And (ApprovalStatus= @ApprovalStatus Or @ApprovalStatus Is Null)
	And (O.ptn_pk = @PatientID Or @PatientID Is Null);
END

GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_RequestForReversal]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_RequestForReversal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 23 Jun 2014
-- Description:	Request for Reversal
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_RequestForReversal] 
	-- Add the parameters for the stored procedure here
	@TransactionID int , 
	@UserID int ,
	@ReversalReason varchar(250),
	@RequestDate datetime,
	@ItemsList xml = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

    -- Insert statements for procedure here
	Begin Transaction RequestReversal
	Begin Try
	
		declare @ReversalID int;

	Insert Into dbo.ord_Bill_Reversals (
		Ptn_PK,
		TransactionID,
		RequestDate,
		UserID,
		ReversalReason,
		ApprovalStatus)
	Select	B.Ptn_PK,
			B.TransactionID,
			--@RequestDate,
			Getdate(),
			@UserId,
			@ReversalReason,
			0
	From dbo.ord_bill B
	Where B.TransactionID = @TransactionID;

	Select @ReversalID = Scope_identity();
	
	Update dbo.ord_bill Set TransactionStatus = ''Pending Reversal'' Where  TransactionID = @TransactionID;

	--Insert Into dbo.dtl_BillItem_Reversal (
	--	BillItemID,
	--	ReversalID)
	--Select	T.N.value(''billitemid[1]'', ''int''),
	--		@ReversalID
	--From @ItemsList.nodes(''/root/parameter'') As T (N);
		
		
	IF @@TRANCOUNT > 0
	Commit Transaction RequestReversal;
	End Try
	Begin Catch

	 Declare @ErrorMessage NVARCHAR(4000),@ErrorSeverity Int,@ErrorState Int;

	  Select	@ErrorMessage = Error_message(),@ErrorSeverity = Error_severity(),@ErrorState = Error_state();

  
    Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState  );

	IF @@TRANCOUNT > 0
	Rollback Transaction RequestReversal;
	End Catch;
END
' 
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_SaveBillPayment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_SaveBillPayment]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-Apr-30
-- Description:	Procedure for  adding payment transaction for a patients bill 
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_SaveBillPayment]
(
	@BillId int,
	@TransactionType int,
	@RefNumber varchar(100),
	@Amount decimal (18,2),
	@TenderedAmount decimal (18,2),
	@UserId int,
	@PatientId int,
	@AmountPayable decimal(18,2),
	@DiscountRate decimal(3,2)= 0.00,
	@BillStatus varchar(50) ='Paid',
	@ItemsList xml = Null,
	@Narrative varchar(50)= Null
)


AS

BEGIN


	Begin Transaction Pay
	Begin Try
	
		declare @TransactionId int, @StartMonth datetime, @EndMonth datetime, @SettledAmount decimal(18,2), @BillAmount decimal(18,2),@DiscountedAmount decimal(18,2),
		@TransactionSettled bit;;
		Select	
			@StartMonth = Dateadd(Month, Datediff(Month, 0, Getdate()), 0),
			@EndMonth = DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0));--Dateadd(Month, 1, Getdate() - Day(Getdate()));
		
		Declare @Bill_Index Int, @Space Int,@Receipt_Number Varchar(50) ,@ItemCount int;
		Set @Space = 8;
		Select @Bill_Index= Count(TransactionID)+1 From dbo.ord_bill Where TransactionDate Between  @StartMonth And @EndMonth;

		Set @Space = @Space - Len(@Bill_Index);

		Select @Receipt_Number = Replace(Convert(varchar(7),Getdate(),102),'.','')+'-' + Replicate('0', @Space)+  Convert(VarChar,@Bill_Index); 
		Select @TransactionSettled = ~Credit From Mst_BillPaymentType Where TypeID = @TransactionType
		Insert Into ord_bill (
				BillID
			,	Ptn_PK
			,	TransactionDate
			,	TransactionType
			,	RefNumber
			,	Amount
			,	AmountPayable
			,	TenderedAmount
			,	userID
			,	TransactionStatus
			,	ReceiptNumber
			,	Narrative
			,	Settled
			,	AmountSettled)
		Values (
				@BillId
			,	@PatientID
			,	getdate()
			,	@TransactionType
			,	nullif(@RefNumber, '')
			,	@Amount
			,	@AmountPayable
			,	@TenderedAmount
			,	@UserID
			,	@BillStatus
			,	@Receipt_Number
			,	@Narrative
			,	@TransactionSettled
			,	Case When @TransactionSettled = 1 Then @AmountPayable Else 0.0 End);

			Select @TransactionId =  Scope_identity();
			Select @BillAmount = B.BillAmount From dbo.mst_bill B Where BillID=@BillID ;
		
			--If(@ItemsList Is Null)
			If(@BillAmount > @Amount)
			Begin
				Update B Set				
					PaymentStatus = 1
				From dbo.dtl_Bill B where	B.BillID = @BillID;
			End
			Else
			Begin
				Update B Set
					TransactionId = Isnull(B.TransactionId,@TransactionID),
					PaymentStatus = 1,
					Discount = @DiscountRate * B.SellingPrice
				From dbo.dtl_Bill B
					Inner Join	(Select	T.N.value('billitemid[1]', 'int') BillItemID,
						@TransactionID TransactionID
				From @ItemsList.nodes('/root/parameter') As T (N) ) Paid
				On Paid.BillItemID = B.billItemID;	
			End
				 			
				Select 
					@SettledAmount = Sum(B.Amount),
					@DiscountedAmount = Sum(B.Amount) - Sum(B.AmountPayable)
				From dbo.vw_Billing_BillTransaction B Where BillID=@BillID And Refunded = 0;
				--Group By B.BillID;
									
				Select 
					@BillAmount = B.BillAmount From dbo.mst_bill B Where BillID=@BillID ;
					
				If(@BillAmount < @SettledAmount)
				Begin
					Raiserror('Unknown error occurred :: This bill is fully paid for. You cannot overpay a bill', 16, 1);
					Return(1);
				End
				Update mst_Bill Set 
					BillStatus = Case When @SettledAmount = @BillAmount Then 2 Else BillStatus End ,
					SettledAmount = @SettledAmount,
					Discount=@DiscountedAmount
				Where BillID=@BillID;
									
				Select @TransactionID TransactionID, @Receipt_Number TransactionReference;
		
			IF @@TRANCOUNT > 0	 Commit Transaction Pay;
		End Try
		Begin Catch		  
			Declare @ErrorMessage NVARCHAR(4000),@ErrorSeverity Int,@ErrorState Int;  
			Select	@ErrorMessage = Error_message(),@ErrorSeverity = Error_severity(),@ErrorState = Error_state();	  
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState  );

			IF @@TRANCOUNT > 0	Rollback Transaction Pay;
		End Catch;

 
END
		
GO
	 
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_GetReversalReciept]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_GetReversalReciept]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 2014-May-16
-- Description:	Query to get Reciept for reversals
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_Report_GetReversalReciept](
	@TransactionID int,
	@locationID int,
	@password varchar(50)
)
	-- Add the parameters for the stored procedure here

AS
BEGIN

Declare @SymKey varchar(400)
Set @SymKey = ''Open symmetric key Key_CTC decryption by password='' + @password + ''''
Exec (@SymKey)


---Items
Select TransactionID ID,
			Convert(varchar, T.RefundDate, 112) BillItemDate,
			''Payment Refund'' Item,
			1 Quantity,
			T.Amount SellingPrice,
			T.AmountPayable Amount,
			UR.UserFirstName,
			UR.UserLastName,
			UR.UserID
	From dbo.vw_Billing_BillTransaction T 
	Inner Join 
		dbo.mst_User As UR	On UR.UserID = T.RefundBy	
	Where T.TransactionID=@TransactionID And T.Refunded = 1;

--Transaction Summary

Select	Coalesce(P.PatientEnrollmentID, P.PatientClinicID,P.IQNumber) As PatientID,
		Convert(varchar(50), Decryptbykey(P.LastName)) As LastName,
		Convert(varchar(50), Decryptbykey(P.FirstName)) As FirstName,
		(Select Name
			From dbo.mst_Decode As dc
			Where (P.Sex = ID))
		As Sex,
		FacilityName,
		Nullif(ltrim(rtrim(FacilityTel)),'''') FacilityTel,
		F.FacilityCell,
		F.FacilityFax,
		FacilityAddress,
		FacilityEmail,
		FacilityFooter,
		FacilityURL,		
		FacilityLogo,
		Currency,
		T.BillNumber,
		T.BillDate,
		T.BillAmount,
		T.ReversalReference TransactionID,	
		T.AmountPayable Amount,		
		T.TenderedAmount,
		T.RefundDate TransactionDate,
		--PT.PaymentName 
		''Cash'' TransactionType ,
		T.ReceiptNumber RefNumber,			
		U.UserLastName ,
		UserFirstName,
		T.RefundBy userID,
		0 TenderedAmount
From dbo.mst_Patient P 
Inner Join
	dbo.vw_Billing_BillTransaction T On T.Ptn_PK = P.Ptn_Pk
Inner Join
	dbo.mst_Facility F On F.FacilityID = T.LocationID
Inner Join 
	dbo.mst_User U On U.UserID =T.RefundBy	
--Inner Join 
--	dbo.vw_BillPaymentType PT On PT.ID = T.TransactionType
Where T.TransactionID=@TransactionID 
And Refunded =1;

Close symmetric key Key_CTC
	
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_RefundPayment]    Script Date: 09/03/2015 09:04:54 ******/
/****** Object:  StoredProcedure [dbo].[pr_Billing_RefundPayment]    Script Date: 12/10/2015 18:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 30 Sep 2014
-- Description:	Refund after reversal approval
-- =============================================
Create PROCEDURE [dbo].[pr_Billing_RefundPayment]
	@ReversalId int , 	
	@RefundedBy int
AS
BEGIN
	SET NOCOUNT ON;
	Begin Transaction Refund
	Begin Try
		-- Insert statements for procedure here
		Declare @RowCount int;
    
		Update dbo.ord_Bill_Reversals Set
			Refunded = 1,
			RefundType = 'Cash',
			RefundBy = @RefundedBy,
			RefundDate = Getdate()
		Where TransactionReversalID = @ReversalID 
		And ApprovalStatus = 1 
		And Refunded = 0;
	
		Select @RowCount = @@rowcount;
	
	If(@RowCount = 1) 
	Begin		
		
		declare @BillID int,@SettledAmount decimal(18,2), @BillAmount decimal(18,2),@DiscountedAmount decimal(18,2),@TransactionID int,@ReversalReference varchar(50);
		
		Select 
			@BillID=B.BillID, 
			@TransactionID = B.TransactionId ,
			@ReversalReference =[ReversalReference] 
		From dbo.vw_Billing_BillTransaction B Where B.TransactionReversalID=@ReversalID;

		Select 
					@SettledAmount = Sum(B.Amount),
					@DiscountedAmount = Sum(B.Amount) - Sum(B.AmountPayable)
				From dbo.vw_Billing_BillTransaction B Where BillID=@BillID And Refunded = 0;
		Update B Set
			BillStatus = 1,
			SettledAmount= Isnull(@SettledAmount,0.00),
			Discount =Isnull(@DiscountedAmount,0.0)
		From dbo.mst_Bill B
		Inner Join
			dbo.ord_bill O On O.BillID = B.BillID
		And O.TransactionID = @TransactionID;		
	End
	Select  @ReversalReference TransactionReference, @ReversalID TransactionID;

	IF (@@TRANCOUNT > 0)	Commit Transaction Refund;

	End Try
	Begin Catch

		Declare @ErrorMessage NVARCHAR(4000),@ErrorSeverity Int,@ErrorState Int;
		Select	@ErrorMessage = Error_message(),
		@ErrorSeverity = Error_severity(),
		@ErrorState = Error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState  );
		IF (@@TRANCOUNT > 0) Rollback Transaction Refund;
	End Catch;
END
Go
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DailyCashSummary]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_DailyCashSummary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'

-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 07 07 2015
-- Description:	Daily cash summary: Analysis the daily cash flow for a cashier
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_Report_DailyCashSummary] 
	-- Add the parameters for the stored procedure here
	@FromDate datetime,
	@ToDate datetime,
	@LocationID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Declare @StartDate datetime, @EndDate datetime;

	Select @StartDate = dateadd(second, 0, dateadd(day, datediff(day, 0, @FromDate), 0)) ,
		@EndDate = dateadd(second, -1, dateadd(day, datediff(day, 0, @ToDate)+1, 0)) ;
    -- Insert statements for procedure here
	;With CashTran As (
		Select	Convert(varchar(10), TransactionDate, 126) TRDate,
				CashierUserID,
				Sum(Isnull([Cash Payment], 0)) [CashPayment],
				Sum(Isnull([Cash Refund], 0)) [CashRefund],
				Sum(Isnull([Cash Deposit], 0)) [CashDeposit],
				Sum(Isnull([Deposit Refund], 0)) [DepositRefund]
		From vw_Billing_CashTransactions
		Pivot (
			Sum(Amount)
			For TransactionDescription In (
				[Cash Payment],
				[Cash Refund],
				[Cash Deposit],
				[Deposit Refund]
			)
	) As PayPerType

	Group By	Convert(varchar(10), TransactionDate, 126),
				CashierUserID
				)
	Select	T.TRDate [Date],
			us.UserFirstName + '' '' + us.UserLastName FullNames,	
			us.UserID,	
			T.[CashPayment] CashReceipt,
			T.[CashRefund] CashRefund,
			T.[CashDeposit] Deposit,
			T.[DepositRefund] DepositRefund,
			T.[CashPayment] + T.[CashDeposit] -T.[CashRefund] - T.[DepositRefund] DailyNet
	From CashTran T
	Inner Join
		dbo.mst_User us On us.UserID = T.CashierUserID 
	Where TrDate Between @StartDate And @EndDate
	Order by 1;
	
	Select	FacilityName Name ,
		FacilityLogo logo ,
		'''' motto,
		FacilityAddress,
		FacilityTel ,
		FacilityCell ,
		FacilityFax ,
		FacilityEmail ,
		FacilityURL ,
		FacilityFooter ,
		FacilityTemplate 
	From dbo.mst_Facility
	Where FacilityID = @locationID;
END


' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DailyCashiersSummary]    Script Date: 09/03/2015 09:04:54 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_DailyCashiersSummary]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_Report_DailyCashiersSummary]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-June-05
-- Description:	Cashiers summary for populating cashiers daily cash summary report
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_Report_DailyCashiersSummary] (
	@fromDate datetime,
	@toDate datetime,
	@locationID int 
)

AS
BEGIN

	Declare @StartDate datetime, @EndDate datetime;

	Select @StartDate = dateadd(second, 0, dateadd(day, datediff(day, 0, @fromDate), 0)) ,
		@EndDate = dateadd(second, -1, dateadd(day, datediff(day, 0, @toDate)+1, 0)) ;
		
	Select	Convert(varchar, [date], 106) [date],
			fullnames,
			UserID,
			InvoiceAmount,			
			Sum(isnull(totalAmount,0)) totalAmount,
			Sum(isnull(recieptAmount,0)) receiptAmount,
			Sum(isnull(chequeAmount,0)) chequeAmount,
			Sum(isnull(nhifAmount,0)) nhifAmount,
			Sum(isnull(waivedAmount,0)) waivedAmount,
			Sum(isnull(exemptdAmount,0)) exemptdAmount,
			Sum(isnull(refundedAmount,0)) refundedAmount,
			'' [Status],
			'' Shift			
	From (Select	ob.TransactionDate [date],
					us.UserFirstName+ ' ' + us.UserLastName fullnames,
					us.UserID,
					0 InvoiceAmount,
					Case When ob.PaymentName  ='Cash' Then ob.AmountPayable  Else 0 End recieptAmount,--Not In ('NHIF', 'Waiver', 'Exempt') Then ob.Amount End recieptAmount,
					ob.AmountPayable totalAmount,
					Case When ob.PaymentName = 'NHIF' Then ob.AmountPayable Else 0 End nhifAmount,
					Case When ob.PaymentName  = 'Waiver' Then ob.AmountPayable Else 0 End waivedAmount,
					Case When ob.PaymentName  = 'Exempt' Then ob.AmountPayable Else 0 End exemptdAmount,
					Case When ob.PaymentName  = 'Cheque' Then ob.AmountPayable Else 0 End chequeAmount,
					0 refundedAmount,
					ob.PaymentName Name
		From dbo.vw_Billing_BillTransaction ob
		Inner Join mst_Bill B On B.BillID = ob.BillID
		Inner Join dbo.mst_User us
			On us.UserID = ob.TransactedBy	
		Where   B.LocationID=@LocationID --ob.reversed = 0 
		And ob.TransactionDate Between @StartDate And @EndDate
		Union All
		Select TransactionDate,
				us.UserFirstName + ' ' + us.UserLastName fullnames,
				us.UserID,
				0 InvoiceAmount,
				Amount  recieptAmount,
				Amount  totalAmount,
				0 nhifAmount,
				0 waivedAmount,
				0 exemptdAmount,
				0 chequeAmount,
				0 refundedAmount,
				'Cash' Name
		 From dtl_BillDepositTransaction DT Inner Join dbo.mst_User us
			On us.UserID = DT.UserID 
		Where TransactionDate Between @StartDate And @EndDate 
		And LocationID =@LocationID And DT.TransactionDescription ='Deposit' 	And DT.Ptn_Pk > 0
		Union All
		Select TransactionDate,
				us.UserFirstName + ' ' + us.UserLastName fullnames,
				us.UserID,
				0 InvoiceAmount,
				0 recieptAmount,
				0 totalAmount,
				0 nhifAmount,
				0 waivedAmount,
				0 exemptdAmount,
				0 chequeAmount,
				 Amount refundedAmount,
				'Cash' Name
		 From dtl_BillDepositTransaction DT Inner Join dbo.mst_User us
			On us.UserID = DT.UserID 
		Where TransactionDate Between @StartDate And @EndDate  
		And LocationID =@LocationID And DT.TransactionDescription = 'Refund' 	And DT.Ptn_Pk > 0
		Union All
		Select	ob.RefundDate [date],
					us.UserFirstName + ' ' + us.UserLastName fullnames,
					us.UserID,
					0 InvoiceAmount,
					0 recieptAmount,--Not In ('NHIF', 'Waiver', 'Exempt') Then ob.Amount End recieptAmount,
					0 totalAmount,
					0 nhifAmount,
					0 waivedAmount,
					0 exemptdAmount,
					0 chequeAmount,
					Case When ob.PaymentName  ='Cash' Then ob.AmountPayable  Else 0 End  refundedAmount,
					ob.PaymentName  Name
		From dbo.vw_Billing_BillTransaction ob
		Inner Join mst_Bill B On B.BillID = ob.BillID
		Inner Join dbo.mst_User us
			On us.UserID = ob.RefundBy		
		Where  ob.Refunded = 1
		And ob.PaymentName  ='Cash'
		And B.LocationID=@LocationID --ob.reversed = 0 
		And ob.RefundDate Between @StartDate And @EndDate
		
		) T1
	Group By	Convert(varchar, [date], 106),
				fullnames,
				UserID,
				InvoiceAmount;

	Select	FacilityName name,
			FacilityLogo logo,
			'' motto,
			FacilityAddress [address],
			FacilityTel tel,
			FacilityCell cell,
			FacilityFax fax,
			FacilityEmail email,
			FacilityURL url,
			FacilityFooter footer,
			FacilityTemplate template
	From mst_Facility
	Where FacilityID = @locationID;
END


GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DaillyCollectionSummary]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_Report_DaillyCollectionSummary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-May-29
-- Description:	Collection summary for populating collection summary report
-- =============================================
Create PROCEDURE [dbo].[pr_Billing_Report_DaillyCollectionSummary] (@fromDate datetime,@toDate datetime,@locationID int )

AS
BEGIN

Declare @StartDate datetime, @EndDate datetime;

Select @StartDate = dateadd(second, 0, dateadd(day, datediff(day, 0, @fromDate), 0)) ,
	@EndDate = dateadd(second, -1, dateadd(day, datediff(day, 0, @toDate)+1, 0)) ;
/*
Select	Convert(varchar(10), ob.TransactionDate, 126)  collectiondate,--ob.TransactionDate
		us.UserFirstName + '' '' + us.UserLastName collectedby,
		'''' confirmedby,
		ob.AmountPayable paidamount,
		(Select name
			From mst_Decode dc
			Where dc.ID = ob.TransactionType)
		paymethod,
		'''' confirmationdate,
		ob.TransactionID remitanceref,
		'''' nhifnumber
From dbo.vw_Billing_BillTransaction ob
Inner Join
	dbo.mst_User us On us.UserID = ob.TransactedBy
Inner Join
	mst_Bill B On B.BillID = ob.BillID
Where ob.TransactionDate Between @StartDate And @EndDate
And ob.Refunded = 0
And B.LocationID = @LocationID;*/

With TR As(Select	Convert(varchar(10), ob.TransactionDate, 126)  collectiondate,
		us.UserFirstName + '' '' + us.UserLastName collectedby,		
		(ob.AmountPayable) paidamount,
		ob.PaymentName		paymethod
		
From dbo.vw_Billing_BillTransaction ob
Inner Join
	dbo.mst_User us On us.UserID = ob.TransactedBy
Inner Join
	mst_Bill B On B.BillID = ob.BillID
Where ob.TransactionDate Between @StartDate And @EndDate
And B.LocationID = @LocationID
)
Select CollectionDate,
		CollectedBy,
		Sum(PaidAmount) PaidAmount,
		PayMethod
From TR
Group by CollectionDate, CollectedBy, Paymethod;

Select	FacilityName name,
		FacilityLogo logo,
		'''' motto,
		FacilityAddress [address],
		FacilityTel tel,
		FacilityCell cell,
		FacilityFax fax,
		FacilityEmail email,
		FacilityURL url,
		FacilityFooter footer,
		FacilityTemplate template
From dbo.mst_Facility
Where FacilityID = @locationID;
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetPaidLabs]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetPaidLabs]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'


-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 2014-06-11
-- Description:	get all labs that have been paid for
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetPaidLabs](@patientID int)
	
AS
BEGIN
	declare @LabTypeID int;

Select @LabTypeID = BillingTypeID
From dbo.Mst_BillingType
Where Name = ''Lab Tests''


Select Distinct lt.LabName

From dtl_Bill db
--Join ord_bill ob
--	On ob.TransactionID = db.TransactionId
Join mst_LabTest lt
	On lt.LabTestID = db.ItemId
Join dtl_PatientLabResults lr
	On lr.LabTestID = lt.LabTestID
Where db.PaymentStatus = 1 And ServiceStatus = 0 And db.ItemType = @LabTypeID

-- and convert(varchar, ob.TransactionDate, 106)=convert(varchar, GETDATE(), 106)
And db.ptn_pk = @patientID And db.DeleteFlag = 0
And db.BillID Is Not Null
END



' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_getOpenBills]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_getOpenBills]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
-- =============================================
-- Author:        <Author,,Vincent Yahuma>
-- Create date: <2014/03/27,,>
-- Description:   <Gets all open bills or gets the bill based on the specified filter that is passed,,>
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_getOpenBills]
( 
      @LocationID as int,
      @password as varchar(50),
      @filter as varchar(250) = Null,
      --@PatientID int =null,
      --@PaymentStatus int= Null,
      @DateFrom datetime = null,
      @DateTo dateTime = Null

)

AS
BEGIN
Declare @SymKey varchar(400), @StartDate datetime, @EndDate datetime;   
Set @SymKey = ''Open symmetric key Key_CTC decryption by password='' + @password + ''''
Exec (@SymKey)



If(@DateFrom Is Not Null And @DateTo Is Not Null)
Begin
Select @DateFrom = Convert(datetime,floor(Convert(float,@DateFrom))) ,
            @DateTo =   dateadd(second, -1,dateadd(day,1,Convert(datetime,floor(Convert(float,@DateTo)))));
            --@DateTo =  dateadd(second, -1,Convert(datetime,Ceiling(Convert(float,@DateTo))));
End

;With Bill As (
Select
      TR.Ptn_PK,
      Sum(TR.BillAmount) BillAmount,
      Sum(TR.OutStandingAmount) OutStandingAmount,
      Sum(TR.Discount) Discount,
      Min(TR.BillDate) BillDate
From
(     --Get unbilled items
      Select      B.ptn_Pk,
                  Sum(B.SellingPrice * B.Quantity) BillAmount,
                  Sum(B.SellingPrice * B.Quantity) OutStandingAmount,
                  Sum(Discount) Discount,
                  Min(B.BillItemDate) BillDate -- Convert(varchar, Min(B.BillItemDate), 106) BillDate
      From dbo.dtl_Bill B
      Where (B.BillID Is Null)
      And B.DeleteFlag = 0
      And
            Case
                  When @DateFrom Is Not Null And @DateTo Is Not Null And B.BillItemDate Between @DateFrom And @DateTo Then 1
                  When @DateFrom Is  Null Or @DateTo Is Null Then 1
                  Else 0 End = 1
      Group By B.Ptn_PK
      Union All
      -- Get unsettled bills
            Select      B.ptn_pk PatientID,
                  Sum(B.BillAmount) BillAmount,
                  Sum((B.BillAmount - Isnull(B.SettledAmount, 0))) OutStandingAmount,
                  Sum(Isnull(B.Discount, 0)) Discount,
                  Min(B.BillDate) BillDate --Convert(varchar,Min(B.BillDate),106) BillDate
      From dbo.mst_Bill B
      --Left Outer Join (
      --      Select      T.BillID,
      --                  Sum(Isnull(T.Amount, 0)) SettledAmount,
      --                  Sum(Isnull(T.AmountPayable, 0)) ReceivedAmount,
      --                  Sum(Isnull(T.Amount, 0)) - Sum(Isnull(T.AmountPayable, 0)) Discount
      --      From dbo.vw_Billing_BillTransaction T
      --      Where Refunded = 0
      --      Group By T.BillID
      --) T On T.BillID = B.BillID
      Where B.BillStatus = 1
      And B.DeleteFlag = 0
      And Case
                  When @DateFrom Is Not Null And @DateTo Is Not Null And B.BillDate Between @DateFrom And @DateTo Then 1
                  When @DateFrom Is  Null Or @DateTo Is Null Then 1
                  Else 0 End = 1
      Group By B.Ptn_PK) TR Group by TR.Ptn_PK
      )
Select B.ptn_Pk PatientID,
            P.PatientFacilityID ID,
            Convert(varchar(50), Decryptbykey(P.LastName)) [LastName],
            Convert(varchar(50), Decryptbykey(P.FirstName)) [FirstName],
            P.DOB,
            BillAmount,
            OutStandingAmount,
            Discount,
            BillDate 
From Bill B 
Inner Join
      mst_Patient P On P.Ptn_Pk= B.Ptn_PK
Where (P.DeleteFlag = 0 Or P.DeleteFlag = Null) And P.LocationID = @LocationID;

Close symmetric key Key_CTC

END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetBillDetails]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetBillDetails]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 20-Jun-2014
-- Description:	Get Bill by TransactionID OR Receipt number
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetBillDetails] 
	-- Add the parameters for the stored procedure here
	@LocationID int =Null,
	@PatientID int = Null,
	@BillStatus int = Null,
	@BillID int = Null 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Select	B.BillID,
			B.ptn_pk PatientID,
			B.LocationID,
			Case B.BillStatus
				When 1 Then ''Open''
				When 2 Then ''Closed''
				When 3 Then ''Voided''
			End BillStatus,
			B.BillDate,
			B.BillNumber,
			U.UserLastName + '', '' + U.UserFirstName As CreatedBy,
			B.BillAmount,
			Isnull(T.SettledAmount, 0.00) SettledAmount,
			BillAmount - Isnull(T.SettledAmount, 0.00) UnpaidAmount,
			Isnull(T.SettledAmount, 0.00) - Isnull(T.ReceivedAmount, 0.00) Discount,
			Case
				When T.BillID Is Not Null And  Isnull(T.SettledAmount, 0.00) > 0.00 Then Convert(bit, 1)
				Else Convert(bit, 0) End HasTransaction,
			Case When I.TransCount Is Not Null And I.TransCount > 0 Then 2 Else 1 End As PayMode			
	From dbo.mst_Bill B
	Inner Join dbo.mst_User U
		On U.UserID = B.CreatedBy
	Left Outer Join 
	(
		Select	Sum(Isnull(O.Amount,0)) SettledAmount,
				Sum(Isnull(O.AmountPayable,0)) ReceivedAmount,
				O.BillID
		From dbo.vw_Billing_BillTransaction O	
		Where (@BillID Is Null Or O.BillID = @BillID) 
		And (@LocationID Is Null OR O.LocationID=@LocationID)
		And O.Refunded = 0			
		Group By O.BillID 
	) T
	On T.BillID = B.BillID
	Left Outer Join
	(
		Select I.BillID,Count(I.TransactionId)TransCount From dbo.dtl_Bill I
		Inner Join dbo.vw_Billing_BillTransaction O On O.TransactionID = I.TransactionId
		Where (@BillID Is Null Or O.BillID = @BillID)
		And (@LocationID Is Null OR O.LocationID=@LocationID)
		And O.Refunded=0
		Group By I.BillID
	) I On I.BillID = B.BillID
	Where (@LocationID Is Null OR B.LocationID=@LocationID)
	And (@PatientID Is Null Or B.ptn_pk = @PatientID) 
	And B.DeleteFlag = 0
	And (@BillStatus Is Null Or B.BillStatus = @BillStatus)
	And (@BillID Is Null Or B.BillID = @BillID)
	Order By B.BillID Desc;
  
END
' 
END
GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_cashiersTransactionsSummary]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_cashiersTransactionsSummary]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Vincent Yahuma
-- Create date: 18-Apr-2015
-- Description: shows the current days cashiers transactions and monies collected
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_cashiersTransactionsSummary] (@userID int)
AS
BEGIN
Declare @StartDate datetime, @EndDate datetime
Set @StartDate = Dateadd(Second, 0, Dateadd(Day, Datediff(Day, 0, Getdate()), 0))
Set @EndDate = Dateadd(Second, -1, Dateadd(Day, Datediff(Day, 0, Getdate()) + 1, 0));

Select	TransactionDescription PaymentName,
		Sum(Amount) Total,
		Count(transactionID) TotalTransactions
From dtl_BillDepositTransaction
Where TransactionDescription = ''Deposit''
And UserID = @userID
And TransactionDate Between @StartDate And @EndDate
Group By TransactionDescription 
Union 
Select	PaymentName,
		Sum(AmountPayable) Total,
		Count(transactionID)
From vw_Billing_BillTransaction
Where PaymentName Not In (''Deposit'', ''Write off'')
And TransactedBy = @userID
And TransactionStatus = ''paid''
And TransactionDate Between @StartDate And @EndDate
Group By PaymentName


Select Isnull(Sum(refunds), 0) Refunds
From (Select Sum(AmountPayable) Refunds
	From vw_Billing_BillTransaction
	Where Refunded = 1
	And TransactionStatus = ''reversed''
	And refundby = @userID
	And TransactionDate Between @StartDate And @EndDate 
Union 
Select Sum(Amount) Refunds
	From dtl_BillDepositTransaction
	Where TransactionDescription = ''Refund''
	And UserID = @userID
	And TransactionDate Between @StartDate And @EndDate) a
End' 
END
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_CancelBill]    Script Date: 09/03/2015 09:04:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_CancelBill]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		Joseph Njung''e
-- Create date: 25 July 2014
-- Description:	Cancel/Delete Bill
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_CancelBill] 
	-- Add the parameters for the stored procedure here
	@BillID int , 
	@UserID int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
	If Exists (Select 1	From dbo.vw_Billing_BillTransaction	Where BillID = @BillID	And Reversed = 0 And Refunded = 0) 
	Return (1);
	
	Begin Transaction Cancel
	Begin Try	
		Update dbo.mst_Bill Set
			DeleteFlag = 1,
			BillStatus = 3, --Voided
			UserID = @UserID,
			UpdateDate = Getdate()
		Where BillID = @BillID And DeleteFlag = 0;
		
		Update dbo.dtl_Bill Set BillID = Null Where BillID=@BillID;
	
		If @@TRANCOUNT > 0 		Commit Transaction Cancel;
	End Try
	Begin Catch

		Declare @ErrorMessage NVARCHAR(4000),@ErrorSeverity Int,@ErrorState Int;
		Select	@ErrorMessage = Error_message(),
			@ErrorSeverity = Error_severity(),
			@ErrorState = Error_state();
	 Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState  );

	IF @@TRANCOUNT > 0
	Rollback Transaction Cancel;
	End Catch;
	
END
' 
END
GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_GetExemptionReason]    Script Date: 10/29/2015 15:57:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetExemptionReason]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetExemptionReason]
GO
/****** Object:  StoredProcedure [dbo].[pr_Billing_GetExemptionReason]    Script Date: 10/29/2015 15:57:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetExemptionReason]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[pr_Billing_GetExemptionReason] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 29 Oct 2015
-- Description:	Get reasons for Exemption
-- =============================================
ALTER PROCEDURE [dbo].[pr_Billing_GetExemptionReason] 
	-- Add the parameters for the stored procedure here
	@Reason varchar(50) =Null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select @Reason = Nullif(@Reason, '');
	Select D.ID ReasonID, D.Name ReasonText From Mst_Decode D
	Inner Join Mst_Code C On C.CodeID=D.CodeID
	Where C.Name = 'Payment Exemption'
END

GO


/****** Object:  StoredProcedure [dbo].[pr_Billing_GeneratePaymentReceipt]    Script Date: 11/30/2015 19:49:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GeneratePaymentReceipt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GeneratePaymentReceipt]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO	  
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2015-Nov-16
-- Description:	Query to get Reciept
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GeneratePaymentReceipt](
	@TransactionID int,	
	@UserId int,
	@password varchar(50) = null, 
	@xml xml= null Output 
)
	-- Add the parameters for the stored procedure here

AS
BEGIN		

	If Exists(Select 1 From dtl_BillingReceipt Where TransactionId = @TransactionId And ReceiptType = 1) Begin
		Select	Id,
			Ptn_PK,
			ReceiptDate,
			ReceiptType,
			ReceiptNumber,
			TransactionId,
			ReceiptData, --convert(xml, convert(varchar(max), decryptbykey(ReceiptData))) ReceiptData,
			PrintCount
		From dtl_BillingReceipt Where TransactionId = @TransactionId And ReceiptType = 1;
	End
	Else Begin
	Declare @Items xml, @Transaction xml;
	---Items
		If Exists (Select 1	From dbo.dtl_Bill Where TransactionId = @TransactionID) Begin
			Set @Items = 
			(
				Select	billItemID ID,
						Convert(varchar, D.BillItemDate, 112) BillItemDate,
						ItemName Item,
						Quantity,
						(SellingPrice - D.Discount) SellingPrice,
						(Quantity * (SellingPrice - D.Discount)) Amount,
						UR.UserFirstName,
						UR.UserLastName,
						UR.UserID
					From dbo.dtl_Bill D
					Inner Join
						dbo.ord_bill As T On D.TransactionId = T.TransactionID
					Inner Join
						dbo.mst_User As UR On UR.UserID = D.CreatedBy
					Where T.TransactionId = @TransactionID
					For xml Raw ('Items'), Elements
			);
		End 
		Else Begin
			Set @Items = 
			(
				Select	billItemID ID,
						Convert(varchar, D.BillItemDate, 112) BillItemDate,
						ItemName Item,
						Quantity,
						(SellingPrice - D.Discount) SellingPrice,
						(Quantity * (SellingPrice - D.Discount)) Amount,
						UR.UserFirstName,
						UR.UserLastName,
						UR.UserID
				From dbo.dtl_Bill D
				Inner Join
					dbo.ord_bill As T On D.BillID = T.BillID
				Inner Join
					dbo.mst_User As UR On UR.UserID = D.CreatedBy
				Where T.TransactionId = @TransactionID
				For xml Raw ('Items'), Elements
			);
		End
		--Transaction Summary
		Set @Transaction = 
		(
			Select	P.PatientFacilityID As PatientID,
				Convert(varchar(50), Decryptbykey(P.LastName)) As PatientLastName,
				Convert(varchar(50), Decryptbykey(P.FirstName)) As PatientFirstName,
				(Select Name	From dbo.mst_Decode As dc		Where (P.Sex = ID))	As PatientSex,
				PatientAge = dbo.[fn_GetPatientAgeInYearsMonth](P.Ptn_Pk),
				FacilityName,
				Nullif(Ltrim(Rtrim(FacilityTel)), '') FacilityTel,
				F.FacilityCell,
				F.FacilityFax,
				FacilityAddress,
				FacilityEmail,
				FacilityFooter,
				FacilityURL,
				FacilityLogo,
				Currency,
				B.BillNumber InvoiceNumber,
				B.BillDate InvoiceDate,
				B.BillAmount InvoiceAmount,
				T.ReceiptNumber ReceiptNumber,
				T.AmountPayable Amount,
				T.Discount,
				T.TenderedAmount,
				B.BillAmount - (Select Isnull(Sum(O.Amount),0.00)	From ord_bill O	Where O.BillID = T.BillID	And O.TransactionStatus = 'Paid')OutstandingAmount,
				dbo.fn_Billing_PatientAvailableDeposit(T.Ptn_PK, B.LocationID) AvailableDeposit,
				Case When T.TenderedAmount = 0.00 Then 0.00 Else T.TenderedAmount - T.AmountPayable End Change,
				T.TransactionDate,
				PT.PaymentName TransactionType,
				T.RefNumber,
				U.UserLastName CashierLastName,
				UserFirstName CashierFirstName,
				T.userID CashierUserID
			From dbo.mst_Patient P
			Inner Join
			dbo.mst_Bill B On B.ptn_pk = P.Ptn_Pk
			Inner Join
		dbo.ord_bill As T On B.BillID = T.BillID
		Inner Join
		dbo.mst_Facility F On F.FacilityID = B.LocationID
		Inner Join
		dbo.mst_User U On U.UserID = T.userID
		Inner Join
		dbo.vw_BillPaymentType PT On PT.ID = T.TransactionType
		Where T.TransactionID = @TransactionID
		For xml Raw ('Transaction'), Elements
	);
		
		Set @xml = (Select	@Items,	@Transaction	For xml Path ('Receipt'));

		Insert Into dtl_BillingReceipt(
			Ptn_PK,
			TransactionId,
			ReceiptDate,
			ReceiptType,
			ReceiptNumber,			
			ReceiptData,
			UserId,
			PrintCount
		)	
		Select
			Ptn_PK,
			@TransactionID,
			TransactionDate,
			1 ReceiptType,
			ReceiptNumber,	
			@xml, --encryptbykey(key_guid('Key_CTC'), Convert(varchar(max),@Xml)) ReceiptData,
			@UserId,
			1
		From ord_bill Where TransactionID=@TransactionID;

		Select Id, Ptn_PK, ReceiptDate,ReceiptType,ReceiptNumber, @TransactionID TransactionId, @Xml ReceiptData, UserId, PrintCount From dtl_BillingReceipt Where Id = Scope_identity();

	End
		
End
GO

		
/****** Object:  StoredProcedure [dbo].[pr_Billing_GeneratePaymentReversalReceipt]    Script Date: 11/30/2015 19:49:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GeneratePaymentReversalReceipt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GeneratePaymentReversalReceipt]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2014-Nov-16
-- Description:	Query to get Reciept for reversals
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GeneratePaymentReversalReceipt](
	@TransactionID int,
	@UserId int,
	@password varchar(50) = null,
	@xml xml= null Output
)
	-- Add the parameters for the stored procedure here

AS
BEGIN
	Declare @Items xml, @Transaction xml;
	

	If Exists(Select 1 From dtl_BillingReceipt Where TransactionId = @TransactionId And ReceiptType = 2) Begin
		Select	Id,
			Ptn_PK,
			ReceiptDate,
			ReceiptType,
			ReceiptNumber,
			TransactionId,
			ReceiptData,--convert(xml, convert(varchar(max), decryptbykey(ReceiptData))) ReceiptData,
			PrintCount
		From dtl_BillingReceipt Where TransactionId = @TransactionId And ReceiptType = 2;
	End
	Else Begin
		---Items
		Set @Items = 
		(
			Select TransactionID ID,
					Convert(varchar, T.RefundDate, 112) BillItemDate,
					'Payment Refund' Item,
					1 Quantity,
					T.Amount SellingPrice,
					T.AmountPayable Amount,
					UR.UserFirstName,
					UR.UserLastName,
					UR.UserID
			From dbo.vw_Billing_BillTransaction T 
			Inner Join 
				dbo.mst_User As UR	On UR.UserID = T.RefundBy	
			Where T.TransactionReversalID=@TransactionID And T.Refunded = 1
			For XML RAW ('Items'), ELEMENTS
		);

		--Transaction Summary

		Set @Transaction=
		(	
			Select	Coalesce(P.PatientEnrollmentID, P.PatientClinicID,P.IQNumber) As PatientID,
				Convert(varchar(50), Decryptbykey(P.LastName)) As PatientLastName,
				Convert(varchar(50), Decryptbykey(P.FirstName)) As PatientFirstName,
				(Select Name	From dbo.mst_Decode As dc		Where (P.Sex = ID))	As PatientSex,
				PatientAge = dbo.[fn_GetPatientAgeInYearsMonth](P.Ptn_Pk),
				FacilityName,
				Nullif(ltrim(rtrim(FacilityTel)),'') FacilityTel,
				F.FacilityCell,
				F.FacilityFax,
				FacilityAddress,
				FacilityEmail,
				FacilityFooter,
				FacilityURL,		
				FacilityLogo,
				Currency,
				T.BillNumber InvoiceNumber,
				T.BillDate InvoiceDate,
				T.BillAmount InvoiceAmount,
				T.ReversalReference ReceiptNumber,	
				T.AmountPayable Amount,	
				0 TenderedAmount,		
				T.BillAmount - (Select Isnull(Sum(O.Amount),0.00)	From ord_bill O	Where O.BillID = T.BillID	And O.TransactionStatus = 'Paid')OutstandingAmount,
				dbo.fn_Billing_PatientAvailableDeposit(T.Ptn_PK, T.LocationID) AvailableDeposit,
				Case When T.TenderedAmount = 0.00 Then 0.00 Else T.TenderedAmount - T.AmountPayable End Change,
				T.RefundDate TransactionDate,		 
				T.PaymentName TransactionType ,
				T.ReceiptNumber RefNumber,			
				U.UserLastName CashierFirstName,
				U.UserFirstName CashierLastName,
				T.RefundBy CashierUserID
		From dbo.mst_Patient P 
		Inner Join
			dbo.vw_Billing_BillTransaction T On T.Ptn_PK = P.Ptn_Pk
		Inner Join
			dbo.mst_Facility F On F.FacilityID = T.LocationID
		Inner Join 
			dbo.mst_User U On U.UserID =T.RefundBy	
		--Inner Join 
		--	dbo.vw_BillPaymentType PT On PT.ID = T.TransactionType
		Where T.TransactionReversalID=@TransactionID 
		And Refunded =1
		For XML RAW ('Transaction'), ELEMENTS
		);


		Set @xml = (Select @Items, @Transaction  for xml path('Receipt'))
	
		Insert Into dtl_BillingReceipt(
				Ptn_PK,
				ReceiptDate,
				ReceiptType,
				TransactionId,
				ReceiptNumber,
				ReceiptData,
				UserId,
				PrintCount
			)	
		Select
			Ptn_PK,
			RefundDate,
			2 ReceiptType,
			@TransactionID,
			ReversalReference ReceiptNumber,
			@Xml, --encryptbykey(key_guid('Key_CTC'), Convert(varchar(max),@Xml)) ReceiptData,
			@UserId,
			1
		From ord_Bill_Reversals Where TransactionReversalID=@TransactionID;

		Select Id, Ptn_PK, ReceiptDate,ReceiptType,ReceiptNumber, TransactionId, @Xml ReceiptData, UserId, PrintCount From dtl_BillingReceipt Where Id = Scope_identity();
	End
	
	
END

GO


/****** Object:  StoredProcedure [dbo].[pr_Billing_GenerateDepositReceipt]    Script Date: 11/30/2015 19:49:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GenerateDepositReceipt]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GenerateDepositReceipt]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO		 
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2015-Nov-16
-- Description:	Generate Receipt
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GenerateDepositReceipt](
	@TransactionID int,	
	@UserId int,
	@password varchar(50) = null,
	@xml xml= null Output)
	-- Add the parameters for the stored procedure here

AS
BEGIN		
	
	declare @ReceiptType int, @TransactionDate datetime,@ReferenceNumber varchar(50), @PatientId int;
	Select 
		@ReceiptType= Case TransactionDescription When 'Deposit' Then 3 Else 4 End,
		@PatientId = Ptn_PK,
		@ReferenceNumber = ReferenceNumber,
		@TransactionDate = TransactionDate
	From dtl_BillDepositTransaction Where TransactionID=@TransactionID;

	If Exists(Select 1 From dtl_BillingReceipt Where TransactionId = @TransactionId And ReceiptType = @ReceiptType) Begin
		Select	Id,
			Ptn_PK,
			ReceiptDate,
			ReceiptType,
			ReceiptNumber,
			TransactionId,
			ReceiptData, --convert(xml, convert(varchar(max), decryptbykey(ReceiptData))) ReceiptData,
			PrintCount
		From dtl_BillingReceipt Where TransactionId = @TransactionId And ReceiptType = @ReceiptType;
	End
	Else Begin
		Set @xml = 
		(
			Select	
				T.TransactionID ID,
				Convert(varchar, T.TransactionDate, 112) TransactionDate,
				DepositType + ' ' + T.TransactionDescription TransactionDescription,
				T.DepositType TransactionType,
				T.ReferenceNumber ReceiptNumber,
				Amount TransactionAmount,
				dbo.fn_Billing_PatientAvailableDeposit(T.Ptn_PK, T.LocationID) AvailableDeposit,
				UR.UserFirstName CashierFirstName,
				UR.UserLastName CashierLastName,
				UR.UserID CashierUserId,
				P.PatientFacilityID As PatientID,
				Convert(varchar(50), Decryptbykey(P.LastName)) As PatientLastName,
				Convert(varchar(50), Decryptbykey(P.FirstName)) As PatientFirstName,
				(Select Name	From dbo.mst_Decode As dc	Where (P.Sex = ID))As PatientSex,
				PatientAge = dbo.[fn_GetPatientAgeInYearsMonth](P.Ptn_Pk),
				FacilityName,
				Nullif(Ltrim(Rtrim(FacilityTel)), '') FacilityTel,
				F.FacilityCell,
				F.FacilityFax,
				FacilityAddress,
				FacilityEmail,
				FacilityFooter,
				FacilityURL,
				FacilityLogo,
				Currency
			From dbo.dtl_BillDepositTransaction T
			Inner Join
				dbo.mst_User As UR On UR.UserID = T.UserID
			Inner Join
				dbo.mst_Patient P On P.Ptn_Pk = T.Ptn_PK
			Inner Join
				dbo.mst_Facility F On F.FacilityID = T.LocationID
			Where T.TransactionId = @TransactionID
			And T.TransactionDescription In ('Refund', 'Deposit')
			For xml Raw ('Transaction'), Root ('Receipt'), Elements
		);

		Insert Into dtl_BillingReceipt(
			Ptn_PK,
			ReceiptDate,
			ReceiptType,
			ReceiptNumber,
			TransactionId,
			ReceiptData,
			UserId,
			PrintCount
		)
		Values
		(
			@PatientId,
			@TransactionDate,
			@ReceiptType,
			@ReferenceNumber,
			@TransactionId,
			@xml, -- encryptbykey(key_guid('Key_CTC'), Convert(varchar(max),@Xml)),
			@UserId,
			1
		)	;
		Select 
			Id, 
			Ptn_PK, 
			ReceiptDate,
			ReceiptType,
			ReceiptNumber, 
			TransactionId,
			@xml ReceiptData, 
			PrintCount 
		From dtl_BillingReceipt Where Id = Scope_identity();

	End
			   
End			   

GO





/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DepartmentalSummary]    Script Date: 12/16/2015 14:10:57 ******/
/****** Object:  StoredProcedure [dbo].[pr_Billing_Report_DepartmentalSummary]    Script Date: 5/12/2016 5:01:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2015-Dec-06
-- Description:	summary for populating departmental daily collections report
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_Report_DepartmentalSummary]
(
	@fromDate datetime,
	@toDate datetime,
	@locationID int 
)

AS
Begin
--declare @fromDate datetime,	@toDate datetime,	@locationID int;

--select @fromDate=N'20151101',@toDate=N'20151201',@locationID=N'754'
	declare @LabTypeID int, @PharmacyTypeID int, @ConsumableTypeID int;
	Declare @StartDate datetime, @EndDate datetime;

	Select @StartDate = dateadd(second, 0, dateadd(day, datediff(day, 0, @fromDate), 0)) ,
		@EndDate = dateadd(second, -1, dateadd(day, datediff(day, 0, @toDate)+1, 0)) ;

	Select @LabTypeID = BillingTypeID
	From dbo.Mst_BillingType
	Where Name = 'Lab Tests';

	Select @PharmacyTypeID = BillingTypeID
	From dbo.Mst_BillingType
	Where Name = 'Pharmaceuticals';

	Select @ConsumableTypeID = BillingTypeID
	From dbo.Mst_BillingType
	Where Name = 'Consumables';

	Select	[date],
			Department,
			Sum(billamount) billamount,
			Sum(collectedamount) collectedamount,
			sum(T1.AmountPayable) AmountPayable,
			sum(T1.Amount) Amount,
			T1.PaymentName
	From (Select	Convert(datetime, floor(Convert(float, ob.TransactionDate))) [date],
					Case
						When db.ItemType = @LabTypeID  Then 	Case When CostCenter= 'X-Ray' Then 'Imaging'	Else 'Laboratory' End
						When db.ItemType = @PharmacyTypeID Then 'Pharmacy'
						When vt.VisitTypeID In (0, 12) Then 'Outpatient'
						--When md.ModuleName Is Null Then vt.VisitName
						When SUBSTRING(VisitName, CHARINDEX('-', VisitName) - 1, LEN(VisitName))  =  ' - Enrollment' Then SUBSTRING(VisitName, 1, CHARINDEX('-', VisitName) - 1)
						Else isnull(md.ModuleName,isnull(vt.VisitName, 'Others')) End Department,
					(db.Quantity * db.SellingPrice) billamount,					
					(db.Quantity * (db.SellingPrice - Isnull(db.Discount,0.0))) collectedamount,
					ob.AmountPayable AmountPayable,
					ob.Amount,
					ob.TransactionType,
					PT.PaymentName
		From dbo.dtl_Bill db
		Inner Join	ord_bill ob On db.BillID = ob.BillID	
		Inner join vw_BillPaymentType PT on PT.ID = ob.TransactionType	
		Left Join	dbo.mst_VisitType vt On vt.VisitTypeID = db.ItemId
		Left Join	dbo.mst_Feature ft On ft.FeatureName = vt.VisitName	And ft.DeleteFlag = 0
		Left Join	dbo.mst_module md On (md.ModuleID = ft.ModuleId		Or md.ModuleID = db.ModuleID)
		Where ob.TransactionDate Between @StartDate And @EndDate
		And db.PaymentStatus = 1
		And ob.TransactionStatus = 'PAID'
		And db.Ptn_PK > 0
		And db.DeleteFlag = 0) T1
	Group By	[date],
				Department,
				T1.PaymentName


Select	FacilityName name,
		FacilityLogo logo,
		'' motto,
		FacilityAddress [address],
		FacilityTel tel,
		FacilityCell cell,
		FacilityFax fax,
		FacilityEmail email,
		FacilityURL url,
		FacilityFooter footer,
		FacilityTemplate template
From dbo.mst_Facility
Where FacilityID = @locationID;
END



GO




/****** Object:  StoredProcedure [dbo].[pr_Billing_GetItemType]    Script Date: 03/17/2016 08:12:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Billing_GetItemType]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Billing_GetItemType]
GO

/****** Object:  StoredProcedure [dbo].[pr_Billing_GetItemType]    Script Date: 03/17/2016 08:12:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get Items types for billing
-- =============================================
CREATE PROCEDURE [dbo].[pr_Billing_GetItemType]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

-- Insert statements for procedure here
Select	Name,
		BillingTypeID TypeId,
		MasterTableName ContainerName,
		MasterFieldName ColumnItemName,
		MasterIDField ColumnItemIdentifier,
		DeleteFlag
From Mst_BillingType
Where DeleteFlag = 0
End

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Billing_PaymentVoucher_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Billing_PaymentVoucher_Delete]
GO

/****** Object:  StoredProcedure [dbo].[Billing_PaymentVoucher_Delete]    Script Date: 8/2/2016 5:48:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2016 Jul 20
-- Description:	Void a payment voucher
-- =============================================
CREATE PROCEDURE [dbo].[Billing_PaymentVoucher_Delete] 
	-- Add the parameters for the stored procedure here
	@VoucherId int , 
	@UserId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Update dtl_BillCreditVoucher Set
			VoidDate = getdate()
		,	VoidedBy = @UserId
		,	DeleteFlag = 1
	Where (Id = @VoucherId);

	Update dtl_BillCreditKnockOff Set
			VoidDate = getdate()
		,	VoidedBy = @UserId
		,	DeleteFlag = 1
	Where (VoucherId = @VoucherId)
END


GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Billing_PaymentVoucher_GetOne]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Billing_PaymentVoucher_GetOne]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2016 Jul 20
-- Description:	Get payment voucher
-- =============================================
CREATE PROCEDURE [dbo].[Billing_PaymentVoucher_GetOne] 
	-- Add the parameters for the stored procedure here
	@VoucherId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select	Id
		,	LocationId
		,	VoucherDate
		,	Amount
		,	Isnull((Select Sum(K.KnockOffAmount) From dtl_BillCreditKnockOff K Where K.VoucherId = V.Id),0.00) AmountUsed
		,	VoucherType
		,	ReferenceId
		,	Description
		,	UserId
		,	CreateDate
		,	DeleteFlag
		,	VoidDate
		,	VoidedBy
	From dtl_BillCreditVoucher As V
	Where (Id = @VoucherId) And V.DeleteFlag = 0
END


GO
/****** Object:  StoredProcedure [dbo].[Billing_KnockOff_GetMany]    Script Date: 9/1/2016 2:21:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Billing_KnockOff_GetMany]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Billing_KnockOff_GetMany]
GO

/****** Object:  StoredProcedure [dbo].[Billing_KnockOff_GetMany]    Script Date: 9/1/2016 2:21:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2016 Jul 20
-- Description:	Get payment voucher
-- =============================================
Create PROCEDURE [dbo].[Billing_KnockOff_GetMany] 
	-- Add the parameters for the stored procedure here
	@VoucherId int = null,
	@TransactionId int = null 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select	Id
		,	K.TransactionId
		,	B.AmountPayable TransactionAmount
		,	B.TransactionDate
		,	PaymentTypeId
		,	VoucherId
		,	KnockOffAmount
		,	Description
		,	K.UserId
		,	CreateDate
		,	DeleteFlag
		,	VoidDate
		,	VoidedBy
	From dtl_BillCreditKnockOff As K
	Inner Join ord_bill B On B.TransactionId = K.TransactionId
	Where (K.VoucherId = @VoucherId Or @VoucherId Is Null)
		And(K.TransactionId = @TransactionId Or @TransactionId Is Null)
	 And K.DeleteFlag = 0
END


GO



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Billing_PaymentVoucher_GetMany]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Billing_PaymentVoucher_GetMany]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2016 Jul 20
-- Description:	Get payment voucher
-- =============================================
CREATE PROCEDURE [dbo].[Billing_PaymentVoucher_GetMany] 
	-- Add the parameters for the stored procedure here
	@LocationId int,
	@DateFrom datetime = null,
	@DateTo datetime = null,
	@VoucherType varchar(50) = null
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	If(@DateFrom Is Not Null) Begin
		Select @DateFrom = Convert(datetime,floor(Convert(float,@DateFrom))) ,
				@DateTo =   dateadd(second, -1,dateadd(day,1,Convert(datetime,floor(Convert(float,@DateTo)))));
	End
	Select	@VoucherType = nullif(@VoucherType,'');
    -- Insert statements for procedure here
	Select	Id
		,	LocationId
		,	VoucherDate
		,	Amount
		,	Isnull((Select Sum(K.KnockOffAmount) From dtl_BillCreditKnockOff K Where K.VoucherId = V.Id),0.00) AmountUsed
		,	VoucherType
		,	ReferenceId
		,	Description
		,	UserId
		,	CreateDate
		,	DeleteFlag
		,	VoidDate
		,	VoidedBy
	From dtl_BillCreditVoucher As V
	Where (LocationId = @LocationId)
		And (DeleteFlag = 0)
		And (VoucherDate Between @DateFrom And @DateTo)
		And (@VoucherType Is Null Or @VoucherType = VoucherType)
		Or (LocationId = @LocationId)
		And (DeleteFlag = 0)
		And (@VoucherType Is Null Or @VoucherType = VoucherType)
		And (@DateFrom Is Null)
END


GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Billing_PaymentVoucher_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Billing_PaymentVoucher_Insert]
GO

/****** Object:  StoredProcedure [dbo].[Billing_PaymentVoucher_Insert]    Script Date: 8/2/2016 5:50:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2016 Jul 20
-- Description:	Insert payment voucher
-- =============================================
CREATE PROCEDURE [dbo].[Billing_PaymentVoucher_Insert] 
	-- Add the parameters for the stored procedure here
	@LocationId int,
	@VoucherDate datetime,
	@Amount decimal(18,2),
	@VoucherType varchar(50),
	@ReferenceId varchar(50),
	@Description varchar(300),
	@UserId int
	 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Insert Into dtl_BillCreditVoucher (
			LocationId
		,	VoucherDate
		,	Amount
		,	KnockedOffAmount
		,	VoucherType
		,	ReferenceId
		,	Description
		,	UserId
		,	CreateDate
		,	DeleteFlag)
	Values (
			@LocationId
		,	@VoucherDate
		,	@Amount
		,	0.0
		,	@VoucherType
		,	@ReferenceId
		,	@Description
		,	@UserId
		,	getdate()
		,	0)

	Select  scope_identity() Id;




END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Billing_KnockOff_Insert]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Billing_KnockOff_Insert]
GO

/****** Object:  StoredProcedure [dbo].[Billing_KnockOff_Insert]    Script Date: 8/2/2016 5:52:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2016 Jul 20
-- Description:	Knock off credit transaction against a voucher
-- =============================================
CREATE PROCEDURE [dbo].[Billing_KnockOff_Insert] 
	-- Add the parameters for the stored procedure here
	@VoucherId int , 
	@UserId int ,
	@TransactionList xml
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Begin Transaction Knock
	Begin Try
		declare @t table(TransactionId int, PaymentTypeId int, Amount decimal(18,2),Description varchar(250));
		
		Insert Into @t (
				TransactionId
			,	PaymentTypeId
			,	Amount
			,	Description)
		Select	T.N.value('transactionid[1]', 'int')		TransactionId
			,	T.N.value('paymenttypeid[1]', 'int')		PaymentTypeId
			,	T.N.value('amount[1]', 'decimal(18,2)')		Amount
			,	T.N.value('description[1]', 'varchar(250)')	Description
		From @TransactionList.nodes('/root/tran') As T (N);
		
		Insert Into dtl_BillCreditKnockOff (
				TransactionId
			,	PaymentTypeId
			,	VoucherId
			,	KnockOffAmount
			,	Description
			,	UserId
			,	CreateDate
			,	DeleteFlag)
		Select	T.TransactionId
			,	T.PaymentTypeId
			,	@VoucherId
			,	T.Amount
			,	T.Description
			,	@UserId
			,	getdate()
			,	0
		From @t T;

		Update B Set
				Settled = 1
			,	AmountSettled = Isnull(AmountSettled, 0.0) + T.Amount
		From ord_bill B
		Inner Join @T T On T.TransactionId = B.TransactionId;

		Update dtl_BillCreditVoucher Set
				KnockedOffAmount = (
				Select sum(Amount)
				From @t
				)
		Where Id = @VoucherId;

		IF @@TRANCOUNT > 0	Commit Transaction Knock;
	End Try
	Begin Catch

		Declare @ErrorMessage NVARCHAR(4000),@ErrorSeverity Int,@ErrorState Int;

		Select	@ErrorMessage = Error_message(),@ErrorSeverity = Error_severity(),@ErrorState = Error_state();

  
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState  );

		IF @@TRANCOUNT > 0	Rollback Transaction Knock;
	End Catch;
END

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Billing_KnockOff_GetTransaction]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Billing_KnockOff_GetTransaction]
GO

/****** Object:  StoredProcedure [dbo].[Billing_KnockOff_GetTransaction]    Script Date: 8/2/2016 5:53:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 2016 Jul 20
-- Description:	Get Credit Transactions
-- =============================================
CREATE PROCEDURE [dbo].[Billing_KnockOff_GetTransaction] 
	-- Add the parameters for the stored procedure here
	@LocationId int,
	@PaymentTypeId int , 
	@DateFrom datetime,
	@DateTo datetime,
	@VoucherId int = null,
	@BillNumber varchar(50) = Null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @StartDate datetime, @EndDate datetime;

	Select @StartDate = dateadd(second, 0, dateadd(day, datediff(day, 0, @DateFrom), 0)) ,
		@EndDate = dateadd(second, -1, dateadd(day, datediff(day, 0, @DateTo)+1, 0)) ;
	If(@VoucherId Is Null) Begin
		Select	B.TransactionId
			,	B.Ptn_PK
			,	P.PatientName
			,	P.PatientFacilityID
			,	B.TransactionType PaymentTypeId
			,	B.TransactionDate
			,	B.ReceiptNumber
			,	B.AmountPayable	As Amount
			,	B.TransactionType
			,	B.Settled
			,	B.TransactionStatus
			,	B.AmountSettled
			,	B.AmountPayable - B.AmountSettled PendingAmount
		From ord_bill As B
		Inner Join mst_Bill As M On M.BillID = B.BillID
		Inner Join PatientView P On P.Ptn_Pk = B.Ptn_PK
		Where (B.TransactionType = @PaymentTypeId)
			And (B.TransactionDate Between @StartDate And @EndDate)
			And (B.Reversed = 0)
			And (B.TransactionStatus = 'PAID')
			And (@BillNumber Is Null Or @BillNumber = M.BillNumber)
			And (M.DeleteFlag = 0)
			And (AmountSettled < AmountPayable)
			And M.LocationId = @LocationId
	End
	Else Begin
		Select	B.TransactionId
			,	B.Ptn_PK
			,	P.PatientName
			,	P.PatientFacilityID
			,	B.TransactionType PaymentTypeId
			,	B.TransactionDate
			,	B.ReceiptNumber
			,	B.AmountPayable	As Amount
			,	B.TransactionType
			,	B.Settled
			,	B.TransactionStatus
			,	K.KnockOffAmount AmountSettled
			,	B.AmountPayable - B.AmountSettled PendingAmount
		From ord_bill As B
		Inner Join mst_Bill As M On M.BillID = B.BillID
		Inner Join PatientView P On P.Ptn_Pk = B.Ptn_PK
		Inner Join dtl_BillCreditKnockOff K On K.TransactionId= B.TransactionId
		Where (B.TransactionType = @PaymentTypeId)
			And (B.TransactionDate Between @StartDate And @EndDate)
			And (B.Reversed = 0)
			And (B.TransactionStatus = 'PAID')
			And (@BillNumber Is Null Or @BillNumber = M.BillNumber)
			And (M.DeleteFlag = 0)
			And M.LocationId = @LocationId
	End
END

GO