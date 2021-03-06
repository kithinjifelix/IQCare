IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_UpdateTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Schedule_UpdateTask]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph
-- Create date: 
-- Description:	Get scheduled tasks
-- =============================================
CREATE PROCEDURE [dbo].[Schedule_UpdateTask]  
	@taskName varchar(50),
	@NextRunDate datetime,
	@LastRunDate datetime,
	@Active bit =1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update ScheduledTask Set
			NextRunDate = @NextRunDate
		,	LastRunDate = @LastRunDate
		,	Active = @Active
	Where TaskName = @TaskName;
END

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schedule_GetTask]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Schedule_GetTask]
GO

/****** Object:  StoredProcedure [dbo].[Schedule_GetTask]    Script Date: 21-Mar-2017 1:28:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph
-- Create date: 
-- Description:	Get scheduled tasks
-- =============================================
CREATE PROCEDURE [dbo].[Schedule_GetTask]  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select TaskName, LastRunDate, NextRunDate From ScheduledTask Where Active = 1
END

GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_SCM_SetPharmacyRefillAppointment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_SCM_SetPharmacyRefillAppointment]
GO

/****** Object:  StoredProcedure [dbo].[pr_SCM_SetPharmacyRefillAppointment]    Script Date: 5/12/2016 5:13:00 PM ******/
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

	IF (@AppDate IS NOT NULL And @AppReason Is Not Null) BEGIN
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



