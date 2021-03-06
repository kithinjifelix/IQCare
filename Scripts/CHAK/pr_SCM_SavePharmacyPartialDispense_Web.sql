/****** Object:  StoredProcedure [dbo].[pr_SCM_SavePharmacyPartialDispense_Web]    Script Date: 8/15/2018 10:59:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[pr_SCM_SavePharmacyPartialDispense_Web] @Ptn_Pk INT = NULL
	,@StoreId INT = NULL
	,@ptn_pharmacy_pk INT = NULL
	,@drug_pk INT = NULL
	,@batchid INT = NULL
	,@ExpiryDate DATETIME = NULL
	,@DispensedQuantity DECIMAL(18, 2) = NULL
	,@DispensedBy INT = NULL
	,@DispensedByDate DATETIME = NULL
	,@PrintPrescriptionStatus INT
	,@comments VARCHAR(1000) = NULL
	,@deleteScript VARCHAR(1000) = NULL
	,@UserId INT = NULL
AS
BEGIN
	IF (@ptn_pharmacy_pk != 0)
	BEGIN
		IF (ISNULL(@deleteScript, '') <> '')
		BEGIN
			EXEC (@deleteScript);
		END;

		--Select @DispensedQuantity = Case when ISNUMERIC(@DispensedQuantity)=1 then @DispensedQuantity else 0 end
		PRINT @DispensedQuantity;

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
			,@DispensedQuantity
			,@DispensedBy
			,@DispensedByDate
			,@comments
			,GETDATE()
			,0
			);

		UPDATE dtl_PatientPharmacyOrder
		SET DispensedQuantity = DispensedQuantity + @DispensedQuantity
			,PrintPrescriptionStatus = @PrintPrescriptionStatus
		WHERE ptn_pharmacy_pk = @ptn_pharmacy_pk
			AND Drug_Pk = @drug_pk;

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
			@Drug_Pk
			,@BatchId
			,@Ptn_Pharmacy_Pk
			,@Ptn_Pk
			,@StoreId
			,@DispensedByDate
			,CONVERT(DECIMAL, '-' + CONVERT(VARCHAR, @DispensedQuantity))
			,@ExpiryDate
			,0
			,0
			,0
			,@UserId
			,GETDATE()
			);

		UPDATE ord_PatientPharmacyOrder
		SET DispensedBy = @DispensedBy
			,DispensedByDate = @DispensedByDate
		WHERE ptn_pharmacy_pk = @ptn_pharmacy_pk;

		--Update dispensing status - whether partial or fully dispensed
		----------------------------------------------------------------
		DECLARE @OrderedQuantityByDrug DECIMAL(18, 2);
		DECLARE @TotalDispensedQuantityByDrug DECIMAL(18, 2);

		SELECT @OrderedQuantityByDrug = orderedquantity
		FROM dtl_patientpharmacyorder
		WHERE ptn_pharmacy_pk = @ptn_Pharmacy_Pk
			AND Drug_Pk = @Drug_Pk;

		SET @TotalDispensedQuantityByDrug = (
				SELECT ISNULL(DispensedQuantity, 0) --+ ISNULL(PillCount, 0)
				FROM dtl_patientpharmacyorder
				WHERE ptn_pharmacy_pk = @ptn_Pharmacy_Pk
					AND Drug_Pk = @Drug_Pk
				);

		DECLARE @TotalOrderedQuantity DECIMAL(18, 2);
		DECLARE @TotalDispensedQuantity DECIMAL(18, 2);

		SELECT @TotalOrderedQuantity = SUM(z.OrderedQuantity)
		FROM (
			SELECT Drug_Pk
				,ISNULL(OrderedQuantity, 0) AS 'OrderedQuantity'
			FROM dtl_patientpharmacyorder
			WHERE ptn_pharmacy_pk = @ptn_Pharmacy_Pk
			GROUP BY Drug_Pk
				,OrderedQuantity
			) AS z;

		SELECT @TotalDispensedQuantity = SUM(ISNULL(DispensedQuantity, 0)) --+ SUM(ISNULL(PillCount, 0))
		FROM dtl_patientpharmacyorder
		WHERE ptn_pharmacy_pk = @ptn_Pharmacy_Pk;

		--SELECT @OrderedQuantity1;
		--SELECT @TotalDispensedQuantity1;
		IF (@TotalDispensedQuantity = @TotalOrderedQuantity)
		BEGIN
			UPDATE ord_PatientPharmacyOrder
			SET OrderStatus = 2
			WHERE DispensedByDate IS NOT NULL
				AND ptn_pharmacy_pk = @ptn_pharmacy_pk;
		END;

		IF (
				@TotalDispensedQuantity > 0
				AND @TotalDispensedQuantity < @TotalOrderedQuantity
				)
		BEGIN
			UPDATE ord_PatientPharmacyOrder
			SET OrderStatus = 3
			WHERE DispensedByDate IS NOT NULL
				AND ptn_pharmacy_pk = @ptn_pharmacy_pk;
		END;

		IF (@TotalDispensedQuantity < 1)
		BEGIN
			UPDATE ord_PatientPharmacyOrder
			SET OrderStatus = 1
			WHERE DispensedByDate IS NOT NULL
				AND ptn_pharmacy_pk = @ptn_pharmacy_pk
		END
	END;
END;
