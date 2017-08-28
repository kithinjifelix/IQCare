/****** Object:  StoredProcedure [dbo].[pr_SCM_SetPharmacyRefillAppointment]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_SetPharmacyRefillAppointment]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveUpdateItemMaster_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_SaveUpdateItemMaster_Futures]
GO
/****** Object:  StoredProcedure [dbo].[Pr_SCM_SaveStockTransAdjust_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[Pr_SCM_SaveStockTransAdjust_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePurchaseOrderItem_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_SavePurchaseOrderItem_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePharmacyReturnDetail_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_SavePharmacyReturnDetail_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePharmacyDispenseOrderDetail_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_SavePharmacyDispenseOrderDetail_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveOpeningStock_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_SaveOpeningStock_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveDisposeItems_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_SaveDisposeItems_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetStockSummary_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_GetStockSummary_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetPurchaseOrderDetailsByPoid_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_GetPurchaseOrderDetailsByPoid_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetPharmacyOrderDetail_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_GetPharmacyOrderDetail_Futures]
GO
/****** Object:  StoredProcedure [dbo].[Pr_SCM_GetPharmacyDispenseMasters_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[Pr_SCM_GetPharmacyDispenseMasters_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetPharmacyDetailsByDispenced_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_GetPharmacyDetailsByDispenced_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_DeletePurchaseOrderItem_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_DeletePurchaseOrderItem_Futures]
GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_BINCard_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
DROP PROCEDURE [dbo].[pr_SCM_BINCard_Futures]
GO



/****** Object:  View [dbo].[VW_PatientPharmacy]    Script Date: 6/12/2017 9:04:43 AM ******/


/****** Object:  StoredProcedure [dbo].[pr_SCM_BINCard_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_SCM_BINCard_Futures]                                                        
@StoreId int,                                                    
@ItemId int,                                                    
@FromDate datetime,                                                    
@ToDate datetime,
@LocationId int                                                    
                                                        
AS                                                                  
BEGIN                                                               
--0    
select dr.drugid,dr.drugname,du.name[disUnit] from mst_drug dr inner join mst_dispensingunit du
on dr.dispensingunit = du.id where dr.drug_pk=@ItemId
--1
select name[storeName],@FromDate[dateFrom],@ToDate[dateTo]  from mst_store where id = @StoreId
--2
--select dtl.transactiondate,usr.username,
--case when dtl.quantity >=0 then dtl.quantity else 0 end [Receipts],
--case when dtl.quantity <0 then dtl.quantity else 0 end [Issues],
--bch.name,dtl.expirydate 
--from dtl_stocktransaction dtl inner join mst_user usr
--on dtl.userid = usr.userid left join mst_batch bch on dtl.batchid = bch.id
--where dtl.itemid = @ItemId and dtl.transactiondate >= @FromDate and dtl.transactiondate <= @ToDate

DECLARE @tempTbl TABLE 
([Date] datetime,VoucherNo varchar(50),username varchar(50),Receipts int,Issues int,BatchNo varchar(50),ExpiryDate datetime, Balance int)
 
DECLARE @transactiodate datetime,@voucherNo varchar(50),@username varchar(50),@receipts int,@issues int,@batch varchar(50),@expirydate datetime,
@balance int, @balanceBF int
 
SET @balance = 0
 
DECLARE rt_cursor CURSOR
FOR
--------------------------balance b/f----------------------
select @FromDate transactiondate,'Balance b/f' OrderNo,'' username,
0 [Receipts], 0 [Issues], '' name, null expirydate, isnull(sum(quantity),0) balanceBF 
from dtl_stocktransaction dtl
where dtl.itemid = @ItemId and dtl.storeid = @StoreId and dtl.TransactionDate < @FromDate
--order by dtl.transactiondate
UNION
-------------------------------------------------
select dtl.transactiondate,ord.OrderNo,usr.username,
case when dtl.quantity >=0 then dtl.quantity else 0 end [Receipts],
case when dtl.quantity <0 then dtl.quantity else 0 end [Issues],
bch.name,dtl.expirydate, 0 balanceBF 
from dtl_stocktransaction dtl inner join mst_user usr on dtl.userid = usr.userid 
inner join mst_store store on dtl.storeid = store.id
inner join mst_batch bch on dtl.batchid = bch.id
left join ord_purchaseorder ord on dtl.POId = ord.POId
where dtl.itemid = @ItemId and dtl.storeid = @StoreId 
and CONVERT(datetime,CONVERT(VARCHAR(10),dtl.transactiondate,10)) >= CONVERT(datetime,CONVERT(VARCHAR(10),@FromDate,10)) 
and CONVERT(datetime,CONVERT(VARCHAR(10),dtl.transactiondate,10)) <= CONVERT(datetime,CONVERT(VARCHAR(10),@ToDate,10))
--order by dtl.transactiondate asc
 
OPEN rt_cursor
 
FETCH NEXT FROM rt_cursor INTO @transactiodate,@voucherNo,@username,@receipts,@issues,@batch,@expirydate,@balanceBF
 
WHILE @@FETCH_STATUS = 0
 BEGIN
 SET @balance = @balance + @receipts + @issues + @balanceBF
 INSERT @tempTbl VALUES (@transactiodate,@voucherNo,@username,@receipts,@issues,@batch,@expirydate,@balance)
 FETCH NEXT FROM rt_cursor INTO @transactiodate,@voucherNo,@username,@receipts,@issues,@batch,@expirydate,@balanceBF
 END
 
CLOSE rt_cursor
DEALLOCATE rt_cursor
 
SELECT * FROM @tempTbl order by [Date] asc

-----3
select facilitylogo from mst_facility where facilityid = @LocationId                                           
                        
                                     
END

GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_DeletePurchaseOrderItem_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[pr_SCM_DeletePurchaseOrderItem_Futures]    
@POId  int    
as     
begin     
delete dtl_purchaseItem where POId =  @POId  
delete dtl_StockTransaction where POId =  @POId  

end

GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetPharmacyDetailsByDispenced_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[pr_SCM_GetPharmacyDetailsByDispenced_Futures]
@Ptn_Pharmacy_Pk int                    
                    
as                    
                    
begin                    
                    
 select 
 case when a.Weight = 0 then isnull(c.weight,0) else isnull(a.weight,0) end as [Weight],
 case when a.Height = 0 then isnull(c.height,0) else isnull(a.height,0) end as [Height],
 a.ProgID,a.PharmacyPeriodTaken,a.ProviderID,
a.RegimenLine ,b.AppDate,isnull(b.AppReason,0)AppReason
from ord_PatientPharmacyOrder a left outer join  dtl_PatientAppointment b on a.visitid=b.Visit_pk 
left outer join dtl_patientvitals c on a.visitid = c.visit_pk
where a.ptn_pharmacy_pk=@Ptn_Pharmacy_Pk                   
end

GO
/****** Object:  StoredProcedure [dbo].[Pr_SCM_GetPharmacyDispenseMasters_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[Pr_SCM_GetPharmacyDispenseMasters_Futures]                  
@Ptn_Pk int,                  
@StoreId int                  
as                  
begin
                  
 Declare @druglen int,  @currdate datetime;

select @currdate = getdate();
/*
Select @druglen = Max(Len(a.DrugName))
From dbo.Mst_Drug a
Left Outer Join dbo.Dtl_StockTransaction b
	On a.Drug_Pk = b.ItemId
Inner Join dbo.Lnk_DrugStrength s
	On s.DrugId = a.Drug_Pk
Inner Join dbo.Mst_Strength t
	On t.StrengthId = s.StrengthId
Left Outer Join dbo.Mst_Batch c
	On b.BatchId = c.Id
Left Outer Join dbo.Mst_DispensingUnit d
	On a.DispensingUnit = d.Id
Left Outer Join (Select Distinct e.ItemId
	From dbo.Lnk_ProgramItem e
	Inner Join dbo.Lnk_DonorProgram f
		On f.ProgramId = e.ProgramId And
		Getdate() >= fundingstartdate And Getdate() <= fundingenddate) z
	On z.ItemId = a.Drug_Pk
Where b.StoreId = @StoreId And b.expirydate >= Getdate()
  
If(@druglen IS NULL or @druglen=0)  
Begin
Set @druglen = 80  
End
*/