/****** Object:  StoredProcedure [dbo].[pr_Scheduler_SelectAppStatus_Constella]    Script Date: 03/17/2016 11:02:59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_SelectAppStatus_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_SelectAppStatus_Constella]
GO

/****** Object:  StoredProcedure [dbo].[pr_Scheduler_SelectAppStatus_Constella]    Script Date: 03/17/2016 11:02:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_Scheduler_SelectAppStatus_Constella]  
AS  
SET NOCOUNT ON;  
--SELECT count(*) as Statusall from dtl_PatientAppointment where AppStatus=12 or AppStatus=13 or AppStatus=14  
--SELECT count(*) as Statuspending from dtl_PatientAppointment where AppStatus=12  
--SELECT count(*) as Statusmissed from dtl_PatientAppointment where AppStatus=13   
--SELECT count(*) as statusmet from dtl_PatientAppointment where AppStatus=14  
select * from mst_decode where codeId=3;  
--select * from mst_decode where codeID=4;  
  
--For scheduler module(appointment main where we do not need to show 'met' and 'careended' status)   
--select id,name from mst_decode where codeId=3 and id not in (14,226,227) ;

GO

/****** Object:  StoredProcedure [dbo].[pr_Scheduler_CheckAppointmentExistance_Constella]    Script Date: 01/20/2016 11:23:27 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_CheckAppointmentExistance_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_CheckAppointmentExistance_Constella]
GO

/****** Object:  StoredProcedure [dbo].[pr_Scheduler_CheckAppointmentExistance_Constella]    Script Date: 01/20/2016 11:23:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pr_Scheduler_CheckAppointmentExistance_Constella]   
(  
 @PatientId int,  
 @LocationId int,  
 @AppDate datetime,
 @ReasonId int,
 @ModuleId int = Null,
 @VisitId int = 0
)   
AS  
  
 --Check if patient already has appointment from scheduler moduler on same date  
begin  
	Declare @totalrows as int;

	if (@VisitId=0) Begin
		Select @totalrows = count(*)
		From dtl_patientappointment
		Where AppStatus = 12
		And Ptn_pk = @PatientId
		And @LocationId = @LocationId
		And @AppDate = @appdate
		And AppReason = @ReasonId
		And (DeleteFlag = 0)
		And (ModuleID = @ModuleId Or @ModuleID Is Null);
	End
	Else Begin
		Select @totalrows = count(*)
		From dtl_patientappointment
		Where appstatus = 12
		And ptn_pk = @PatientId
		And locationid = @LocationId
		And appdate = @appdate
		And appreason = @ReasonId
		And visit_pk <> @VisitId
		And (deleteflag = 0)
		And (ModuleID = @ModuleId Or @ModuleID Is Null); 
	End
	
	Select @totalrows RecordCount;
end

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_DeletePatientAppointmentDetails_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_DeletePatientAppointmentDetails_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_DeletePatientAppointmentDetails_Constella]    Script Date: 09/17/2015 08:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[pr_Scheduler_DeletePatientAppointmentDetails_Constella]   
(  
 @AppointmentId int,
 @UserId int,  
 @LocationId int = null ,  
 @VisitId int  = null  
)   
AS  
Begin  
 --Delete an appointment  
 Update dtl_patientappointment  
       Set DeleteFlag = 1,
			UserId = @UserId  
  Where AppointmentId = @AppointmentId;
  --ptn_pk = @PatientId and  
  --   LocationId = @LocationId and  
  --   Visit_pk = @VisitId ;  
  Update ord_Visit Set DeleteFlag = 1, UserId = @UserId, UpdateDate = GetDate() Where Visit_Id = (Select Visit_Pk from dtl_PatientAppointment Where AppointmentId = @AppointmentId);
 --update ord_visit  
 --Set DeleteFlag = 1  
 --Where ptn_pk = @PatientId and LocationId = @LocationId and Visit_id=@VisitId and VisitType=(select VisitTypeid from  mst_VisitType where VisitName='Scheduler')  
End


Go

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_UpdatePatientAppointmentDetails_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_UpdatePatientAppointmentDetails_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_UpdatePatientAppointmentDetails_Constella]    Script Date: 09/17/2015 08:41:52 ******/
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_UpdatePatientAppointmentDetails_Constella]    Script Date: 01/20/2016 11:25:00 ******/
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_UpdatePatientAppointmentDetails_Constella]    Script Date: 03/17/2016 07:40:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pr_Scheduler_UpdatePatientAppointmentDetails_Constella]   
(  
	@PatientId int = null,  
	@AppointmentId int,
	@LocationId int = null,  
	@VisitId int  = null,  
    @AppDate datetime,  
    @AppReasonId int,  
	@UserId int,  
	@AppProviderId int = null,  
    @UpdationDate datetime ,
	@AppNote varchar(250) = Null,
	@ModuleId int = null
)   
AS  
Begin

	Update dtl_patientappointment Set
		AppDate = @AppDate,
		AppReason = @AppReasonId,
		UserId = @UserId,
		EmployeeId = @AppProviderId,
		ModuleID = @ModuleId,
		updatedate = @UpdationDate,
		AppNote = Isnull(Nullif(@AppNote,''),AppNote)
	Where AppointmentId = @AppointmentID And DeleteFlag= 0;
	--And ptn_pk = @PatientId
	--And LocationId = @LocationId
	--And Visit_pk = @VisitId
End

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_GetPatientAppointmentDetails_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_GetPatientAppointmentDetails_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_GetPatientAppointmentDetails_Constella]    Script Date: 09/16/2015 16:12:43 ******/
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_GetPatientAppointmentDetails_Constella]    Script Date: 01/20/2016 11:27:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pr_Scheduler_GetPatientAppointmentDetails_Constella]                                     
(                                    
 @PatientId int,                                    
 @LocationId int = 0,                                    
 @VisitId int = 0,                     
 @password varchar(50)                                   
)                                     
AS                                    
Begin
                          
                                                                                                  
	Declare @SymKey varchar(400)
	Set @SymKey = 'Open symmetric key Key_CTC decryption by password=' + @password + ''
	Exec (@SymKey)

	Select	Convert(varchar(50), Decryptbykey(FirstName)) + ' ' + Isnull(Convert(varchar(50), Decryptbykey(MiddleName)), '') + '' + Convert(varchar(50), Decryptbykey(LastName)) As Name,
			Coalesce(nullif(P.PatientEnrollmentID,''), Nullif(P.PatientClinicID,''), P.PatientFacilityID)  As PatientEnrollmentId,Ptn_Pk,
			[Status]
	From mst_Patient As P
	Where (Ptn_Pk = @patientid);
	Close Symmetric Key Key_CTC
	Select	@LocationID = Nullif(@LocationID, 0),	@VisitID = Nullif(@VisitId, 0);

