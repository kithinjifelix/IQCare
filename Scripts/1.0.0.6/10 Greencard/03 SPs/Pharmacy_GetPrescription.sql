/****** Object:  StoredProcedure [dbo].[Pharmacy_GetPrescription]    Script Date: 5/1/2018 9:49:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph
-- Create date: 
-- Description:	Get pending pharmacy prescriptions
-- =============================================
ALTER PROCEDURE [dbo].[Pharmacy_GetPrescription] 
	-- Add the parameters for the stored procedure here
	@PrescriptionDate datetime , 
	@LocationId int,
	@PrescriptionStatus int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @StartDate datetime, @EndDate datetime;

	Select @StartDate = dateadd(second, 0, dateadd(day, datediff(day, 0, @PrescriptionDate), 0)) ,	@EndDate = dateadd(second, -1, dateadd(day, datediff(day, 0, @PrescriptionDate)+1, 0))
    -- Insert statements for procedure here
	Select	PV.Ptn_pk
		,	PatientEnrollmentID 
		,	PatientFacilityId
		,	ptn_pharmacy_pk	OrderId
		,	ReportingID		PrescriptionNumber
		,	FirstName
		,	MiddleName
		,	LastName
		,	DOB
		,	Sex
		,	convert(varchar(20),OrderedByDate,106) OrderedByDate
		,	Case
				When PO.OrderStatus = 1 Then 'New Order'
				When PO.OrderStatus = 3 Then 'Partial Dispense'
				Else 'Already Dispensed Order'
			End [Status]
		,  convert(varchar(20),PO.CreateDate,106) CreateDate
		--,	cast(datediff(Hour, PO.CreateDate, getdate()) As varchar) + ' hrs ' + cast(datediff(Minute, PO.CreateDate, getdate()) % 60 As varchar) + ' mins' Duration
		, cast(datediff(Minute, PO.CreateDate, getdate()) as varchar) + ' mins' Duration
		,	(
			Select UserFirstName + ' ' + UserLastName
			From mst_User U
			Where U.UserId = PO.OrderedBy
			)				
			PrescribedBy
	From ord_PatientPharmacyOrder PO
	Inner Join PatientView PV On PV.Ptn_Pk = PO.Ptn_pk 
	Where orderstatus = @PrescriptionStatus
	And	CONVERT(date, OrderedByDate) = CONVERT(date, @PrescriptionDate) -- Between @StartDate And @EndDate
	And PO.LocationId = @LocationId
	And (PO.DeleteFlag = 0 or PO.DeleteFlag is null)
	order by Duration desc
END


