/****** Object:  StoredProcedure [dbo].[sp_getAllViralLoads] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getAllViralLoads]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getAllViralLoads]
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 23rd Jan 2018
-- Description:	Get a patients viral loads
-- =============================================
create PROCEDURE [dbo].[sp_getAllViralLoads] 
	-- Add the parameters for the stored procedure here
	@PatientId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @ptnpk int = (select top 1 ptn_pk from patient where id = @PatientId)

	select distinct * from (
	select a.ptn_pk,a.orderdate,orderstatus,parameterid,
	coalesce(
	case when resultvalue is not null then resultvalue else null end,
	case when undetectable = 1 then 50 else null end
	) resultvalue,
	b.deleteflag,c.resultdate 
	from ord_laborder a inner join dtl_LabOrderTestResult b on a.id = b.laborderid
	inner join dtl_LabOrderTest c on a.id = c.laborderid
	where b.parameterid in (3,107) and a.ptn_pk=@ptnpk ) VLs
	where VLs.resultvalue is not null and VLs.resultdate > DATEADD(year, -1, GetDate())
	order by VLs.resultdate desc
END
GO

/****** Object:  StoredProcedure [dbo].[sp_getAllPatientVitals] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_getAllPatientVitals]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_getAllPatientVitals]
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 23rd Jan 2018
-- Description:	Get all vitals from all modules
-- =============================================
create PROCEDURE sp_getAllPatientVitals
	-- Add the parameters for the stored procedure here
	@PatientId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 12 * from (
	select patientid, height,[weight],bmi, createdate from patientvitals where patientid = @PatientId and deleteflag=0
	union
	select b.id patientid, a.height,a.[weight], cast(isnull(a.[weight]/((a.height/100)*(a.height/100)),0) as decimal(36,2)) bmi, c.visitdate from dtl_patientvitals a inner join patient b on a.ptn_pk = b.ptn_pk 
	inner join ord_visit c on a.visit_pk = c.visit_id
	where b.id = @PatientId) vitals
	where vitals.height > 0 
	and vitals.[weight] > 0 and vitals.createdate > dateadd(year, -1, getdate())
	order by vitals.createdate desc
	
END
GO


/****** Object:  StoredProcedure [dbo].[sp_patientCategorizationAtEnrollment] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_patientCategorizationAtEnrollment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_patientCategorizationAtEnrollment]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 31st Jan 2018
-- Description:	Patient categorization at enrollment
-- =============================================
Create PROCEDURE sp_patientCategorizationAtEnrollment 
	-- Add the parameters for the stored procedure here
	@PatientId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @enrollmentDate datetime = (Select top 1 enrollmentDate from PatientEnrollment where patientid = @PatientId order by enrollmentDate asc)
	declare @baselineWHOStage varchar(20) = (Select top 1 b.Name from PatientBaselineAssessment a inner join lookupitem b on a.whostage = b.id where a.patientid = @PatientId)
    declare @baselineCD4Count int = (Select top 1 a.cd4count from PatientBaselineAssessment a inner join lookupitem b on a.whostage = b.id where a.patientid = @PatientId)

	if(@enrollmentDate > Dateadd(year, -1, getdate()))
	begin
		if((@baselineWHOStage = 'Stage1' OR @baselineWHOStage = 'Stage2') AND @baselineCD4Count > 200)
		begin
			select 'Well' Categorization, 'label-success'
		end
		else if((@baselineWHOStage = 'Stage3' OR @baselineWHOStage = 'Stage4') OR @baselineCD4Count <= 200)
		begin
			select 'Advanced' Categorization, 'label-danger'
		end
		else
		begin
			select 'Unknown' Categorization, 'label-danger'
		end
	end
	else
	begin
		select 'N/A' Categorization, 'label-danger'
	end
	print @enrollmentDate
END
GO





/****** Object:  StoredProcedure [dbo].[sp_getPatientEncounterHistory]    Script Date: 1/25/2018 11:16:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Macharia
-- Create date: 10th Feb 2017
-- Description:	get patient encounter History
-- =============================================
ALTER PROCEDURE [dbo].[sp_getPatientEncounterHistory]
	-- Add the parameters for the stored procedure here
	@PatientID int = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @enrollmentVisitType int = (select id from lookupitem where name = 'Enrollment')

	SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Encounter' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.PatientMasterVisit.VisitDate, dbo.mst_User.UserName, 
							 dbo.PatientMasterVisit.DeleteFlag, '' [status]
	FROM            dbo.PatientMasterVisit 
							inner join 
							PatientScreening on PatientMasterVisit.id = PatientScreening.patientmastervisitid
							left JOIN
							 dbo.mst_User ON dbo.PatientScreening.CreatedBy = dbo.mst_User.UserID
							  
	WHERE  dbo.PatientMasterVisit.PatientId = @PatientID 
	--and  (dbo.PatientMasterVisit.VisitDate IS NOT NULL) 
	AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
							 dbo.PatientMasterVisit.DeleteFlag = 0) --and dbo.PatientMasterVisit.visittype is null
	UNION
	SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Pharmacy' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.ord_patientpharmacyorder.orderedbyDate VisitDate, dbo.mst_User.UserName, 
							 dbo.PatientMasterVisit.DeleteFlag, convert(varchar(20),ord_patientpharmacyorder.orderstatus) [status]
	FROM            dbo.PatientMasterVisit INNER JOIN
							 dbo.mst_User ON dbo.PatientMasterVisit.CreatedBy = dbo.mst_User.UserID INNER JOIN
							 ord_patientpharmacyorder ON PatientMasterVisit.Id = ord_patientpharmacyorder.patientmastervisitid
	WHERE  dbo.PatientMasterVisit.PatientId = @PatientID 
	--and (dbo.PatientMasterVisit.VisitDate IS NOT NULL) 
	AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
							 dbo.PatientMasterVisit.DeleteFlag = 0) --and dbo.PatientMasterVisit.visittype is null
	UNION
	SELECT        dbo.PatientMasterVisit.Id AS visitID, 'Lab Order' AS VisitName, dbo.PatientMasterVisit.PatientId, dbo.ord_laborder.orderDate VisitDate, dbo.mst_User.UserName, 
							 dbo.PatientMasterVisit.DeleteFlag, ord_laborder.orderstatus [status]
	FROM            dbo.PatientMasterVisit INNER JOIN
							 ord_laborder ON PatientMasterVisit.Id = ord_laborder.patientmastervisitid
							 left JOIN
							 dbo.mst_User ON dbo.ord_laborder.orderedby = dbo.mst_User.UserID
	WHERE  dbo.PatientMasterVisit.PatientId = @PatientID 
	--and (dbo.PatientMasterVisit.VisitDate IS NOT NULL) 
	AND (dbo.PatientMasterVisit.DeleteFlag IS NULL OR
							 dbo.PatientMasterVisit.DeleteFlag = 0) and (ord_laborder.deleteflag = 0 or ord_laborder.deleteflag is null)

	order by visitdate desc
End
Go