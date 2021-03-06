
/****** Object:  StoredProcedure [dbo].[pr_Pharmacy_FindDrugByName]    Script Date: 6/20/2018 3:46:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: July 21 2015
-- Description:	Search Drugs. If PM?SCM is on, show available quatity in the dispensing stores only
-- =============================================
ALTER PROCEDURE [dbo].[pr_Pharmacy_FindDrugByName] 
	-- Add the parameters for the stored procedure here
	@SearchText varchar(50) = null, 
	@CheckQuantity bit = 0,
	@ExcludeDrugType int = Null
AS
Begin
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	If Ltrim(Rtrim(@SearchText)) <> '' Select @SearchText = '%' + @SearchText + '%';
	
	If(@ChecKQuantity = 1) Begin
		Select	D.Drug_pk,
			Convert(varchar(100), D.DrugName) As Drugname,
			Isnull(Convert(varchar, Sum(ST.Quantity)), 0) As QTY
		From Dtl_StockTransaction As ST
		Inner Join
			Mst_Store As S On S.Id = ST.StoreId		And S.DispensingStore = 1
		Right Outer Join
			Mst_Drug As D On D.Drug_pk = ST.ItemId 
		Where (D.DrugName Like @SearchText)
		And D.DeleteFlag = 0
		AND ST.ExpiryDate > GETDATE()
		And Case When @ExcludeDrugType Is Null Then 1
				 When dbo.fn_GetDrugTypeId_futures (D.Drug_pk) = @ExcludeDrugType Then 0
				 Else 1
			End = 1
		Group By	D.Drug_pk,	D.DrugName
		having Sum(ST.Quantity) > 0;		
	End
	Else Begin
		Select Drug_pk,
			DrugName 
		From Mst_Drug D 
		Where DeleteFlag=0 And 
		DrugName LIKE @SearchText
		And Case When @ExcludeDrugType Is Null Then 1
				 When dbo.fn_GetDrugTypeId_futures (D.Drug_pk) = @ExcludeDrugType Then 0
				 Else 1
			End = 1
	End
End