Select @druglen = 130;

--Select Top (1)	b.RegimenType As LastRegimen,
--				a.DispensedByDate As LastDispense,
--				(Select Top 1 M.RegimenType From dtl_RegimenMap M Where M.Ptn_Pk=@Ptn_Pk And 
--				(M.DeleteFlag Is Not Null Or M.DeleteFlag=0) 
--				And RegimenType Is Not Null Order By 1
--				) CurrentRegimen
--From ord_PatientPharmacyOrder As a
--Left Outer Join dtl_RegimenMap As b On a.Ptn_pk = b.Ptn_Pk
--And a.ptn_pharmacy_pk = b.OrderID
--Inner Join dtl_PatientPharmacyOrder As c On a.ptn_pharmacy_pk = c.ptn_pharmacy_pk
--Where (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
--And (a.Ptn_pk = @Ptn_Pk)
--And (a.DispensedByDate Is Not Null)
--Order By LastDispense Desc;
Select Top (1)	b.RegimenType As LastRegimen
				,a.DispensedByDate As LastDispense
				,CR.RegimenType CurrentRegimen
				,CR.OrderedByDate CurrentRegimenPrescriptionDate
				,CR.DispensedByDate CurrentRegimenDispenseDate
				,CR.CurrentRegimenLine
				,(
					Select Top 1 P.AppDate
					From dtl_PatientAppointment P
					Where P.Ptn_pk = @Ptn_Pk
					And P.AppReason = (
						Select top 1 Id
						From mst_decode
						Where name = 'Pharmacy Refill'
					)
					Order By P.AppDate Desc
				)
				NextRefillDate
				,(
					Select Top 1 PV.Height

					From dtl_patientvitals PV
					Inner Join ord_visit OV On PV.Visit_pk = OV.Visit_Id
					Where PV.ptn_pk = @Ptn_Pk
					And PV.Height Is Not Null
					Order By OV.VisitDate Desc
				)
				RecentHeight
				,(
					Select Top 1 PV.[Weight]

					From dtl_patientvitals PV
					Inner Join ord_visit OV On PV.Visit_pk = OV.Visit_Id
					Where PV.ptn_pk = @Ptn_Pk
					And PV.Weight Is Not Null
					And OV.VisitDate Between dateadd(Day, -7, @currdate) And @currdate
					Order By OV.VisitDate Desc
				)
				RecentWeight
From ord_PatientPharmacyOrder As a
Left Outer Join dtl_RegimenMap As b On a.Ptn_pk = b.Ptn_Pk
And a.ptn_pharmacy_pk = b.OrderID
Inner Join dtl_PatientPharmacyOrder As c On a.ptn_pharmacy_pk = c.ptn_pharmacy_pk
Left Outer Join (
	Select Top 1	M.RegimenType
					,O.DispensedByDate
					,O.OrderedByDate
					,M.Ptn_Pk
					,(
						Select Top 1 R.RegimenName
						From mst_Regimen R
						Where R.RegimenID = O.RegimenLine
					)
					CurrentRegimenLine
	From dtl_RegimenMap M
	Inner Join ord_PatientPharmacyOrder O On O.VisitID = M.Visit_Pk
		And O.Ptn_pk = @Ptn_Pk
	Where M.Ptn_Pk = @Ptn_Pk
	And (M.DeleteFlag Is Not Null Or M.DeleteFlag = 0)
	And RegimenType Is Not Null
	And O.DispensedByDate Is Not Null
	--Order By 1
	order by O.DispensedByDate desc
) CR On CR.Ptn_Pk = A.Ptn_pk
Where (a.DeleteFlag = 0 Or a.DeleteFlag Is Null)
And (a.Ptn_pk = @Ptn_Pk)
And (a.DispensedByDate Is Not Null)
Order By LastDispense Desc;

With CTE
As (
	Select	a.Drug_Pk
			,a.ItemTypeID
			,a.DrugName
			,isnull(c.Name, '')																											[BatchNo]
			,c.Id																														[BatchId]
			,isnull(d.Name, '')																											[DispensingUnit]
			,isnull(d.Id, 0)																											[DispensingId]
			,
			--Isnull(dbo.fn_GetSellingPrice_Futures(a.Drug_Pk, c.Id, b.ExpiryDate, @StoreId), 0.00) 
			a.SellingUnitPrice																											[SellingPrice]
			,a.SellingUnitPrice																											[ConfigSellingPrice]
			,isnull(b.ExpiryDate, '')																									[ExpiryDate]
			,dbo.fn_GetItemStock_Futures(a.Drug_Pk, c.Id, b.ExpiryDate, @StoreId)														[AvailQty]
			,isnull(a.DispensingUnitPrice, 0)																							[CostPrice]
			,Case
				When z.ItemId > 0 Then 1
				Else 0
			End																															[Funded]
			,isnull(a.DispensingMargin, 0)																								[DispensingMargin]
			,t.StrengthId
			,a.DrugName + ' Batch: ' + isnull(c.Name, '') + ' Exp: ' + convert(varchar(11), isnull(b.ExpiryDate, ''), 113) + ' Qty: ' +
			convert(varchar(20), dbo.fn_GetItemStock_Futures(a.Drug_Pk, c.Id, b.ExpiryDate, @StoreId))									[DisplayItem]
			,(convert(varchar, a.Drug_Pk) + '-' + convert(varchar, c.Id) + '-' + convert(varchar(11), isnull(b.ExpiryDate, ''), 113))	[DisplayItemId]
			,dbo.fn_GetDrugTypeId_futures(a.Drug_Pk)																					[DrugTypeId]
			,isnull(dbo.fn_Drug_Abbrev_Constella(a.Drug_Pk), '')																		[GenericAbb]
			,isnull(c.Name, '') + '(' + convert(varchar(20), dbo.fn_GetItemStock_Futures(a.Drug_Pk, c.Id, b.ExpiryDate, @StoreId)) + ')' + '~' + isnull(convert(varchar(20), b.ExpiryDate, 106), '') [BatchQty]
	From dbo.Mst_Drug a
	Left Outer Join dbo.Dtl_StockTransaction b On a.Drug_Pk = b.ItemId
	Inner Join dbo.Lnk_DrugStrength s On s.DrugId = a.Drug_Pk
	Inner Join dbo.Mst_Strength t On t.StrengthId = s.StrengthId
	Left Outer Join dbo.Mst_Batch c On b.BatchId = c.Id
	Left Outer Join dbo.Mst_DispensingUnit d On a.DispensingUnit = d.Id
	Left Outer Join (
		Select Distinct e.ItemId
		From dbo.Lnk_ProgramItem e
	Inner Join dbo.Lnk_DonorProgram f On f.ProgramId = e.ProgramId	And @currdate >= fundingstartdate	And @currdate <= fundingenddate
	) z On z.ItemId = a.Drug_Pk
	Left Outer Join dbo.fn_Billing_PriceList(Null, Null, @currdate) Price On Price.ItemID = a.Drug_pk
		And Price.ItemTypeID = a.ItemTypeID
	Where b.StoreId = @StoreId
	And b.expirydate >= @currdate
	And  (a.DeleteFlag Is Null OR a.DeleteFlag = 0 )
	Group By a.Drug_Pk, a.DrugName, c.Name, c.Id, d.Name, d.Id, a.SellingUnitPrice, a.ItemTypeID, b.ExpiryDate, z.ItemId, t.StrengthId, a.dispensingunitprice, a.Dispensingmargin
)
Select *
From CTE
Where AvailQty > 0
order by ExpiryDate asc


End


GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetPharmacyOrderDetail_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[pr_SCM_GetPharmacyOrderDetail_Futures]                      
@Ptn_Pharmacy_Pk int
as                      
                      
begin

Select Distinct	a.Drug_Pk [ItemId]
				,a.DrugName [ItemName]
				,a.[Dispensing Unit Id] [DispensingUnitId]
				,a.[Dispensing Unit] [DispensingUnitName]
				,a.OrderedByDate
				,a.BatchId
				,a.BatchNo
				,a.StrengthId
				,a.FrequencyId
				,a.FrequencyName
				,CONVERT(varchar(11), a.ExpiryDate, 113) [ExpiryDate]
				,a.pillCount
				,a.DispensedQuantity [QtyDisp]
				,a.WhyPartial
				,a.CostPrice
				,a.Margin
				,a.SellingPrice
				,a.BillAmount
				,a.Prophylaxis
				,a.DrugTypeId [ItemType]
				,a.RegimenType [GenericAbb]
				,0 [ReturnQty]
				,Null [ReturnReason]
				,a.UnitSellingPrice
				,a.visitId
				,a.OrderedQuantity
				,'0' DataStatus
				,a.SingleDose 'Dose'
				,a.Duration
				,a.PrintPrescriptionStatus
				,a.PatientInstructions,
				a.DispensedByDate,
				Isnull(ProgId,0) ProgId,
				Convert(bit, 1) Valid,
				a.FreqMultiplier
From vw_patientpharmacy a
Where a.ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk;

--Select Top 1	DispensedByDate
--				,ISNULL(ProgId, 0) [ProgId]
--From vw_patientpharmacy
--Where ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk


Select	O.Ptn_pk
	,	O.VisitID
	,	O.PharmacyPeriodTaken
	,	O.ReportingID
	,	O.orderstatus
	,	nullif(O.PharmacyNotes,'') PharmacyNotes
From ord_PatientPharmacyOrder O
Where O.ptn_pharmacy_pk = @Ptn_Pharmacy_Pk


End

GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetPurchaseOrderDetailsByPoid_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_SCM_GetPurchaseOrderDetailsByPoid_Futures] @POid INT    
AS     
    BEGIN                                   
                            
		Select	ord.POId
			,	ord.LocationID
			,	ord.SupplierID
			,	sup.SupplierName
			,	convert(varchar(100), ord.OrderDate, 106)	As OrderDate
			,	ord.AuthorizedBy
			,	emp1.FirstName + ' ' + emp1.LastName		As AuthorizeName
			,	ord.PreparedBy
			,	emp2.FirstName + ' ' + emp2.LastName		As PreparedName
			,	ord.Status
			,	ord.SourceStoreID
			,	str1.Name									As SourceStoreName
			,	ord.DestinStoreID
			,	str2.Name									As DestinationStoreName
			,	ord.UserID
			,	ord.OrderNo
			,	IsNull(ord.PONumber, OrderNo) PONumber
		From ord_PurchaseOrder As ord
		Left Outer Join Mst_Supplier As sup On ord.SupplierID = sup.Id
		Left Outer Join Mst_Store As str1 On str1.Id = ord.SourceStoreID
		Left Outer Join Mst_Store As str2 On str2.Id = ord.DestinStoreID
		Left Outer Join mst_Employee As emp1 On emp1.EmployeeID = ord.AuthorizedBy
		Left Outer Join mst_Employee As emp2 On emp2.EmployeeID = ord.PreparedBy
		Where (ord.POId = @POid)                           
                            
