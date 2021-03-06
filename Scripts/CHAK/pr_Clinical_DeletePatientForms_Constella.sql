/****** Object:  StoredProcedure [dbo].[pr_Clinical_DeletePatientForms_Constella]    Script Date: 8/14/2018 5:10:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[pr_Clinical_DeletePatientForms_Constella] @OrderNo INT
	,@FormName VARCHAR(50)
	,@PatientId INT
	,@UserID INT
AS
DECLARE @ARTStartDate DATETIME

BEGIN
	IF @FormName = 'Pharmacy'
		OR @FormName = 'Paediatric Pharmacy'
	BEGIN
		DECLARE @Vid INT

		SELECT @Vid = VisitId
		FROM ord_patientpharmacyorder
		WHERE ptn_pharmacy_pk = @OrderNo
			AND ptn_pk = @PatientId

		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId

		UPDATE ord_patientpharmacyorder
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE VisitId = @OrderNo
			AND ptn_pk = @PatientId

		UPDATE dtl_regimenmap
		SET DeleteFlag = 1
			,UpdateDate = getdate()
		WHERE Visit_Pk = @OrderNo
			AND ptn_pk = @PatientId

		SET @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@PatientId)

		UPDATE mst_Patient
		SET ARTStartDate = @ARTStartDate
		WHERE Ptn_Pk = @PatientId

		DECLARE @ARTCount INT

		SELECT @ARTCount = count(*)
		FROM ord_patientpharmacyorder
		WHERE ptn_pk = @PatientId
			AND progid = 222
			AND (
				DeleteFlag IS NULL
				OR DeleteFlag = 0
				)

		IF @ARTCount IS NULL
			AND @ARTCount = 0
		BEGIN
			UPDATE mst_Patient
			SET ARTStartDate = NULL
			WHERE Ptn_Pk = @PatientId
		END
	END
	ELSE IF @FormName = 'ART Follow-Up'
		OR @FormName = 'Non-ART Follow-Up'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId

		UPDATE dtl_patientappointment
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE ptn_pk = @PatientId
			AND LocationId = (
				SELECT o.LocationId
				FROM ord_visit o
				WHERE o.Visit_Id = @OrderNo
					AND o.ptn_pk = @PatientId
				)
			AND Visit_pk = @OrderNo;
	END
	ELSE IF @FormName = 'Patient Record - Follow Up'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 8
	END
	ELSE IF @FormName = 'HIV Care/ART Encounter'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 15
	END
	ELSE IF @FormName = 'Initial and Follow up Visits'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 17
	END
	ELSE IF @FormName = 'Prior ART/HIV Care'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 16
	END
			--john start
	ELSE IF @FormName = 'Express'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 31
	END
	ELSE IF @FormName = 'PEP'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 21
	END
	ELSE IF @FormName = 'Paediatric Initial Evaluation'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 22
	END
	ELSE IF @FormName = 'Adult Follow up'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 23
	END
	ELSE IF @FormName = 'Paediatric Follow up'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 24
	END
	ELSE IF @FormName = 'Adult Initial Evaluation'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 25
	END
			--john end       
	ELSE IF @FormName = 'ART Care Visitation'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 34
	END
	ELSE IF @FormName = 'ART Care Summary'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 35
	END
	ELSE IF @FormName = 'HEI'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 37
	END
	ELSE IF @FormName = 'ANC'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
			AND Visittype = 40
	END
	ELSE IF @FormName = 'Laboratory'
	BEGIN
		UPDATE ord_PatientLabOrder
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE LabId = @OrderNo
			AND ptn_pk = @PatientId

		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = (
				SELECT VisitId
				FROM ord_PatientLabOrder
				WHERE LabId = @OrderNo
				)
	END
	ELSE IF @FormName = 'Home Visit'
	BEGIN
		UPDATE dtl_patienthomevisit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE HomeVisitID = @OrderNo
			AND ptn_pk = @PatientId

		SET @ARTStartDate = dbo.fn_GetPatientARTStartDate_constella(@PatientId)

		UPDATE mst_Patient
		SET ARTStartDate = @ARTStartDate
		WHERE Ptn_Pk = @PatientId
	END
	ELSE IF @FormName = 'Custom'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId
	END
	ELSE IF @FormName = 'Clinical Encounter'
		OR @FormName = 'Adherence Barriers'
	BEGIN
		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId;
	END
	ELSE IF @FormName = 'Enhance Adherence Counselling'
	BEGIN
		BEGIN TRANSACTION

		UPDATE dtl_HIVCE_PatientAdherenceManagement
		SET DeleteFlag = 1
			,UpdateBy = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId;

		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId;
		COMMIT TRANSACTION
	END
	ELSE IF @FormName = 'PrEP'
	BEGIN
		BEGIN TRANSACTION
		UPDATE dtl_Prep_Triage
		SET DeleteFlag = 1
			,UpdatedBy = @UserID
			,UpdatedDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId;

			UPDATE dtl_Prep_Assessment
		SET DeleteFlag = 1
			,UpdatedBy = @UserID
			,UpdatedDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId;

			UPDATE dtl_Prep_Initiation
		SET DeleteFlag = 1
			,UpdatedBy = @UserID
			,UpdatedDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId;
			

		UPDATE ord_visit
		SET DeleteFlag = 1
			,UserID = @UserID
			,UpdateDate = getdate()
		WHERE Visit_Id = @OrderNo
			AND ptn_pk = @PatientId;			

		COMMIT TRANSACTION
	END

END
