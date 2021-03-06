
/****** Object:  UserDefinedFunction [dbo].[fn_GetItemStock_Futures]    Script Date: 10/18/2017 1:17:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[fn_GetItemStock_Futures]  
(  
  @ItemId int,  
  @BatchId int,  
  @ExpiryDate datetime,
  @StoreId int  
)  
returns int  
as  
Begin  
  declare @Qty int  
  select @Qty = sum(Quantity) from dtl_stocktransaction where itemid =  @ItemId and   
  --batchid = @BatchId and expirydate = @ExpiryDate and StoreId = @StoreId
  batchid = @BatchId and StoreId = @StoreId
  return @Qty  
End