--select a.POId,b.DrugID [ItemCode],a.ItemId,a.Quantity [OrderQuantity],a.Quantity * a.PurchasePrice [TotPrice] ,a.PurchasePrice [Price],a.Unit[UnitID],c.Name[Units] ,a.UserId                           
--from dtl_PurchaseItem a left outer join mst_drug b                          
--on a.ItemId =b.Drug_pk left outer join mst_dispensingUnit c on b.PurchaseUnit= c.ID                          
--where a.POId =@POid                         
        DECLARE @ISTstoreID INT                       
        SET @ISTstoreID = 0                      
        SELECT  @ISTstoreID = SourceStoreID    
        FROM    ord_PurchaseOrder    
        WHERE   supplierid = 0    
                AND destinStoreID > 0    
                AND poid = @POid                      
        IF ( @ISTstoreID > 0 )     
            BEGIN                
            
                
                SELECT  a.POId ,    
                        b.DrugID [ItemCode] ,    
                        CONVERT(VARCHAR(100), a.ItemId) + '-'    
                        + CONVERT(VARCHAR(100), a.BatchID) + '-'    
                        + CONVERT(VARCHAR, a.ExpiryDate, 101) [ItemID]              
--a.ItemId,              
                        ,    
                        b.DrugName,    
                        a.Quantity [OrderQuantity] , 
						a.IssuedQuantity ,   
						-d.Quantity IssuedQuantityDU,
                        a.Quantity * a.PurchasePrice [TotPrice] ,    
                        a.PurchasePrice [Price] ,    
                        a.Unit [UnitID] ,    
                        c.Name [Units] ,    
                        a.UserId ,    
                        a.UnitQuantity ,    
                        z.[TotalAmount] ,    
                        0 [Isfunded] ,    
                        b.DrugName + '^' + e.Name + '^'    
                        + REPLACE(CONVERT(VARCHAR, a.ExpiryDate, 106), ' ',    
                                  '-') [ItemName] ,    
                        a.BatchID ,    
                        a.AvaliableQty ,    
                        a.ExpiryDate ,    
                        e.Name [BatchName] ,    
                        a.AvaliableQty [AvailableQTY]    
                FROM    dtl_PurchaseItem a    
                        LEFT OUTER JOIN mst_drug b ON a.ItemId = b.Drug_pk    
                        LEFT OUTER JOIN mst_dispensingUnit c ON b.PurchaseUnit = c.ID    
                        LEFT OUTER JOIN lnk_storeitem ON b.Drug_Pk = lnk_storeitem.ItemId    
                        LEFT OUTER JOIN mst_Store ON lnk_storeitem.StoreId = mst_Store.Id    
                        LEFT OUTER JOIN dtl_StockTransaction d ON mst_Store.Id = d.StoreId    
                                                              AND a.ItemId = d.ItemId    
                                                              AND d.BatchId = a.BatchID    
                                                              AND a.ExpiryDate = d.ExpiryDate    
                        LEFT OUTER JOIN Mst_Batch e ON a.BatchId = e.Id    
                        CROSS APPLY ( SELECT    SUM(a.Quantity    
                                                    * a.PurchasePrice) [TotalAmount]    
                                      FROM      dtl_PurchaseItem a    
                                                LEFT OUTER JOIN mst_drug b ON a.ItemId = b.Drug_pk    
                                                LEFT OUTER JOIN mst_dispensingUnit c ON b.PurchaseUnit = c.ID    
                                      WHERE     a.POId = @POid    
                                    ) z             
