
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacyRegistration]    Script Date: 7/31/2017 9:00:01 AM ******/
DROP PROCEDURE [dbo].[sp_SaveUpdatePharmacyRegistration]
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllPatientsRegisteredAtPharmacy]    Script Date: 7/31/2017 9:00:01 AM ******/
DROP PROCEDURE [dbo].[sp_getAllPatientsRegisteredAtPharmacy]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetPrescription]    Script Date: 7/31/2017 9:00:01 AM ******/
DROP PROCEDURE [dbo].[Pharmacy_GetPrescription]
GO
/****** Object:  StoredProcedure [dbo].[Pharmacy_GetPrescription]    Script Date: 7/31/2017 9:00:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph
-- Create date: 
-- Description:	Get pending pharmacy prescriptions
-- =============================================
CREATE PROCEDURE [dbo].[Pharmacy_GetPrescription] 
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
		,	PatientEnrollmentID PatientFacilityId
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
		, datediff(Minute, PO.CreateDate, getdate()) Duration
		,	(
			Select UserFirstName + ' ' + UserLastName
			From mst_User U
			Where U.UserId = PO.OrderedBy
			)				
			PrescribedBy
		,de.Name [Service]
	From ord_PatientPharmacyOrder PO
	Inner Join PatientView PV On PV.Ptn_Pk = PO.Ptn_pk 
	left join mst_decode de on PO.ProgID = de.id
	Where orderstatus = @PrescriptionStatus
	And PO.DeleteFlag = 0 And (PV.DeleteFlag = 0 or PV.DeleteFlag is null)
	And CONVERT(date, OrderedByDate) = CONVERT(date, @PrescriptionDate) -- Between @StartDate And @EndDate
	And PO.LocationId = @LocationId
	order by Duration desc
END


GO
/****** Object:  StoredProcedure [dbo].[sp_getAllPatientsRegisteredAtPharmacy]    Script Date: 7/31/2017 9:00:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_getAllPatientsRegisteredAtPharmacy] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	exec pr_OpenDecryptedSession

	select Ptn_Pk, Convert(varchar(50), Decryptbykey(FirstName)) fname, Convert(varchar(50), Decryptbykey(MiddleName)) mname, 
	Convert(varchar(50), Decryptbykey(LastName)) lname, PatientEnrollmentID, cast(round(DATEDIFF(hour,DOB,GETDATE())/8766.0,2) as numeric(18,2)) age, 
	b.name gender, c.name [service]
	from mst_patient a left join mst_decode b on a.sex = b.id
	left join mst_decode c on a.ServiceRegisteredForAtPharmacy = c.id
	where RegisteredAtPharmacy = 1
	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SaveUpdatePharmacyRegistration]    Script Date: 7/31/2017 9:00:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_SaveUpdatePharmacyRegistration] 
	-- Add the parameters for the stored procedure here
	@firstName varchar(max) = null,
	@middleName varchar(max) = null,
	@lastName varchar(max) = null,
	@patientEnrollmentID varchar(50) = null,
	@DOB datetime = null,
	@gender int = null,
	@locationID int = null,
	@regDate datetime = null,
	@userID int = null,
	@serviceId int = null
	--@password nvarchar(50) = '''ttwbvXWpqb5WOLfLrBgisw=='''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @SymKey varchar(400)                                                              
	--Set @SymKey = 'Open symmetric key Key_CTC decryption by password='+ @password + ''                                                                  
	--exec(@SymKey) 
	exec pr_OpenDecryptedSession 
    -- Insert statements for procedure here
	Insert into [MST_PATIENT](Status, FirstName, MiddleName, LastName, patientenrollmentid, LocationID, RegistrationDate,Sex,DOB, UserID, CreateDate,
	RegisteredAtPharmacy,ServiceRegisteredForAtPharmacy)
	Values('0', encryptbykey(key_guid('Key_CTC'),@firstName), encryptbykey(key_guid('Key_CTC'),@middleName), 
	encryptbykey(key_guid('Key_CTC'),@lastName),@patientEnrollmentID,@locationID,@regDate,@gender,@DOB,@userID,getdate(),1,@serviceId)
	--select '0', encryptbykey(key_guid('Key_CTC'),@firstName), encryptbykey(key_guid('Key_CTC'),@middleName), 
	--encryptbykey(key_guid('Key_CTC'),@lastName),@locationID,@regDate,@gender,@DOB,@userID,getdate()

	declare @ptn_pk int = SCOPE_IDENTITY();
	Close symmetric key Key_CTC 
	--Insert into ord_visit(Ptn_Pk,LocationID,VisitDate,VisitType,DataQuality,DeleteFlag,UserID,CreateDate)
	--values (@ptn_pk, @locationID,getdate(),147,0,0,1, Getdate())

	--select * from mst_visittype
END

GO
