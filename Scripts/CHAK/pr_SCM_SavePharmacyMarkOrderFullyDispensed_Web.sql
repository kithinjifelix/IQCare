/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePharmacyMarkOrderFullyDispensed_Web]    Script Date: 8/15/2018 12:58:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[pr_SCM_SavePharmacyMarkOrderFullyDispensed_Web] @ptn_pharmacy_pk INT
	,@Reason VARCHAR(1000)
AS
BEGIN
	--IF EXISTS (
	--		SELECT 1
	--		FROM ord_PatientPharmacyOrder
	--		WHERE ptn_pharmacy_pk = @ptn_pharmacy_pk
	--			AND orderstatus = 1
	--		)
	--BEGIN
		DECLARE @drug_pk INT;

		DECLARE db_cursor CURSOR
		FOR
		SELECT drug_pk
		FROM [dbo].[dtl_PatientPharmacyOrder]
		WHERE ptn_pharmacy_pk = @ptn_pharmacy_pk;

		OPEN db_cursor

		FETCH NEXT
		FROM db_cursor
		INTO @drug_pk

		WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE @oq INT
				,@dq INT
				,@bq INT;
			DECLARE @vid INT
				,@batchid INT
				,@Ptn_Pk INT
				,@StoreId INT
				,@ExpiryDate DATETIME;

			SELECT @vid = visitid
				,@Ptn_Pk = ptn_pk
			FROM ord_PatientPharmacyOrder
			WHERE ptn_pharmacy_pk = @ptn_pharmacy_pk;

			SELECT @batchid = ISNULL(BatchId, 0)
				,@StoreId = ISNULL(StoreId, 0)
				,@ExpiryDate = ExpiryDate
			FROM vw_patientpharmacy
			WHERE visitid = @vid;

			SELECT @oq = OrderedQuantity
				,@dq = DispensedQuantity
			FROM [dbo].[dtl_PatientPharmacyOrder]
			WHERE ptn_pharmacy_pk = @ptn_pharmacy_pk
				AND drug_pk = @drug_pk;

			SET @bq = @oq - @dq;

			PRINT @bq;

			UPDATE dtl_PatientPharmacyOrder
			SET DispensedQuantity = OrderedQuantity
			WHERE ptn_pharmacy_pk = @ptn_pharmacy_pk
				AND Drug_Pk = @drug_pk;

			INSERT INTO dtl_PatientPharmacyOrderpartialDispense (
				ptn_pharmacy_pk
				,drug_pk
				,batchid
				,DispensedQuantity
				,DispensedBy
				,DispensedByDate
				,comments
				,createdate
				,deleteflag
				)
			VALUES (
				@ptn_pharmacy_pk
				,@drug_pk
				,@batchid
				,@bq
				,1
				,getdate()
				,NULL
				,GETDATE()
				,0
				);

			INSERT INTO dbo.Dtl_StockTransaction (
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
				)
			VALUES (
				@drug_pk
				,@batchid
				,@ptn_pharmacy_pk
				,@Ptn_Pk
				,@StoreId
				,getdate()
				,CONVERT(DECIMAL, '-' + CONVERT(VARCHAR, @bq))
				,@ExpiryDate
				,0
				,0
				,0
				,1
				,GETDATE()
				);

			FETCH NEXT
			FROM db_cursor
			INTO @drug_pk
		END

		CLOSE db_cursor

		DEALLOCATE db_cursor

		UPDATE ord_PatientPharmacyOrder
		SET OrderStatus = 2
			,NotDispensedNote = @Reason
		WHERE DispensedByDate IS NOT NULL
			AND ptn_pharmacy_pk = @ptn_pharmacy_pk;
	--END
	--ELSE
	--BEGIN
	--	UPDATE ord_PatientPharmacyOrder
	--	SET OrderStatus = 2
	--		,NotDispensedNote = @Reason
	--	WHERE DispensedByDate IS NOT NULL
	--		AND ptn_pharmacy_pk = @ptn_pharmacy_pk;
	--END
END