------cross apply            
------(select sum(m.Quantity)[AvailableQTY]                          
------from dbo.Mst_Drug x inner join lnk_storeitem  lkitem on x.Drug_Pk = lkitem.ItemId                                    
------Inner join mst_Store mstr on lkitem.StoreId = mstr.Id                           
------Left Outer Join dtl_StockTransaction m on mstr.Id = m.StoreId and x.Drug_Pk = m.ItemId                             
------where m.StoreId=@ISTstoreID  and x.Drug_Pk= b.Drug_Pk and m.BatchId=a.BatchID and m.ExpiryDate=a.ExpiryDate                                 
------)y                        
                WHERE   a.POId = @POid  and d.poid = @POid  
                        AND mst_Store.Id = @ISTstoreID    
                GROUP BY a.POId ,    
                        b.DrugID ,    
                        ( CONVERT(VARCHAR(100), a.ItemId) + '-'    
                          + CONVERT(VARCHAR(100), a.BatchID) + '-'    
                          + CONVERT(VARCHAR, a.ExpiryDate, 101) ) ,    
                          b.DrugName,    
                        a.Quantity ,    
						a.IssuedQuantity,
						d.Quantity,
                        a.Quantity * a.PurchasePrice ,    
                        a.PurchasePrice ,    
                        a.Unit ,    
                        c.Name ,    
                        a.UserId ,    
                        a.UnitQuantity                  
--,z.[TotalAmount]              
                        ,    
                        b.DrugName + '^' + e.Name + '^'    
                        + REPLACE(CONVERT(VARCHAR, a.ExpiryDate, 106), ' ',    
                                  '-') ,    
                        a.BatchID ,    
                        a.AvaliableQty ,    
                        a.ExpiryDate ,    
                        e.Name ,    
                        z.[TotalAmount]             
--,y.[AvailableQTY]               
                
            END                 
        ELSE     
            BEGIN                
                        
                SELECT  a.POId ,    
                        b.DrugID [ItemCode] ,    
                        a.ItemId ,    
                        b.DrugName,    
                        a.Quantity [OrderQuantity] ,    
						a.IssuedQuantity,
						d.Quantity IssuedQuantityDU,
                        a.Quantity * a.PurchasePrice [TotPrice] ,    
                        a.PurchasePrice [Price] ,    
                        a.Unit [UnitID] ,    
                        c.Name [Units] ,    
                        a.UserId ,    
                        a.UnitQuantity ,    
                        z.[TotalAmount] ,  
						e.Name BatchName,
						e.ExpiryDate,  
                        ( SELECT DISTINCT    
                                    CASE WHEN f.donorid > 0 THEN 1    
                                         ELSE 0    
                                    END [Isfunded]    
                          FROM      Mst_Drug c    
                                    INNER JOIN Lnk_ProgramItem e ON e.ItemId = c.Drug_Pk    
                                    INNER JOIN Lnk_DonorProgram f ON f.ProgramId = e.ProgramId    
                                                              AND CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 106)) >= CONVERT(DATETIME, CONVERT(VARCHAR, fundingstartdate, 106))    
                                                              AND CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 106)) <= CONVERT(DATETIME, CONVERT(VARCHAR, FundingEndDate, 106))    
                          WHERE     c.Drug_Pk = a.ItemId    
                          GROUP BY  c.Drug_Pk ,    
                                    f.donorid    
                        ) [Isfunded]    
                FROM    dtl_PurchaseItem a    
                        LEFT OUTER JOIN mst_drug b ON a.ItemId = b.Drug_pk    
                        LEFT OUTER JOIN mst_dispensingUnit c ON b.PurchaseUnit = c.ID   
						left outer join mst_batch e on a.batchid = e.Id 
						left outer join dtl_stocktransaction d on a.ItemId = d.ItemId    
                                                              AND d.BatchId = a.BatchID    
                                                              AND a.ExpiryDate = d.ExpiryDate
                        CROSS APPLY ( SELECT    SUM(a.Quantity    
                                                    * a.PurchasePrice) [TotalAmount]    
                                      FROM      dtl_PurchaseItem a    
                                                LEFT OUTER JOIN mst_drug b ON a.ItemId = b.Drug_pk    
                                                LEFT OUTER JOIN mst_dispensingUnit c ON b.PurchaseUnit = c.ID    
                                      WHERE     a.POId = @POid    
                                    ) z    
                WHERE   a.POId = @POid  and d.poid = @POid                      
                  
            END                     
                      
--select distinct  c.Drug_Pk,                                       
--case when f.donorid > 0 then 1 else 0 end [Isfunded]                                        
--from Mst_Drug c inner Join Lnk_ProgramItem e on e.ItemId = c.Drug_Pk                      
--inner Join Lnk_DonorProgram f on f.ProgramId = e.ProgramId and getdate()>=fundingstartdate and getdate()<= fundingenddate                      
--group by  c.Drug_Pk,f.donorid                            
                                
    END


GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_GetStockSummary_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_SCM_GetStockSummary_Futures]                                                        
@StoreId int=NULL,                                                    
@ItemId int=NULL,                                                    
@FromDate datetime=NULL,                                                    
@ToDate datetime=NULL                                                    
                                                        
AS                                                                  
BEGIN
--0                                                    
Set @Todate = dateadd(dd, 1, @Todate)
Set @ItemId = Case When @ItemId = 0 Then Null Else @ItemId End

Select Distinct	ls.StoreID	As StoreId
			,	md.Drug_pk
			,	md.DrugName
From lnk_StoreItem As ls
Inner Join Mst_Drug As md On ls.ItemId = md.Drug_pk
--Inner Join Dtl_StockTransaction As dt On md.Drug_pk = dt.ItemId
Where (ls.StoreID = @StoreId)
Group By	ls.StoreID
		,	md.Drug_pk
		,	md.DrugName
Order By md.Drug_pk
--1                                
Select	Drg.Drug_Pk																																			[ItemId]
	,	Drg.DrugName																																		[ItemName]
	,	Unit.Name																																			[DispensingUnit]
	,	P.OpeningQuantity																																	[OpeningStock]
	,	Recq.RecQty																																			[QtyRecieved]
	,	r.IssQty																																			[QtyDispensed]
	,	s.InterStoreIssueQty
	,	(isnull(P.OpeningQuantity, 0) + isnull(Recq.RecQty, 0) + isnull(t.AdjustmentQuantity, 0)) - (isnull(s.InterstoreIssueQty, 0) + isnull(R.IssQty, 0))	[ClosingQty]
	,	@StoreId																																			[StoreId]
	,	(	Select Top 1 Name		From Mst_Store		Where Id = @StoreId		)	[StoreName]
	,	t.AdjustmentQuantity