--if(@LocationId=0)                            
--   Begin                            
--and a.LocationId = @LocationId                                             

	Select	AppDate AppointmentDate,
			AppointmentId,
			(Case appstatus
				When 14 Then Convert(varchar, a.Updatedate, 106)
				Else '' End) As MetDate,
			(Case appstatus
				When 12 Then 'Pending'
				When 13 Then 'Missed'
				When 14 Then 'Met'
				When 226 Then 'CareEnded'
				When 227 Then 'Previously Missed' End) As Status,
			Appstatus StatusId,
			b.FirstName + ' ' + b.LastName As Provider,
			Coalesce(c.PatientEnrollmentID, c.PatientClinicID, c.PatientFacilityID) As PatientEnrollmentID,
			a.LocationID,
			a.Visit_pk As VisitId,
			a.Ptn_pk As PatientId,
			a.AppDate,
			d.Name As Purpose,
			a.AppReason As PurposeId,
			b.EmployeeID As ProviderId,
			a.ModuleId ServiceAreaId,
			ServiceArea = (Select ModuleName From mst_module M Where M.ModuleId = a.ModuleID),
			A.appNote
	From dtl_PatientAppointment As a
	Inner Join
		mst_Patient As c On a.Ptn_pk = c.Ptn_Pk
	Left Outer Join
		mst_Decode As d On a.AppReason = d.ID
	Left Outer Join
		mst_Employee As b On a.EmployeeID = b.EmployeeID
	Where (a.Ptn_pk = @PatientId)
	And (a.DeleteFlag = 0)
	And (Case	When @LocationId Is Null Or		a.LocationID = @LocationId Then 1
		Else 0 End = 1)
	And (Case		When @VisitID Is Null Or a.Visit_Pk = @VisitId Then 1
		Else 0 End = 1)
	Order By a.AppDate Desc, Status, a.UpdateDate Desc

                                 
	Select	getdate() AppDate,
				1 AppReason,
				0 EmployeeId,
				0 [ProviderID],
				0 Visit_pk
	where 1 > 1
	--Select	AppDate,
	--		AppReason,
	--		EmployeeId,
	--		EmployeeID [ProviderID],
	--		Visit_pk
	--From dtl_patientappointment
	--Where ptn_pk = @PatientId
	--And LocationId = @LocationId
	--And Visit_pk = @VisitId
	--Order By AppDate;



End

GO




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_AppointmentList_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_AppointmentList_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_AppointmentList_Constella]    Script Date: 09/16/2015 14:44:13 ******/
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_AppointmentList_Constella]    Script Date: 02/09/2016 10:51:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pr_Scheduler_AppointmentList_Constella]                                   
(                      
                     
	 @LocationId int,            
	 @password varchar(50) =null ,
	 @AppStatus int = null,  
	 @AppReason int = null,                    
	 @FromDate  datetime = null,                      
	 @ToDate  datetime= Null  ,
	 @PatientId int =null,
	 @ModuleId int = null,
	 @VisitId int = null                    
)                       
                  
AS             
Begin
         
  --    Declare @SymKey varchar(400)
--Set @SymKey = 'Open symmetric key Key_CTC decryption by password=' + N'''ttwbvXWpqb5WOLfLrBgisw==''' + ''
--Exec (@SymKey)



Select	@FromDate = case when @FromDate Is not Null Then dateadd(Second, 0, dateadd(Day, datediff(Day, 0, @FromDate), 0)) Else Null End,
		@ToDate = case when @ToDate Is not Null Then dateadd(Second, -1, dateadd(Day, datediff(Day, 0, @ToDate) + 1, 0)) Else Null End;

