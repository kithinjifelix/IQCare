/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveGRNItems_Futures]    Script Date: 11/29/2015 08:13:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[pr_SCM_SaveGRNItems_Futures]                               
@GRNId int ,                              
@POId  int,                                  
@ItemId int ,                               
--@BatchID  int ,                            
@Margin  decimal(9,2)=0,                              
@batchName varchar(500),                               
@RecievedQuantity int,                              
@FreeRecievedQuantity int=0,                              
@PurchasePrice decimal(9,2)=0,                                 
@SellingPrice  decimal(9,2)=0,                              
@SellingPricePerDispense decimal(9,2)=0,                               
@ExpiryDate datetime,                                
@UserId int ,                            
@destinationStoreID int=0 ,                            
@SourceStoreID int=0,                          
@TotPurchasePrice decimal(9,2)=0,                          
@IsPOorIST int  -- 1 for Purchase order and 2 for Inter store transfer   
                          
As                                  
Begin
                                   
                                
	declare @tempBatchId int, 
			@tempbatchname varchar(100), 
			@tempExpiryDate datetime, 
			@Indexofdelimeter int,
			@maxbatchSrno int;
                         
	Select @tempBatchId = ID	From Mst_Batch	Where Name = @batchName	And ItemID = @ItemId   ;
	
	If(@tempBatchId Is Null) Begin
		Select @maxbatchSrno = Max(SRNO)	From Mst_Batch;
		Insert Into Mst_Batch (
			name,
			UserId,
			CreateDate,
			SRNO,
			ItemID,
			ExpiryDate)
		Values (
			@batchName, 
			@UserId, 
			Getdate(), 
			(@maxbatchSrno + 1), 
			@ItemId, 
			@ExpiryDate);
		Set @tempBatchId = scope_identity();
	End                         
                    

	Insert Into Dtl_GRNote (
		GRNId,
		ItemId,
		BatchID,
		RecievedQuantity,
		FreeRecievedQuantity,
		PurchasePrice,
		TotPurchasePrice,
		SellingPrice,
		SellingPricePerDispense,
		ExpiryDate,
		UserId,
		CreateDate)
	Values (
		@GRNId, 
		@ItemId, 
		@tempBatchId, 
		@RecievedQuantity, 
		@FreeRecievedQuantity, 
		@PurchasePrice, 
		@TotPurchasePrice, 
		@SellingPrice, 
		@SellingPricePerDispense, 
		@ExpiryDate, 
		@UserId, 
		Getdate()
	);


	Declare @tempPurchasePrice decimal(9, 2),
			@tempQtyPerPurchaseUnit int,
			@tempTotalRecievedQuantity int,
			@itemMasterPurchasePrice decimal(9, 2);
			
	Select @tempPurchasePrice = Max(PurchasePrice)	From Dtl_GRNote	Where GRNId = @GRNId And ItemId = @ItemId;

	Select	@itemMasterPurchasePrice = PurchaseUnitPrice,
			@tempQtyPerPurchaseUnit = QtyPerPurchaseUnit
	From Mst_Drug
	Where Drug_pk = @ItemId;
	If (@itemMasterPurchasePrice < @tempPurchasePrice) Begin
		Update mst_drug Set
			PurchaseUnitPrice = @tempPurchasePrice,
			DispensingUnitPrice = (@tempPurchasePrice / QtyPerPurchaseUnit)
		Where Drug_pk = @ItemId;
		--Njung'e - Commented out. Selling Price managed via billing
		--Update mst_drug Set
		--	SellingUnitPrice = (DispensingUnitPrice + (DispensingMargin / 100) * DispensingUnitPrice),
		--	EffectiveDate = Getdate()
		--Where Drug_pk = @ItemId
	End 
	--*/                            
--select * from mst_drug            
	Select @tempTotalRecievedQuantity =  Case 
			When @IsPOorIST = 2 Then @RecievedQuantity 
			Else  @RecievedQuantity * @tempQtyPerPurchaseUnit End;           
			    
	
                           
	Insert Into dtl_stocktransaction (
		ItemId,
		BatchId,
		POId,
		GRNId,
		StoreId,
		TransactionDate,
		Quantity,
		ExpiryDate,
		PurchasePrice,
		SellingPrice,
		Margin,
		UserId,
		CreateDate)
	Values (
		@ItemId, 
		@tempBatchId, 
		@POId, 
		@GRNId, 
		@destinationStoreID, 
		Getdate(), 
		@tempTotalRecievedQuantity, 
		@ExpiryDate, 
		@PurchasePrice, 
		@SellingPrice, 
		@Margin, 
		@UserId, 
		Getdate());

	If (@IsPOorIST = 2) Begin
		Insert Into Dtl_StockTransaction (
			ItemId,
			BatchId,
			POId,
			GRNId,
			StoreId,
			TransactionDate,
			Quantity,
			ExpiryDate,
			PurchasePrice,
			SellingPrice,
			Margin,
			UserId,
			CreateDate)
		Values (
			@ItemId, 
			@tempBatchId, 
			@POId, 
			@GRNId, 
			@SourceStoreID, 
			Getdate(), 
			-@tempTotalRecievedQuantity, 
			@ExpiryDate, 
			@PurchasePrice, 
			@SellingPrice, 
			@Margin, 
			@UserId, 
			Getdate());
	End

	declare @TotalRecievedQuantity int,
			 @TotalQuantity int,
			 @POstatus int;

	Select @TotalRecievedQuantity = Sum(e.RecievedQuantity)
	From Dtl_PurchaseItem a
	Left Outer Join
		Mst_Drug b On a.ItemId = b.Drug_pk
	Left Outer Join
		Ord_GRNote d On d.POId = a.POId
	Left Outer Join
		Dtl_GRNote e On (e.GRNId = d.GRNId	And e.ItemId = a.ItemId)
	Left Outer Join
		Mst_Batch f On f.ID = e.BatchID
	Inner Join
		ord_PurchaseOrder g On g.Poid = a.POId
	Where a.POId = @POId
	Group By a.POID;

	Select @TotalQuantity = Sum(Quantity)	From dtl_PurchaseItem	Where POId = @POId	Group By POId;

	--If (@TotalRecievedQuantity = @TotalQuantity) Begin
	--Set @POstatus = 3
	--End Else If (@TotalRecievedQuantity < @TotalQuantity) Begin
	--Set @POstatus = 4
	--End
	Update ord_PurchaseOrder Set
		Status = Case 
						When (@TotalRecievedQuantity = @TotalQuantity) Then 3 
						When (@TotalRecievedQuantity < @TotalQuantity) Then 4
						Else [Status] End --@POstatus
	Where POId = @POId;


End