From Mst_Drug Drg
Left Outer Join Mst_DispensingUnit Unit On Drg.DispensingUnit = Unit.Id
Left Outer Join (
Select	tmp.drug_pk
	,	tmp.drugname
	,	tmp.dispensingunit
	,	sum(openingquantity)	[OpeningQuantity]
From (
Select	a.Drug_Pk
	,	a.DrugName
	,	c.Name			[DispensingUnit]
	,	sum(b.Quantity)	[OpeningQuantity]
From mst_drug a
Left Outer Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
Where b.storeid = @StoreId 
	And b.ExpiryDate >= @FromDate 
	And transactiondate >= @FromDate 
	And transactiondate < @ToDate 
	And openingstock = 1 
	And (a.Drug_pk = @ItemId Or @ItemId Is Null)
Group By	a.drug_pk
		,	a.drugname
		,	c.name
Union
Select	a.Drug_Pk
	,	a.DrugName
	,	c.Name																	[DispensingUnit]
	,	nullif(dbo.fn_GetItemOpeningStock(a.Drug_pk, @StoreId, @FromDate), 0)	[OpeningQuanitity]
From mst_drug a
Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
Group By	a.drug_pk
		,	a.drugname
		,	c.name
) tmp
Group By	tmp.drug_pk
		,	tmp.drugname
		,	tmp.dispensingunit
) p On Drg.Drug_Pk = p.Drug_pk
Left Outer Join (
Select	q.drug_pk
	,	q.drugname
	,	q.dispensingunit
	,	sum(q.RecQty)	[RecQty]
From       
(
Select	a.Drug_Pk
	,	a.DrugName
	,	c.Name			[DispensingUnit]
	,	sum(Quantity)	[RecQty]
From mst_drug a
Inner Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
Where b.Openingstock Is Null 
	And b.AdjustId Is Null 
	And b.storeid = @StoreId --And (b.GrnId Is Not Null Or b.GrnId > 0) 
	And b.Quantity > 0 
	And b.ExpiryDate >= @FromDate
	 And b.transactiondate >= @FromDate And b.transactiondate < @ToDate
Group By	a.drug_pk
		,	a.drugname
		,	c.name
Having sum(Quantity) >= 0
) q
Group By	q.drug_pk
		,	q.drugname
		,	q.dispensingunit
) Recq On Drg.Drug_Pk = Recq.Drug_Pk
Left Outer Join (
	Select	a.Drug_Pk
		,	a.DrugName
		,	c.Name				[DispensingUnit]
		,	abs(sum(Quantity))	[IssQty]
	From mst_drug a
	Inner Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
	Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
	Where b.storeid = @StoreId 
		And b.Ptn_Pharmacy_pk > 0 
		And b.ExpiryDate >= @FromDate 
		And b.transactiondate >= @FromDate 
		And b.transactiondate < @ToDate
	Group By	b.StoreId
			,	a.drug_pk
			,	a.drugname
			,	c.name
) r On Drg.Drug_Pk = r.Drug_Pk
Left Outer Join (
	Select	a.Drug_Pk
		,	a.DrugName
		,	c.Name				[DispensingUnit]
		,	sum(abs(Quantity))	[InterStoreIssueQty]
	From mst_drug a
	Inner Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
	Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
	Where b.storeid = @StoreId 
		--And (b.GrnId Is Not Null Or b.GrnId > 0) 
		And b.Quantity < 0 And b.ExpiryDate >= @FromDate 
		And b.transactiondate >= @FromDate
		And b.transactiondate < @ToDate
		And (a.Drug_pk = @ItemId Or @ItemId Is Null)
	Group By	a.drug_pk
			,	a.drugname
			,	c.name
) s On Drg.Drug_Pk = s.Drug_Pk
Left Outer Join (
	Select	a.Drug_Pk
		,	a.DrugName
		,	c.Name			[DispensingUnit]
		,	sum(b.Quantity)	[AdjustmentQuantity]
	From mst_drug a
	Inner Join dtl_stocktransaction b On a.Drug_Pk = b.ItemId
	Left Outer Join Mst_DispensingUnit c On a.DispensingUnit = c.Id
	Where b.storeid = @StoreId 
		And b.ExpiryDate >= @FromDate 
		And b.AdjustId Is Not Null 
		And b.transactiondate >= @FromDate 
		And b.transactiondate < @ToDate
		And (a.Drug_pk = @ItemId Or @ItemId Is Null)
	Group By	a.drug_pk
			,	a.drugname
			,	c.name
) t On Drg.Drug_Pk = t.Drug_Pk

Where (p.OpeningQuantity Is Not Null Or Recq.RecQty Is Not Null Or r.IssQty Is Not Null Or s.InterStoreIssueQty Is Not Null)
	And (Drg.Drug_pk = @ItemId Or @ItemId Is Null)
Order By Drg.DrugName



End

GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveDisposeItems_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_SCM_SaveDisposeItems_Futures]                                 
@LocationId int=NULL,                        
@StoreId int=NULL,      
@DisposeDate datetime=NULL,        
@DisposePreparedBy int=NULL,  
@DisposeAuthorisedBy int=NULL,     
@UserId int=NULL,   
@ItemId int=NULL,  
@DisposeId int=NULL,  
@BatchId int=NULL,  
@Quantity int=NULL,  
@ExpiryDate datetime=NULL,  
@TransactionDate datetime=NULL  
                                
AS                                
BEGIN           
  
if not exists(Select * from Ord_DisposeStock where DisposeId=@DisposeId)  
 Begin                                               
  insert into Ord_DisposeStock(LocationId, StoreId, DisposeDate, DisposePreparedBy, DisposeAuthorisedBy, UserId,CreateDate)                                 
  values(@LocationId,@StoreId,getdate(), @UserId, @UserId, @UserId,getdate())       
  Select ident_current('Ord_DisposeStock')[DisposeId];                           
 End  
if (@DisposeId > 0)   
 Begin                           
  insert into Dtl_StockTransaction(ItemId, DisposeId,BatchId, StoreId, Quantity, ExpiryDate, TransactionDate, UserID,CreateDate,transactionType)                                 
  values(@ItemId,@DisposeId, @BatchId,@StoreId,@Quantity, @ExpiryDate, getdate(),@UserId,getdate(),'Dispose')                                
    End                                         
END

GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveOpeningStock_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_SCM_SaveOpeningStock_Futures]                                 
@ItemId int,                        
@BatchId int,      
@StoreId int,                        
@Quantity int,        
@ExpiryDate varchar(11),   
@TransactionDate Datetime,     
@UserId int      
                                   
AS                                
BEGIN           



                                                                      
                                                                           
insert into Dtl_StockTransaction(ItemId, BatchId, StoreId, Quantity, ExpiryDate, TransactionDate, OpeningStock,UserID,CreateDate,transactionType)                                 
values(@ItemId,@BatchId,@StoreId,@Quantity, @ExpiryDate, @TransactionDate, 1, @UserId,getdate(),'Opening Stock')                                
                                           
END

GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePharmacyDispenseOrderDetail_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pr_SCM_SavePharmacyDispenseOrderDetail_Futures]                        
	@Ptn_Pk int,                        
	@StoreId int,                        
	@VisitId int,                        
	@Ptn_Pharmacy_Pk int,                        
	@Drug_Pk int,                        
	@StrengthId int,                        
	@FrequencyId int,                        
	@DispensedQuantity int,                        
	@Prophylaxis int,                        
	@BatchId int,                        
	@CostPrice decimal(18,2),                        
	@Margin decimal(18,2),                        
	@SellingPrice decimal(18,2),                        
	@BillAmount decimal(18,2),                        
	@ExpiryDate datetime,                        
	@DispensingUnit int,                        
	@DispensedByDate datetime,                        
	@LocationId int,                        
	@UserId int,          
	@DataStatus int ,  
	@Dose decimal(18,2),  
	@Duration decimal(18,2),  
	@PrescribeOrderedQuantity decimal(18,2),  
	@PrintPrescriptionStatus int,  
	@PatientInstructions varchar(500),
	@WhyPartial varchar(255) =null,
	@BatchNo varchar(50) = null,
	@pillCount int = 0  