Select	PA.Ptn_Pk PatientId,
		AppointmentId,
		convert(varchar(50), decryptbykey(P.FirstName)) FirstName,
		nullif(convert(varchar(50), decryptbykey(P.MiddleName)), '') MiddleName,
		convert(varchar(50), decryptbykey(P.LastName)) LastName,
		coalesce(nullif(P.PatientEnrollmentID, ''), nullif(P.PatientClinicID, ''), P.PatientFacilityID) PatientEnrollmentId,
		P.Status PatientStatus,
		PA.LocationId,
		FacilityName =
		(
			Select Top 1
				F.FacilityName
			From mst_Facility F
			Where F.FacilityID = PA.LocationID
		),
		Pa.Visit_pk VisitId,
		AppDate AppointmentDate,
		Case
			When AppStatus = 14 Then PA.UpdateDate
			Else Null
		End MetDate,
		AppReason PurposeId,
		AR.Name Purpose,
		AppStatus AppointmentStatusId,
		StatusName [AppointmentStatus],
		PA.EmployeeID ProviderId,
		E.FirstName + ' ' + E.LastName As Provider,
		PA.AppNote,
		PA.ModuleId ServiceAreaId,
		ServiceArea =
		(
			Select
				ModuleName
			From mst_module M
			Where M.ModuleId = PA.ModuleID
		),
		isnull(PA.UpdateDate, PA.CreateDate) StatusDate,
		UC.CreatedById,
		UC.CreatedBy,
		MD.UpdatedById,
		MD.UpdatedBy
From dtl_PatientAppointment PA
Inner Join mst_patient P On p.Ptn_Pk = PA.Ptn_pk
Left outer Join vw_AppointmentReasons AR On AR.ID = AppReason
Inner Join
	(
		Select
			ID StatusID,
			Name StatusName
		From mst_decode
		Where codeId = 3
	) ST On ST.StatusID = PA.AppStatus
Inner Join
	(
		Select
			UserId CreatedById,
			UserFirstName + ' ' + UserLastName CreatedBy
		From mst_User
	) UC On UC.CreatedById = PA.UserID
Left Outer Join
	(
		Select
			UserId UpdatedById,
			UserFirstName + ' ' + UserLastName UpdatedBy
		From mst_User
	) MD On MD.UpdatedById = PA.UpdateUserId
Left Outer Join mst_Employee E On E.EmployeeID = PA.EmployeeID
Where PA.LocationID = @LocationID
And PA.DeleteFlag = 0
And P.DeleteFlag = 0
And
	Case
		When @AppStatus Is Null Or @AppStatus = PA.AppStatus Then 1
		Else 0
	End = 1
And
	Case
		When @AppReason Is Null Or @AppReason = PA.AppReason Then 1
		Else 0
	End = 1
And
	Case
		When @FromDate Is Not Null And @ToDate Is Not Null And AppDate Between @FromDate And @ToDate Then 1
		When @FromDate Is Null Or @ToDate Is Null Then 1
		Else 0
	End = 1
And (Case
	When @VisitId Is Null Or PA.Visit_pk = @VisitId Then 1
	Else 0
End = 1)
And (Case
	When @PatientId Is Null Or PA.Ptn_pk = @PatientId Then 1
	Else 0
End = 1)
Order By AppDate Desc


--Close Symmetric Key Key_CTC


End
GO




IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_SaveAppointment_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_SaveAppointment_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_SaveAppointment_Constella]    Script Date: 09/17/2015 10:54:46 ******/
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_SaveAppointment_Constella]    Script Date: 01/20/2016 11:26:25 ******/
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_SaveAppointment_Constella]    Script Date: 03/17/2016 07:39:34 ******/
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_SaveAppointment_Constella]    Script Date: 5/12/2016 5:20:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[pr_Scheduler_SaveAppointment_Constella]  
(  
	@PatientId int,  
	@LocationId int,  
	@AppDate datetime,  
	@AppReasonId int,  
	@AppProviderId int = null,  
	@UserId int,  
	@CreateDate datetime  ,
	@ModuleID int = null,
	@AppNote varchar(250) = Null,
	@VisitId int = null
)   
AS
Set Nocount On
Begin

