/****** Object:  StoredProcedure [dbo].[Psmart_ProcessNewClientRegistration]    Script Date: 25-May-2018 10:43:34 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Psmart_ProcessNewClientRegistration]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Psmart_ProcessNewClientRegistration]
GO
/****** Object:  StoredProcedure [dbo].[Psmart_ProcessNewClientRegistration]    Script Date: 25-May-2018 10:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Psmart_ProcessNewClientRegistration]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Psmart_ProcessNewClientRegistration] AS' 
END
GO
-- =============================================
-- Author:		<stephen Osewe>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Psmart_ProcessNewClientRegistration]
	-- Add the parameters for the stored procedure here
	@FirstName varchar(100), --1
	@MiddleName varchar(100)=null, --2
	@LastName varchar(100), --3
	@registrationDate datetime, --4
	@dob datetime, --5
	@dobPrecision varchar(1) = '0', --6
	@phone varchar(50), --7
	@gender varchar(15), --8
	@landmark varchar(50), --9
	@maritalStatus varchar(50)=0, --10
	@htsId varchar(50) = null, --11
	@serialNumber varchar(50), --12
	@facilityId varchar(10)=null, --13
	@moduleId varchar(5), --14
	@village varchar(50) = null, --15
	@ward varchar(50) =null, --16
	@subcounty varchar(50) =null, --17
	@heiNumber varchar(15) = null, --18
	@Address varchar(250),
	@hts_facility_id varchar(15) = null --19
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

    -- Insert statements for procedure here
	declare @ptnpk int=0,@visitId int=0, @locationId int,@PosId int,@CountryId int, @patient_facility_index varchar(15)
	DECLARE @PatientMastrVisitId int;
	DECLARE @PersonId int;
	Declare @PatientId int,@PatientEnrollmentId int;

		Select Top 1 @locationId = FacilityId
					,@PosId = PosID
					,@CountryId = CountryID
		From mst_Facility
		Where DeleteFlag = 0

		If(@hts_facility_id is null Or @hts_facility_id ='') Begin
			Select @hts_facility_id = @PosId
		End
		Begin Transaction InsertPat
		Begin Try
			Insert Into mst_Patient (
				[Status]
			   ,FirstName
			   ,MiddleName
			   ,LastName
			   ,LocationID
			   ,RegistrationDate
			   ,Sex
			   ,DOB
			   ,DobPrecision
			   ,CountryID
			   ,PosID
			   ,SatelliteID
			   ,UserID
			   ,CreateDate
			   ,Phone
			   ,LandMark
			   ,HTSID
			   ,MaritalStatus
			   ,CardSerialNumber
			   ,[Address]
			   ,HEIIDNumber)
			Values (
				'0'
			   ,encryptbykey(key_guid('Key_CTC'), @firstName)
			   ,encryptbykey(key_guid('Key_CTC'), @middleName)
			   ,encryptbykey(key_guid('Key_CTC'), @lastName)
			   ,@locationId
			   ,@registrationDate
			   ,(Select Top 1		Id		From mst_Decode		Where Name = '' + @gender + '')
			   ,@dob
			   ,isnull(convert(int, @dobPrecision), 0)
			   ,@CountryId
			   ,@PosId
			   ,0
			   ,1
			   ,getdate()
			   ,encryptbykey(key_guid('Key_CTC'), @phone)
			   ,@landmark
			   ,@htsId
			   ,isnull((Select Top 1	Id	From mst_Decode	Where Name = '' + @maritalStatus + '')	, 0)
			   ,-- SELECT SCOPE_IDENTITY(); ");,
				@serialNumber
			   ,encryptbykey(key_guid('Key_CTC'), @Address)
			   ,@heiNumber);
			Set @ptnpk = scope_identity();

	
			Select @patient_facility_index = PatientFacilityId From mst_Patient where Ptn_Pk=@ptnpk
-- insert into ord_visit

			Insert Into [dbo].[ord_Visit] (
				[Ptn_PK]
			   ,[LocationID]
			   ,[VisitDate]
			   ,[VisitType]
			   ,[DataQuality]
			   ,[DeleteFlag]
			   ,[UserID]
			   ,[CreateDate]
			   ,[UpdateDate])
			Values (
				@ptnpk
			   ,@locationId
			   ,@registrationDate -- visitdate
			   ,12 -- for registration
			   ,1
			   ,0
			   ,1 -- default psmart userId
			   ,getdate()
			   ,getdate());

-- insert into lnk_patientprogramstart
			Insert Into [dbo].[Lnk_PatientProgramStart] (
				[Ptn_PK]
			   ,[ModuleId]
			   ,[StartDate]
			   ,[UserID]
			   ,[CreateDate]
			   ,[UpdateDate])
			Values (
				@ptnpk
			   ,@moduleId
			   ,getdate()--@registrationDate
			   ,1
			   ,getdate()
			   ,getdate());

			
-- INSERT TO PERSON
			Insert Into Person (
				FirstName
			   ,MidName
			   ,LastName
			   ,Sex
			   ,DateOfBirth
			   ,DobPrecision
			   ,createdby
			   ,CreateDate)
			Values (
				encryptbykey(key_guid('Key_CTC'), @FirstName)
			   ,encryptbykey(key_guid('Key_CTC'),@MiddleName )
			   ,encryptbykey(key_guid('Key_CTC'), @LastName)
			   ,(Select Top 1		Id	From LookupItem		Where Name = '' + @gender + '')
			   ,@dob
			   ,@dobPrecision
			   ,1
			   ,getdate())
			Select @PersonId = scope_identity();


-- INSERT TO PATIENT
			Insert Into Patient (
				Ptn_PK
			   ,PersonId
			   ,PatientType
			   ,FacilityID
			   ,DateOfBirth
			   ,DobPrecision
			   ,NationalId
			   ,RegistrationDate
			   ,PatientIndex
			   ,CreateDate
			   ,createdby)
			Values (
				@ptnpk
			   ,@PersonId
			   ,(Select	top 1	Id		From LookupItem			Where Name = 'New')
			   ,@PosId
			 ,	@dob
			   ,@dobPrecision
			   ,999999
			   ,@registrationDate
			  , @patient_facility_index			   
			   ,getdate()
			   ,1)
			Select @PatientId = scope_identity();

-- PatientMasterVisit
			--Insert Into PatientMasterVisit (
			--	PatientId
			--   ,ServiceId
			--   ,Start
			--   ,VisitDate
			--   ,VisitScheduled
			--   ,VisitBy
			--   ,VisitType
			--   ,createdby
			--   ,CreateDate)
			--Values (
			--	@PatientId
			--   ,1
			--   ,getdate()
			--   ,convert(datetime, @registrationDate, 104)
			--   ,0
			--   ,(Select Top 1			Id		From LookupItem		Where Name = 'self')
			--   ,0
			--   ,1
			--   ,getdate())
			--Set @PatientMastrVisitId = scope_identity();
-- INsert Patient Enrollment
			Insert Into PatientEnrollment (
				PatientId
			   ,ServiceAreaId
			   ,EnrollmentDate
			   ,EnrollmentStatusId
			   ,TransferIn
			   ,CareEnded
			   ,createdby
			   ,CreateDate)
			Values (
				@PatientId
			   ,2
			   ,getdate()--@registrationDate
			   ,0
			   ,0
			   ,0
			   ,1
			   ,getdate())
			
				Select @PatientEnrollmentId = scope_identity();

-- INSER TO PatientIdentifier
			If (@htsId <> ''Or @htsId Is Not Null)	Begin
				Select @htsId = @patient_facility_index
			End
			Insert Into PatientIdentifier (
				PatientId
				,PatientEnrollmentId
				,IdentifierTypeId
				,IdentifierValue
				,createdby
				,CreateDate
				,AssigningFacility
				,Active)
			Values (
				@PatientId
				,@PatientEnrollmentId
				,(Select		Top 1	Id		From Identifiers		Where Code = 'HTSNumber')
				,@htsId
				,1
				,getdate()
				,@hts_facility_id
				,1);
-- INSER TO PersonIdentifier
			
			Insert Into PersonIdentifier (
				PersonId				
				,IdentifierId
				,IdentifierValue
				,createdby
				,CreateDate
				,AssigningFacility
				,Active
				,DeleteFlag)
			Values (
				@PersonId
				,(Select Top 1	Id		From Identifiers		Where Code = 'CARD_SERIAL_NUMBER')
				,@serialNumber				
				,1
				,getdate()
				,@facilityId
				,1
				,0);		
-- PersonContact
			Select @Address =
				   Case
					   When @Address = '' Or
						   @Address Is Null Then Null
					   Else ltrim(rtrim(@Address))
				   End
				  ,@phone =
				   Case
					   When @phone = '' Or
						   @phone Is Null Then Null
					   Else ltrim(rtrim(@phone))
				   End

			If (@Address Is Not Null	Or @Phone Is Not Null)	Begin
				Insert Into PatientContact (
					PersonId
				   ,PhysicalAddress
				   ,mobileNo
				   ,CreateDate
				   ,createdby)
				Values (
					@PersonId
				   ,encryptbykey(key_guid('Key_CTC'), @Address)
				   ,encryptbykey(key_guid('Key_CTC'), @phone)
				   ,getdate()
				   ,1)
			End
-- PersonLocation

			If (@village Is Not Null	And datalength(@village) > 4
				And @ward Is Not Null
				And datalength(@ward) > 4
				And datalength(@ward) > 4
				And @subcounty Is Not Null
				And datalength(@subcounty) > 4)
			Begin
			Insert Into PersonLocation (
				PersonId
			   ,County
			   ,SubCounty
			   ,Village
			   ,Ward
			   ,LandMark
			   ,createdby
			   ,CreateDate)
			Values (
				@PersonId
			   ,(Select Top 1		CountyID		From County		Where Subcountyname = '' + @subcounty + '')
			   ,isnull((Select Top 1	SubCountyID		From County		Where Subcountyname = '' + @subcounty + '')		, 0)
			   ,@village
			   ,(Select Top 1	WardId	From County	Where WardName = '' + @ward + '')
			   ,@landmark
			   ,1
			   ,getdate())
			End
-- PatientENcounter
			--Insert Into PatientEncounter (
			--	PatientId
			--   ,PatientMasterVisitId
			--   ,EncounterTypeId
			--   ,EncounterStartTime
			--   ,EncounterEndTime
			--   ,ServiceAreaId
			--   ,CreateDate
			--   ,createdby
			--   ,Status)
			--Values (
			--	@PatientId
			--   ,@PatientMastrVisitId
			--   ,(Select Top 1	Id	From LookupItem		Where Name = 'Hts-encounter')
			--   ,convert(datetime, @registrationDate, 104)
			--   ,convert(datetime, @registrationDate, 104)
			--   ,2
			--   ,convert(datetime, @registrationDate, 104)
			--   ,1
			--   ,0)

			Select @PersonId Id;

			If @@TRANCOUNT > 0
			Commit Transaction InsertPat;
			End Try
			Begin Catch
			Declare @ErrorMessage nvarchar(4000)
				   ,@ErrorSeverity int
				   ,@ErrorState int;
			Select @ErrorMessage = error_message()
				  ,@ErrorSeverity = error_severity()
				  ,@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0
			Rollback Transaction InsertPat;
			End Catch;
End
GO