As Begin                        
          
	declare @EntryStatus int;
	Select @BatchId = id	From mst_batch Where name = @BatchNo And itemid = @Drug_Pk

	Set @EntryStatus = 0

	If Exists (Select Drug_Pk From dbo.Dtl_PatientPharmacyOrder	Where Drug_Pk = @Drug_Pk And DispensedQuantity = 0	And Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk) Begin
		Set @EntryStatus = 1

		Update dbo.Dtl_PatientPharmacyOrder Set
			DispensedQuantity = @DispensedQuantity
			,pillCount = @pillCount
			, BatchNo = @BatchId
			, ExpiryDate = @ExpiryDate
			, UserId = @UserId
			, UpdateDate = GETDATE()
			, SingleDose = @Dose
			, Duration = @Duration
			, OrderedQuantity = @PrescribeOrderedQuantity
			, PrintPrescriptionStatus = @PrintPrescriptionStatus
			, PatientInstructions = @PatientInstructions
			,WhyPartial = nullif(@WhyPartial,'')
		Where Ptn_Pharmacy_pk = @Ptn_Pharmacy_Pk
		And Drug_Pk = @Drug_Pk;

		Insert Into dbo.Dtl_PatientBillTransaction (
			Ptn_Pk
			,VisitId
			,LocationId
			,TransactionDate
			,LabId
			,PharmacyId
			,ItemId
			,BatchId
			,DispensingUnit
			,Quantity
			,SellingPrice
			,CostPrice
			,Margin
			,ConsultancyFee
			,AdminFee
			,BillAmount
			,DoctorId
			,UserId
			,CreateDate)
		Values (
			@Ptn_Pk
			,@VisitId
			,@LocationId
			,@DispensedByDate
			,0
			,@Ptn_Pharmacy_pk
			,@Drug_Pk
			,@BatchId
			,@DispensingUnit
			,@DispensedQuantity
			,@SellingPrice
			,@CostPrice
			,@Margin
			,0
			,0
			,@BillAmount
			,0
			,@UserId
			,GETDATE())

		Insert Into dbo.Dtl_StockTransaction (
			ItemId
			,BatchId
			,Ptn_Pharmacy_Pk
			,PtnPk
			,StoreId
			,TransactionDate
			,Quantity
			,ExpiryDate
			,PurchasePrice
			,SellingPrice
			,Margin
			,UserId
			,CreateDate
			,transactionType)
		Values (
			@Drug_Pk
			,@BatchId
			,@Ptn_Pharmacy_Pk
			,@Ptn_Pk
			,@StoreId
			,@DispensedByDate
			,'-' + CONVERT(varchar, @DispensedQuantity)
			,@ExpiryDate
			,@CostPrice
			,@SellingPrice
			,@Margin
			,@UserId
			,GETDATE()
			,'Dispense')
	End


	If Not Exists (Select	Drug_Pk	From dbo.Dtl_PatientPharmacyOrder Where Drug_Pk = @Drug_Pk	And BatchNo = @BatchId	And ExpiryDate = @ExpiryDate And Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk) Begin
		Set @EntryStatus = 1
	
		Insert Into dbo.Dtl_PatientPharmacyOrder (
			Ptn_Pharmacy_Pk
			,Drug_Pk
			,GenericId
			,StrengthId
			,FrequencyId
			,DispensedQuantity
			,UserId
			,CreateDate
			,Prophylaxis
			,BatchNo
			,ExpiryDate
			,SingleDose
			,Duration
			,OrderedQuantity
			,PrintPrescriptionStatus
			,WhyPartial
			,PatientInstructions
			,pillCount)
		Values (
			@Ptn_Pharmacy_Pk
			,@Drug_Pk
			,0
			,@StrengthId
			,@FrequencyId
			,@DispensedQuantity
			,@UserId
			,GETDATE()
			,@Prophylaxis
			,@BatchId
			,@ExpiryDate
			,@Dose
			,@Duration
			,@PrescribeOrderedQuantity
			,@PrintPrescriptionStatus
			,nullif(@WhyPartial,'')
			,@PatientInstructions
			,@pillCount)

		Insert Into dbo.Dtl_PatientBillTransaction (
			Ptn_Pk
			,VisitId
			,LocationId
			,TransactionDate
			,LabId
			,PharmacyId
			,ItemId
			,BatchId
			,DispensingUnit
			,Quantity
			,SellingPrice
			,CostPrice
			,Margin
			,ConsultancyFee
			,AdminFee
			,BillAmount
			,DoctorId
			,UserId
			,CreateDate)
		Values (
			@Ptn_Pk
			,@VisitId
			,@LocationId
			,@DispensedByDate
			,0
			,@Ptn_Pharmacy_pk
			,@Drug_Pk
			,@BatchId
			,@DispensingUnit
			,@DispensedQuantity
			,@SellingPrice
			,@CostPrice
			,@Margin
			,0
			,0
			,@BillAmount
			,0
			,@UserId
			,GETDATE())
		Insert Into dbo.Dtl_StockTransaction (
			ItemId
			,BatchId
			,Ptn_Pharmacy_Pk
			,PtnPk
			,StoreId
			,TransactionDate
			,Quantity
			,ExpiryDate
			,PurchasePrice
			,SellingPrice
			,Margin
			,UserId
			,CreateDate
			,transactionType)
		Values (
			@Drug_Pk
			,@BatchId
			,@Ptn_Pharmacy_Pk
			,@Ptn_Pk
			,@StoreId
			,@DispensedByDate
			,'-' + CONVERT(varchar, @DispensedQuantity)
			,@ExpiryDate
			,@CostPrice
			,@SellingPrice
			,@Margin
			,@UserId
			,GETDATE()
			,'Dispense')
	End

	If (@EntryStatus = 0 And @DataStatus = 1) Begin
		Insert Into dbo.Dtl_PatientPharmacyOrder (
			Ptn_Pharmacy_Pk
			,Drug_Pk
			,GenericId
			,StrengthId
			,FrequencyId
			,DispensedQuantity
			,UserId
			,CreateDate
			,Prophylaxis
			,BatchNo
			,ExpiryDate
			,SingleDose
			,Duration
			,OrderedQuantity
			,PrintPrescriptionStatus
			,WhyPartial
			,PatientInstructions
			,pillCount)
		Values (
			@Ptn_Pharmacy_Pk
			,@Drug_Pk
			,0
			,@StrengthId
			,@FrequencyId
			,@DispensedQuantity
			,@UserId
			,GETDATE()
			,@Prophylaxis
			,@BatchId
			,@ExpiryDate
			,@Dose
			,@Duration
			,@PrescribeOrderedQuantity
			,@PrintPrescriptionStatus
			,nullif(@WhyPartial,'')
			,@PatientInstructions
			,@pillCount);

		Declare @duraction1 decimal(18, 2), @Qty1 decimal(18, 2);

		Select Top 1	@duraction1 = Duration
						,@Qty1 = OrderedQuantity
		From dbo.Dtl_PatientPharmacyOrder
		Where Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk
		And Drug_Pk = @Drug_Pk
		And Duration Is Not Null
		And OrderedQuantity Is Not Null;

		Update dbo.Dtl_PatientPharmacyOrder Set
			Duration = @duraction1
			, OrderedQuantity = @Qty1
		Where Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk
		And Drug_Pk = @Drug_Pk
		And Duration Is Null
		And OrderedQuantity Is Null;

		Insert Into dbo.Dtl_PatientBillTransaction (
			Ptn_Pk
			,VisitId
			,LocationId
			,TransactionDate
			,LabId
			,PharmacyId
			,ItemId
			,BatchId
			,DispensingUnit
			,Quantity
			,SellingPrice
			,CostPrice
			,Margin
			,ConsultancyFee
			,AdminFee
			,BillAmount
			,DoctorId
			,UserId
			,CreateDate)
		Values (
			@Ptn_Pk
			,@VisitId
			,@LocationId
			,@DispensedByDate
			,0
			,@Ptn_Pharmacy_pk
			,@Drug_Pk
			,@BatchId
			,@DispensingUnit
			,@DispensedQuantity
			,@SellingPrice
			,@CostPrice
			,@Margin
			,0
			,0
			,@BillAmount
			,0
			,@UserId
			,GETDATE())

		Insert Into dbo.Dtl_StockTransaction (
			ItemId
			,BatchId
			,Ptn_Pharmacy_Pk
			,PtnPk
			,StoreId
			,TransactionDate
			,Quantity
			,ExpiryDate
			,PurchasePrice
			,SellingPrice
			,Margin
			,UserId
			,CreateDate
			,transactionType)
		Values (
			@Drug_Pk
			,@BatchId
			,@Ptn_Pharmacy_Pk
			,@Ptn_Pk
			,@StoreId
			,@DispensedByDate
			,'-' + CONVERT(varchar, @DispensedQuantity)
			,@ExpiryDate
			,@CostPrice
			,@SellingPrice
			,@Margin
			,@UserId
			,GETDATE()
			,'Dispense')
	End
	
	Declare @OrderedQuantity decimal(18, 2), @TotalDispensedQuantity decimal(18, 2), @TotalPillCount decimal(18, 2);

	Select @OrderedQuantity = orderedquantity	
	From dtl_patientpharmacyorder Where ptn_pharmacy_pk = @ptn_Pharmacy_Pk And Drug_Pk = @Drug_Pk;


	Select @TotalDispensedQuantity = SUM(DispensedQuantity)
	From dtl_patientpharmacyorder Where ptn_pharmacy_pk = @ptn_Pharmacy_Pk And Drug_Pk = @Drug_Pk;

	Select @TotalPillCount = SUM(PillCount)
	From dtl_patientpharmacyorder Where ptn_pharmacy_pk = @ptn_Pharmacy_Pk And Drug_Pk = @Drug_Pk;


	Declare @OrderedQuantity1 decimal(18, 2),@TotalDispensedQuantity1 decimal(18, 2),@TotalPillCount1 decimal(18, 2);

	Select @OrderedQuantity1 = SUM(z.OrderedQuantity)
	From (
		Select	Drug_Pk		,ISNULL(OrderedQuantity, 0) 'OrderedQuantity'
		From dtl_patientpharmacyorder
		Where ptn_pharmacy_pk = @ptn_Pharmacy_Pk
		Group By	Drug_Pk,OrderedQuantity
	) z
	Select @TotalDispensedQuantity1 = SUM(DispensedQuantity)
	From dtl_patientpharmacyorder
	Where ptn_pharmacy_pk = @ptn_Pharmacy_Pk;

	Select @TotalPillCount1 = SUM(PillCount)
	From dtl_patientpharmacyorder
	Where ptn_pharmacy_pk = @ptn_Pharmacy_Pk;

	Select @OrderedQuantity1
	Select @TotalDispensedQuantity1
	select @TotalPillCount1

	If (@OrderedQuantity1 <= (@TotalDispensedQuantity1 + @TotalPillCount1)) Begin
		Update ord_PatientPharmacyOrder		Set 
			OrderStatus = 2
		Where DispensedByDate Is Not Null
		And ptn_pharmacy_pk = @ptn_pharmacy_pk
	End
	
	Update ord_PatientPharmacyOrder	Set 
		OrderStatus = 3
	Where DispensedByDate Is Not Null
	And ptn_pharmacy_pk = @ptn_pharmacy_pk
	And @OrderedQuantity > (@TotalDispensedQuantity + @TotalPillCount)