Begin Transaction App
Begin Try
If (@VisitId Is Null) Begin
	Insert Into ord_visit (
		ptn_pk,
		locationid,
		visitdate,
		visittype,
		dataquality,
		userid,
		createdate,
		ModuleID)
	Values (
		@PatientId,
		@LocationId,
		@CreateDate,
		5,
		0,
		@UserId,
		@CreateDate,
		@ModuleID );

	Select @VisitId = scope_identity();
End

--Create a new appointment  
Insert Into dtl_patientappointment (
		ptn_pk
	,	LocationId
	,	Visit_pk
	,	AppDate
	,	AppReason
	,	AppStatus
	,	EmployeeId
	,	UserId
	,	CreateDate
	,	ModuleID
	,	AppNote
	,	DeleteFlag)
Values (
		@PatientId
	,	@LocationId
	,	@VisitId
	,	@AppDate
	,	@AppReasonId
	,	12
	,	@AppProviderId
	,	@UserId
	,	@CreateDate
	,	@ModuleID
	,	@AppNote
	,	0);

	Select scope_identity() AppointmentId;
If @@TRANCOUNT > 0 Commit Transaction App;
End Try Begin Catch

Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;

Select	@ErrorMessage = error_message(),
		@ErrorSeverity = error_severity(),
		@ErrorState = error_state();


Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);

If @@TRANCOUNT > 0 Rollback Transaction App;
End Catch;


End

GO



IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_SelectAppReason_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_SelectAppReason_Constella]
GO
/****** Object:  StoredProcedure [dbo].[pr_Scheduler_SelectAppReason_Constella]    Script Date: 09/17/2015 10:57:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_Scheduler_SelectAppReason_Constella]    
(    
  @Id int     
)     
AS    
Begin    
    
 select name,id,deleteflag from vw_AppointmentReasons where ID = @Id    
    
 union    
    
 select name,id,deleteflag from vw_AppointmentReasons 

  
End

Go

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Pr_Scheduler_PatientCareEnded]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Pr_Scheduler_PatientCareEnded]
GO
/****** Object:  StoredProcedure [dbo].[Pr_Scheduler_PatientCareEnded]    Script Date: 11/29/2015 08:49:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Pr_Scheduler_PatientCareEnded]  
(  
@Trackingid  INT=null,  
@ptn_pk int=null  
)  
AS  
  
declare @CareEndedid int  
declare @ModuleID int  
declare @Trid int  
declare @ModuleName varchar(500)  
declare @dyModuleid int  
  
SELECT @CareEndedid=CareEndedid  FROM dtl_PatientCareEnded where trackingid=@Trackingid  
  
select @ModuleID=Moduleid from dtl_PatientTrackingCare where TrackingID=@Trackingid  
select @ModuleName=ModuleName from mst_module where moduleid=@ModuleID  
select @dyModuleid=moduleid from mst_module where ModuleName='Initial Evaluation and Follow Up'  
  
  
if @ModuleID=2  
begin  
 if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=202)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,202,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid 
 
          
        select @Trid=scope_identity();
  
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
 end  
 if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=@dyModuleid)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,@dyModuleid,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid  
          
        select @Trid=scope_identity(); 
  
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
 end  
end  
  
if @ModuleID=202  
begin  
 if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=2)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,2,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid  
          
        select @Trid=scope_identity(); 
          
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
    end  
    if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=@dyModuleid)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,@dyModuleid,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid  
          
        select @Trid=scope_identity();  
  
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
 end  
end  
  
--start here

if @ModuleID=2  
begin  
 if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=203)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,203,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid 
 
          
        select @Trid=scope_identity(); 
  
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
 end  
 if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=@dyModuleid)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,@dyModuleid,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid  
          
        select @Trid=scope_identity();  
  
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
 end  
end  
  
if @ModuleID=203  
begin  
 if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=2)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,2,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid  
          
        select @Trid=scope_identity(); 
          
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
    end  
    if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=@dyModuleid)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,@dyModuleid,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid  
          
        select @Trid=scope_identity(); 
  
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
 end  
end  

--end here
  
if @ModuleName='Initial Evaluation and Follow Up'  
begin  
 if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=2)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,2,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid  
          
        select @Trid=scope_identity();  
          
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
    end  
 if exists(select 1 from Lnk_PatientProgramStart where ptn_pk=@ptn_pk and moduleid=202)  
 begin  
  insert into dtl_PatientTrackingCare(Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,ModuleId,DataQuality)  
  select Ptn_Pk,DateLastContact,AttemptedContactDate,AttemptedContactName,AttemptedContactMode,AttemptedContactType,EmployeeID,SignatureDate,UserID,CreateDate,UpdateDate,LocationId,202,DataQuality from dtl_PatientTrackingCare where trackingid=@Trackingid 
 
          
        select @Trid=scope_identity();
  
        insert into dtl_PatientCareEnded(Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,TrackingId)  
        select Ptn_Pk,CareEnded,ARTended,ARTenddate,ARTendreason,PatientExitReason,CareEndedDate,UserID,CreateDate,LocationId,@Trid from dtl_PatientCareEnded where careendedid=@CareEndedid and ptn_pk=@ptn_pk  
 end  
end

GO

/****** Object:  StoredProcedure [dbo].[pr_Scheduler_UpdateAppointmentStatusMissedAndMet_Constella]    Script Date: 01/16/2016 18:40:20 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[pr_Scheduler_UpdateAppointmentStatusMissedAndMet_Constella]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[pr_Scheduler_UpdateAppointmentStatusMissedAndMet_Constella]
GO

/****** Object:  StoredProcedure [dbo].[pr_Scheduler_UpdateAppointmentStatusMissedAndMet_Constella]    Script Date: 01/16/2016 18:40:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[pr_Scheduler_UpdateAppointmentStatusMissedAndMet_Constella]      
(@Currentdate varchar(11), @locationid int)       
AS      
Begin
------Check in ord_visit table if record exist(excluding the records of scheduler and enrollment visit type)      
------with in grace period of appointment date then update the status to met if the       
------appointment date + grace period has gone then update the status to missed      
------seprately check the record in lab order table as the lab entries does not go into the ord_visit table      

-----------------------Update Met status--------------------------      
Update dtl_patientappointment Set
	appstatus = 14,
	updatedate =
	(
		Select
			min(VisitDate)
		From ord_visit c
		Where (c.visitdate Between (dtl_patientappointment.appdate -
			(
				Select
					appgraceperiod
				From mst_facility
				Where facilityid = @locationid
			)
			) And
			(dtl_patientappointment.appdate +
			(
				Select
					appgraceperiod
				From mst_facility
				Where facilityid = @locationid
			)
			+ 1))
			And c.ptn_pk = dtl_patientappointment.ptn_pk
			And c.visit_id <> dtl_patientappointment.visit_pk
			And c.locationid = @locationid
			And visittype Not In (5, 0)
			And visittype <> 0
	)
Where locationid = @locationid
	And appstatus = 12
	And (deleteflag Is Null Or deleteflag != 1)
	And ptn_pk In
	(
		Select
			c.ptn_pk
		From ord_visit c
		Where ((c.visitdate Between (dtl_patientappointment.appdate -
			(
				Select
					appgraceperiod
				From mst_facility
				Where facilityid = @locationid
			)
			) And
			(dtl_patientappointment.appdate +
			(
				Select
					appgraceperiod
				From mst_facility
				Where facilityid = @locationid
			)
			+ 1)))
			And c.ptn_pk = dtl_patientappointment.ptn_pk
			And c.visit_id <> dtl_patientappointment.visit_pk
			And c.locationid = @locationid
			And visittype Not In (5, 0)
			And visittype <> 0
	)

Update dtl_patientappointment Set
	appstatus = 14,
	updatedate =
	(
		Select
			min(VisitDate)
		From ord_visit c
		Where (c.visitdate Between (dtl_patientappointment.appdate -
			(
				Select
					appgraceperiod
				From mst_facility
				Where facilityid = @locationid
			)
			) And
			(dtl_patientappointment.appdate +
			(
				Select
					appgraceperiod
				From mst_facility
				Where facilityid = @locationid
			)
			+ 1))
			And c.ptn_pk = dtl_patientappointment.ptn_pk
			And c.visit_id <> dtl_patientappointment.visit_pk
			And c.locationid = @locationid
			And visittype Not In (5, 0)
			And visittype <> 0
	)
Where locationid = @locationid
	And appstatus = 12
	And (deleteflag Is Null Or deleteflag != 1)
	And ptn_pk In
	(
		Select
			c.ptn_pk
		From ord_patientlaborder c
		Where ((c.createdate Between (dtl_patientappointment.appdate -
			(
				Select
					appgraceperiod
				From mst_facility
				Where facilityid = @locationid
			)
			) And
			(dtl_patientappointment.appdate +
			(
				Select
					appgraceperiod
				From mst_facility
				Where facilityid = @locationid
			)
			+ 1)))
			And c.ptn_pk = dtl_patientappointment.ptn_pk
			And c.locationid = @locationid
	)


---- -----------------------Update Missed status--------------------------      
Update dtl_patientappointment Set
	appstatus = 13,
	updatedate = @Currentdate
Where locationid = @locationid
	And appstatus = 12
	And (deleteflag Is Null Or deleteflag != 1)
	And ptn_pk In
	(
		Select
			dtl_patientappointment.ptn_pk
		From dtl_patientappointment
		Where appstatus = 12
			And ptn_pk = dtl_patientappointment.ptn_pk
			And locationid = @locationid
			And appdate = dtl_patientappointment.appdate
			And (dtl_patientappointment.appdate +
			(
				Select
					appgraceperiod
				From mst_facility
				Where facilityid = @locationid
			)
			< @currentdate)
	)


--update status of all those inactive patients who have missed appointment, to careended   
   
--Update dtl_patientappointment Set
--	appstatus = 226,
--	updatedate = @Currentdate
--Where (appstatus = 13 Or appstatus = 12)
--	And (deleteflag Is Null Or deleteflag != 1)
--	And ptn_pk In
--	(
--		Select
--			ptn_pk
--		From mst_patient
--		Where status = 1
--			And mst_patient.locationid = dtl_patientappointment.locationid
--	)

Update A Set
	Appstatus = 226,
	UpdateDate = @Currentdate	
From mst_Patient As P
Inner Join dtl_PatientAppointment As A On P.Ptn_Pk = A.Ptn_pk
		And P.LocationID = A.LocationID
Where (P.Status = 1) 
And A.DeleteFlag = 0
And A.AppStatus In (13,12);

-----------------------------------------------------------------------------------------------------------      
------update status of all those active patients(previously inactive) who have careended appointments, to missed and      
-----Then compare appdate with currentdate if curentdate is less then (appdate + graceperoiddate) then mark appstatus pending      

Update dtl_patientappointment Set
	appstatus = 13,
	updatedate = @Currentdate
Where appstatus = 226
	And (deleteflag Is Null Or deleteflag != 1)
	And ptn_pk In
	(
		Select
			ptn_pk
		From mst_patient
		Where status = 0
			And mst_patient.locationid = dtl_patientappointment.locationid
	)

Update dtl_patientappointment Set
	appstatus = 12
Where appstatus = 13
	And (deleteflag Is Null Or deleteflag != 1)
	And dateadd(dd,
	(
		Select
			appgraceperiod
		From mst_facility
		Where facilityid = @locationid
	)
	, appdate) >= @Currentdate


-----------------Update missed to Previously missd status---------------------------------      
Update dtl_patientappointment Set
	dtl_patientappointment.appstatus = 227,
	updatedate = @Currentdate
Where dtl_patientappointment.appstatus = 13
	And (deleteflag Is Null Or deleteflag != 1)
	And dtl_patientappointment.appdate <
	(
		Select
			max(b.appdate)
		From dtl_patientappointment b
		Where b.appstatus In (12, 14)
			And b.ptn_pk = dtl_patientappointment.ptn_pk
			And (deleteflag Is Null Or deleteflag != 1)
			And b.locationid = dtl_patientappointment.locationid
	)
End
GO