End

GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePharmacyReturnDetail_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pr_SCM_SavePharmacyReturnDetail_Futures]        
@Ptn_Pk int,        
@StoreId int,        
@VisitId int,        
@Ptn_Pharmacy_Pk int,        
@Drug_Pk int,        
@StrengthId int,        
@FrequencyId int,        
@ReturnQuantity int,        
@ReturnReason int,      
@Prophylaxis int,        
@BatchId int,        
@CostPrice decimal(18,2),        
@Margin decimal(18,2),        
@SellingPrice decimal(18,2),        
@BillAmount decimal(18,2),        
@ExpiryDate datetime,        
@DispensingUnit int,        
@ReturnDate datetime,        
@LocationId int,        
@UserId int        
as        
        
begin        
      
  declare @IssueQty int      
  
  if not exists(select Ptn_Pharmacy_Pk from dtl_patientpharmacyReturn where Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk and Drug_pk = @Drug_Pk  
  and batchId = @BatchId and ExpiryDate = @ExpiryDate)  
    begin   
       insert into dbo.Dtl_PatientPharmacyReturn(Ptn_Pharmacy_Pk, Drug_Pk,StrengthId,FrequencyId,BatchId,ReturnQty,      
    ReturnReason,UserId,ExpiryDate,CreateDate)      
    values(@Ptn_Pharmacy_Pk,@Drug_pk,@StrengthId,@FrequencyId,@BatchId,@ReturnQuantity,@ReturnReason,@UserId,@ExpiryDate,getdate())      
    end  
  else  
    begin  
        Update dbo.Dtl_PatientPharmacyReturn set ReturnQty = @ReturnQuantity,UpdateDate=getdate(),UserId=@UserId where 
        Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk and Drug_pk = @Drug_Pk  
        and batchId = @BatchId  
    end  
      
  select @IssueQty = DispensedQuantity from dbo.Dtl_PatientPharmacyOrder where Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk      
  and Drug_Pk = @Drug_Pk and BatchNo = @BatchId and ExpiryDate = @ExpiryDate      
           
  Update dbo.Dtl_PatientPharmacyOrder set DispensedQuantity = (@IssueQty-@ReturnQuantity)        
  where Ptn_Pharmacy_Pk = @Ptn_Pharmacy_Pk and Drug_Pk = @Drug_Pk and BatchNo = @BatchId and ExpiryDate = @ExpiryDate      
        
  Insert into dbo.Dtl_PatientBillTransaction(Ptn_Pk,VisitId,LocationId,TransactionDate,LabId,PharmacyId,ItemId,BatchId,        
  DispensingUnit,Quantity,SellingPrice,CostPrice,Margin,ConsultancyFee,AdminFee,BillAmount,DoctorId,UserId,CreateDate)        
  Values(@Ptn_Pk, @VisitId,@LocationId,@ReturnDate,0,@Ptn_Pharmacy_pk,@Drug_Pk,@BatchId,@DispensingUnit,        
  ('-'+convert(varchar,@ReturnQuantity)),@SellingPrice,@CostPrice,@Margin,0,0,@BillAmount,0,@UserId,getdate())        
        
  Insert into dbo.Dtl_StockTransaction(ItemId,BatchId,Ptn_Pharmacy_Pk,PtnPk,StoreId,TransactionDate,Quantity,ExpiryDate,PurchasePrice,        
  SellingPrice,Margin,UserId,CreateDate,transactionType)        
  Values(@Drug_Pk,@BatchId,@Ptn_Pharmacy_Pk,@Ptn_Pk,@StoreId,@ReturnDate,@ReturnQuantity,@ExpiryDate,@CostPrice,@SellingPrice,        
  @Margin,@UserId,getdate(),'Returns')        
        
end

GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePurchaseOrderItem_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[pr_SCM_SavePurchaseOrderItem_Futures]  
(    
	@POId  int = null,      
	@ItemId int = null,  
	@ItemTypeId int =null,    
	@OrderedQuantity int = null, 
	@IssuedQuantity int = null,  
	@IssuedQuantityDU int = null,    
	@PurchasePrice decimal(9,2)= 0.0,      	 
	@UserId int = null,  
	@BatchId int = null,  
	@AvaliableQty int = null,  
	@ExpiryDate datetime = null,
	@UnitQuantity int = null,
	@SupplierId int= null,
	@SourceStoreID int = null,
	@DestinationStoreID int = null,
	@BatchName varchar(50) = null,
	@IsPOorIST int = null  -- 1 for Purchase order and 2 for Inter store transfer 
)
as       
begin

	if(@BatchName IS NOT null)
	BEGIN
		declare @tempBatchId int, @tempbatchname varchar(100), @tempExpiryDate datetime, @Indexofdelimeter int,	@maxbatchSrno int;
                         
		Select @tempBatchId = ID From Mst_Batch	Where Name = @BatchName	And ItemID = @ItemId;
	
		If(@tempBatchId Is Null) 
		Begin
			Select @maxbatchSrno = Max(SRNO)	From Mst_Batch;
			Insert Into Mst_Batch (name, UserId, CreateDate, SRNO, ItemID, ExpiryDate)
			Values (@BatchName, @UserId, Getdate(), (@maxbatchSrno + 1), @ItemId, @ExpiryDate);
			Select @tempBatchId = SCOPE_IDENTITY();
		End

		SET @BatchId = @tempBatchId
	END




	declare @rowCount int;
	Insert Into Dtl_PurchaseItem (POId,ItemId,Quantity,IssuedQuantity,PurchasePrice,UserId,CreateDate,BatchID,AvaliableQty,ExpiryDate,UnitQuantity)
	Values (@POId,@ItemId,@OrderedQuantity,@IssuedQuantity,@PurchasePrice,@UserId,getdate(),@BatchID,@AvaliableQty,@ExpiryDate,@UnitQuantity);


	Declare @tempQtyPerPurchaseUnit int, @tempTotalRecievedQuantity int, @transactionType nvarchar(50)
	Select	@tempQtyPerPurchaseUnit = QtyPerPurchaseUnit From Mst_Drug Where Drug_pk = @ItemId;

	Select @transactionType =  Case 
			When @IsPOorIST = 2 Then 'Inter store transfer' 
			Else  'Purchase Order' End;

	--Select @tempTotalRecievedQuantity =  Case 
	--		When @IsPOorIST = 2 Then @IssuedQuantity 
	--		Else  @IssuedQuantity * @tempQtyPerPurchaseUnit End; 
	--Select @tempTotalRecievedQuantity =  @IssuedQuantity * @tempQtyPerPurchaseUnit; 

	Insert Into dtl_stocktransaction (ItemId,BatchId,POId,StoreId,TransactionDate,Quantity,ExpiryDate,UserId,CreateDate,transactionType)
	Values (@ItemId,@BatchID,@POId,@DestinationStoreID,Getdate(),@IssuedQuantityDU,@ExpiryDate,@UserId,Getdate(),@transactionType);

	If (@IsPOorIST = 2) 
	Begin
		Insert Into dtl_stocktransaction (ItemId,BatchId,POId,StoreId,TransactionDate,Quantity,ExpiryDate,UserId,CreateDate,transactionType)
		Values (@ItemId,@BatchID,@POId,@SourceStoreID,Getdate(),-@IssuedQuantityDU,@ExpiryDate,@UserId,Getdate(),@transactionType);
	end



	If (@SupplierId Is Not Null) 
	Begin
		Select @rowCount = Count(*) From  Lnk_SupplierItem Where SupplierId = @SupplierId And ItemId=@ItemId And ItemTypeId=@ItemTypeId;
		If(@rowCount = 0) 
		Begin
			Insert Into Lnk_SupplierItem(SupplierId,ItemId, ItemTypeId,UserId,CreateDate) Values(@SupplierId,@ItemId,@ItemTypeId,@UserId,getdate());
		End
	End

	declare @TotalRecievedQuantity int,
			@TotalQuantity int,
			@POstatus int;

	Select @TotalRecievedQuantity = Sum(a.IssuedQuantity)
	From Dtl_PurchaseItem a
	Inner Join
		ord_PurchaseOrder g On g.Poid = a.POId
	Where a.POId = @POId;

	Select @TotalQuantity = Sum(Quantity)	From dtl_PurchaseItem	Where POId = @POId;

	Update ord_PurchaseOrder Set
		Status = Case 
						When (@TotalRecievedQuantity = @TotalQuantity) Then 3 
						When (@TotalRecievedQuantity < @TotalQuantity) Then 4
						Else [Status] End --@POstatus
	Where POId = @POId;
End

GO
/****** Object:  StoredProcedure [dbo].[Pr_SCM_SaveStockTransAdjust_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[Pr_SCM_SaveStockTransAdjust_Futures]                                                  
	@StoreId int ,                      
	@Updatestock int = 1,
	@AdjustmentId int,                      
	@ItemId int ,                         
	@BatchId int ,                  
	@ExpiryDate datetime ,               
	@AdjustmentQuantity int ,                 
	@PurchaseUnit int = NULL,     
	@AdjustReasonId int,                  
	@UserId int                     
as                                                   
BEGIN
                      
    declare @TransactionId int;         
 --if (@Updatestock = 1) Begin
	 Insert Into Dtl_AdjustStock (
		AdjustId,
		ItemId,
		StoreId,
		BatchId,
		ExpiryDate,
		PurchaseUnit,
		AdjustReasonId,
		AdjustmentQuantity,
		UpdateStock)
	Values (
		@AdjustmentId,
		@ItemId,
		@StoreId,
		@BatchId,
		@ExpiryDate,
		@PurchaseUnit,
		@AdjustReasonId,
		@AdjustmentQuantity,
		@Updatestock );
	Select @TransactionId = scope_identity();
	Insert Into dtl_StockTransaction (
		AdjustId,
		ItemId,
		BatchId,
		ExpiryDate,
		StoreId,
		TransactionDate,
		Quantity,
		UserId,
		CreateDate,
		UpdateDate,
		transactionType)
	Values (
		@TransactionId,
		@ItemId,
		@BatchId,
		@ExpiryDate,
		@StoreId,
		getdate(),
		@AdjustmentQuantity,
		@UserId,
		getdate(),
		getdate(),
		'Stock Adjustment' )

End


GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SaveUpdateItemMaster_Futures]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pr_SCM_SaveUpdateItemMaster_Futures]  
@Drug_Pk int,  
@ItemCode varchar(50),  
@FDACode varchar(50),  
@DispensingUnit int,  
@PurchaseUnit int,  
@PurchaseUnitQty int,  
@PurchaseUnitPrice decimal(18,2),  
@Manufacturer int,  
@DispensingUnitPrice decimal(18,2),  
@DispensingMargin decimal(18,2),  
@SellingPrice decimal(18,2),  
@EffectiveDate datetime,  
@Status int,  
@MinStock int,  
@MaxStock int,
@UserId int  
  
as  
  
begin  
   Update mst_itemmaster set itemcode = @ItemCode,FDACode = @FDACode,DispensingUnit = @DispensingUnit, MaxStock=@MaxStock,MinStock = @MinStock,  
   PurchaseUnit=@PurchaseUnit,QtyPerPurchaseUnit=@PurchaseUnitQty,PurchaseUnitPrice=@PurchaseUnitPrice,Manufacturer=@Manufacturer,  
   DispensingUnitPrice = @DispensingUnitPrice,DispensingMargin = @DispensingMargin,  
   DeleteFlag = @Status, CreatedBy = @UserId, UpdateDate = getdate() where Item_Pk = @Drug_Pk  

end

GO
/****** Object:  StoredProcedure [dbo].[pr_SCM_SetPharmacyRefillAppointment]    Script Date: 6/12/2017 9:04:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pr_SCM_SetPharmacyRefillAppointment] 
	@PtnPk int,
	@LocationId int,
	@VisitPk int,
	@AppDate datetime ,
	@UserId int,
	@EmpID int
As                       
Begin 
	declare @AppReason int,@ModuleId int;

	SELECT @AppReason = id
	FROM mst_decode
	WHERE name = 'Pharmacy Refill'


	Select @ModuleId = ModuleId From mst_module Where ModuleName='Pharmacy'

	IF (@AppDate IS NOT NULL AND @AppDate > GETDATE() And @AppReason Is Not Null) BEGIN
		INSERT INTO dtl_patientappointment (
			ptn_pk
			,LocationId
			,Visit_pk
			,AppDate
			,AppReason
			,AppStatus
			,EmployeeId
			,UserId
			,CreateDate
			,ModuleID
			,AppNote)
		VALUES (
			@PtnPk
			,@LocationId
			,@VisitPk
			,@AppDate
			,@AppReason
			,12
			,@EmpID
			,@UserId
			,GETDATE()
			,@ModuleId
			,NULL);
	END
END

GO


