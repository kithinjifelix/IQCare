/****** Object:  StoredProcedure [dbo].[ClinicalService_SaveResult]    Script Date: 03/17/2016 06:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_SaveResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_SaveResult]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_SaveOrder]    Script Date: 03/17/2016 06:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_SaveOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_SaveOrder]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_Save]    Script Date: 03/17/2016 06:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_Save]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_Save]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetServices]    Script Date: 03/17/2016 06:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetServices]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_GetServices]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetOrderedServices]    Script Date: 03/17/2016 06:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetOrderedServices]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_GetOrderedServices]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetOrder]    Script Date: 03/17/2016 06:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_GetOrder]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_FindServiceByName]    Script Date: 03/17/2016 06:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_FindServiceByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_FindServiceByName]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_DeleteOrder]    Script Date: 03/17/2016 06:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_DeleteOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_DeleteOrder]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_Delete]    Script Date: 03/17/2016 06:50:40 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_Delete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[ClinicalService_Delete]
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_Delete]    Script Date: 03/17/2016 06:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_Delete] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Insert a new Service
-- =============================================
ALTER PROCEDURE [dbo].[ClinicalService_Delete]
	-- Add the parameters for the stored procedure here
	@ServiceId int,
	@UserId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Mst_ClinicalService Set DeleteFlag = 1 Where Id = @ServiceId;
END

GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_DeleteOrder]    Script Date: 03/17/2016 06:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_DeleteOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_DeleteOrder] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Delete a Service order
-- =============================================
ALTER PROCEDURE [dbo].[ClinicalService_DeleteOrder]
	-- Add the parameters for the stored procedure here
	@OrderId int,
	@UserId int

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

-- Insert statements for procedure here
	Update ord_ClinicalServiceOrder Set
		DeleteFlag = 1,
		UpdateDate = getdate(),
		UserId = @UserId
	Where Id = @OrderId;

	Update dtl_ClinicalServiceOrder Set DeleteFlag= 1 Where OrderId = @OrderId;
End
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_FindServiceByName]    Script Date: 03/17/2016 06:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_FindServiceByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_FindServiceByName] AS' 
END
GO


 
ALTER PROCEDURE [dbo].[ClinicalService_FindServiceByName] 
      -- Add the parameters for the stored procedure here
      @SearchText varchar(15),
	  @ModuleId int = -1
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
      If ltrim(rtrim(@SearchText)) <> ''
      Begin
            Select @SearchText = '%'+@SearchText+'%';
            Select @ModuleId = Case @ModuleId When -1 Then Null Else @ModuleId end;
            Select @SearchText = Case When nullif(@SearchText,'') Is Null Then Null Else '%'+@SearchText+'%' End
		-- Insert statements for procedure here
			Select	Id,			
				Name,
				Description,
				ModuleId,
				Module = (Select D.ModuleName From mst_module D Where D.ModuleID = M.ModuleId),			
				DeleteFlag
			From Mst_ClinicalService As M
			Where (DeleteFlag = 0)
			And Name Like @SearchText 
			And (ModuleId = @ModuleId Or @ModuleId Is Null);
       
                  
      End
      
    -- Insert statements for procedure here
      
 END


GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetOrder]    Script Date: 03/17/2016 06:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_GetOrder] AS' 
END
GO
ALTER PROCEDURE [dbo].[ClinicalService_GetOrder] 
	-- Add the parameters for the stored procedure here
	@PatientId int = null,	 
	@OrderId int = Null	
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here	
		Select	Id,			
			M.Ptn_Pk PatientId,
			LocationId,
			VisitId,
			ModuleId,
			Module = (Select D.ModuleName From mst_module D Where D.ModuleID = M.ModuleId),	
			M.TargetModuleId,
			TargetModule = (Select D.ModuleName From Mst_Module D where D.ModuleID = M.TargetModuleId),
			M.OrderNumber,
			M.OrderDate,
			M.OrderedBy,
			M.OrderStatus,		
			DeleteFlag,
			M.StatusDate,
			M.ClinicalNotes,
			M.CreatedBy,
			M.CreateDate,
			M.UserId,
			M.UpdateDate
		From ord_ClinicalServiceOrder As M
		Where (Id = @OrderId Or @OrderId  Is Null) And (M.Ptn_Pk = @PatientId Or @PatientId Is Null);

		
		
End
	

GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetOrderedServices]    Script Date: 03/17/2016 06:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetOrderedServices]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_GetOrderedServices] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get services ordered
-- =============================================
ALTER PROCEDURE [dbo].[ClinicalService_GetOrderedServices] 
	-- Add the parameters for the stored procedure here
	@OrderId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    	Select 
			D.Id,
			D.OrderId,
			D.ClinicalServiceId,
			D.ResultNotes,
			D.RequestNotes,
			D.Quantity,
			D.ResultDate,
			D.ResultBy, 
			D.DeleteFlag,
			S.Name ServiceName,
			S.[Description] ServiceDescription,
			S.DeleteFlag ServiceDeleteFlag,
			S.ModuleId ServiceModuleId,
			ServiceModuleName= (Select M.ModuleName From mst_module M Where M.ModuleID = S.ModuleId)
		From dtl_ClinicalServiceOrder D 
		Inner Join Mst_ClinicalService S	On D.ClinicalServiceId = S.Id
		Inner Join ord_ClinicalServiceOrder O On O.Id = D.OrderId
		Where (O.Id = @OrderId);
END

GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_GetServices]    Script Date: 03/17/2016 06:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_GetServices]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_GetServices] AS' 
END
GO
ALTER PROCEDURE [dbo].[ClinicalService_GetServices] 
	-- Add the parameters for the stored procedure here
	@ServiceId int = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here
	Select	Id,			
			Name,
			Description,
			ModuleId,
			Module = (Select D.ModuleName From mst_module D Where D.ModuleID = M.ModuleId),			
			DeleteFlag
	From Mst_ClinicalService As M
	Where (DeleteFlag = 0)
	And (Id = isnull(@ServiceId, Id))
End
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_Save]    Script Date: 03/17/2016 06:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_Save]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_Save] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Insert a new Service
-- =============================================
ALTER PROCEDURE [dbo].[ClinicalService_Save] 
	-- Add the parameters for the stored procedure here
	@Name varchar(50) , 
	@Description varchar(250) ,
	@ModuleId int,
	@UserId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert Into dbo.Mst_ClinicalService (
		ModuleId,
		Name,
		Description,
		DeleteFlag)
	Values (
		@ModuleId,
		@Name,
		@Description,
		0 );
END

GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_SaveOrder]    Script Date: 03/17/2016 06:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_SaveOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_SaveOrder] AS' 
END
GO
ALTER PROCEDURE [dbo].[ClinicalService_SaveOrder] 
	-- Add the parameters for the stored procedure here
	@PatientId int,
	@LocationId int,
	@ModuleId int,
	@TargetModuleId int,
	@VisitId int = null, 
	@OrderId int = Null,
	@OrderDate datetime,
	@OrderedBy int,
	@ClinicalNotes varchar(400),
	@OrderStatus varchar(50) = 'Pending',
	@UserId int,
	@ServiceList xml= null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here
	Declare @VisitTypeId int;
	Select @VisitTypeId = VisitTypeID From mst_VisitType Where VisitName = 'Service Order Form'
	Declare @OrderedServices Table(ServiceId int,TestNotes varchar(400),Quantity int,ResultNotes varchar(400), ResultBy int, ResultDate datetime);
	Declare @OrderNumber varchar(50);
	;With SR As
		(
			Select
				L.G.query('serviceid').value('.', 'int') ServiceId,
				nullif(L.G.query('testnotes').value('.', 'varchar(400)'), '') TestNotes,
				Isnull(L.G.query('quantity').value('.', 'int'),1) Quantity,
				nullif(L.G.query('resultnotes').value('.', 'varchar(400)'), '') ResultNotes,
				nullif(L.G.query('resultdate').value('.', 'datetime'), '') ResultDate,
				nullif(L.G.query('resultby').value('.', 'int'), '') ResultBy
			From @ServiceList.nodes('/root/result') As L (G)
		)
		Insert Into @OrderedServices(ServiceId, TestNotes, Quantity, ResultNotes,ResultBy,ResultDate)
		Select
			ServiceId,
			TestNotes,
			Quantity,
			ResultNotes,
			ResultBy,
			ResultDate
		From SR;
	Begin Transaction ServiceOrder
	Begin Try
		Insert Into ord_Visit (
			Ptn_pk,
			LocationID,
			VisitDate,
			VisitType,
			DataQuality,
			UserID,
			Createdate,
			OrderedDate,
			ModuleID,
			Signature)
		Values (
			@PatientId,
			@LocationId,
			@OrderDate,
			@VisitTypeId,
			0,
			@UserID,
			getdate(),
			@OrderDate,
			@ModuleId,
			@OrderedBy );

		Select @VisitId = scope_identity();

		Select @OrderNumber = max(convert(varchar, replace(OrderNumber, '-', '')))
		From ord_ClinicalServiceOrder
		Where OrderNumber Like convert(varchar, datepart(Year, getdate())) + '-%'

		If (@OrderNumber Is Null) Select @OrderNumber = convert(varchar(4),datepart(year, getdate())) + replicate('0', 5) + convert(varchar, 1); 
		Else Select @OrderNumber = convert(int, @OrderNumber) + 1;

		Select @OrderNumber = stuff(@OrderNumber, 5, 0, '-');

		Insert Into ord_ClinicalServiceOrder(
			Ptn_pk,
			LocationId,
			VisitId,
			ModuleId,
			TargetModuleId,
			OrderDate,
			OrderedBy,
			OrderNumber,
			OrderStatus,
			StatusDate,
			ClinicalNotes,
			CreatedBy,
			CreateDate,
			UserId,			
			DeleteFlag
		)
		Values(
			@PatientId,
			@LocationId,
			@VisitId,
			@ModuleId,
			@TargetModuleId,
			@OrderDate,
			@OrderedBy,
			@OrderNumber,
			@OrderStatus,
			getdate(),
			@ClinicalNotes,
			@UserId,
			getdate(),
			@UserId,
			0
		);
		Select @OrderId = scope_identity();

		Insert Into dtl_ClinicalServiceOrder(
			OrderId,
			ClinicalServiceId,
			RequestNotes,
			Quantity,
			ResultNotes,
			ResultDate,
			ResultBy,
			DeleteFlag
		)
		Select 
			@OrderId, 
			ServiceId, 
			TestNotes, 
			Quantity,
			ResultNotes,
			ResultDate,
			ResultBy,
			0
		From @OrderedServices ;
		declare @rCount int, @sCount int;

		Select 
			@rCount = Count(*) ,
			@sCount = Sum(Case When ResultBy Is Null Then 0 Else 1 End)
		From dtl_ClinicalServiceOrder
		Where OrderId =@OrderId;

		Update ord_ClinicalServiceOrder  Set
			OrderStatus = Case When @sCount = 0 Then 'Pending' 
							   When @sCount < @rCount Then 'Partially Complete'
							   Else 'Complete'  End
		Where Id = @OrderId;	
		
		If(@rCount = @sCount) Begin
			Update ord_visit set DataQuality = 1 Where Visit_Id = @VisitId;
		End	

		Select @OrderId OrderId, @OrderNumber OrderNumber, @PatientId PatientId, @VisitId VisitId;
		
		

	If @@TRANCOUNT > 0 Commit Transaction ServiceOrder;
	End Try 
	Begin Catch
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
		Select	@ErrorMessage = error_message(),
				@ErrorSeverity = error_severity(),
				@ErrorState = error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
		If @@TRANCOUNT > 0 Rollback Transaction ServiceOrder;
	End Catch;
End
GO
/****** Object:  StoredProcedure [dbo].[ClinicalService_SaveResult]    Script Date: 03/17/2016 06:50:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClinicalService_SaveResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ClinicalService_SaveResult] AS' 
END
GO
ALTER PROCEDURE [dbo].[ClinicalService_SaveResult] 
	-- Add the parameters for the stored procedure here
	 
	@OrderId int ,	
	@UserId int,
	@ServiceList xml
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here
	
	Declare @OrderedServices Table(Id int, ServiceId int,TestNotes varchar(400),ResultNotes varchar(400), ResultBy int, ResultDate datetime);
	Declare @OrderNumber varchar(50);
	;With SR As
		(
			Select
				L.G.query('id').value('.', 'int') Id,
				L.G.query('serviceid').value('.', 'int') ServiceId,
				nullif(L.G.query('testnotes').value('.', 'varchar(400)'), '') TestNotes,
				nullif(L.G.query('resultnotes').value('.', 'varchar(400)'), '') ResultNotes,
				nullif(L.G.query('resultdate').value('.', 'datetime'), '') ResultDate,
				nullif(L.G.query('resultby').value('.', 'int'), '') ResultBy
			From @ServiceList.nodes('/root/result') As L (G)
		)
		Insert Into @OrderedServices(
			Id,
			ServiceId, 
			TestNotes,
			ResultNotes,
			ResultBy,
			ResultDate
		)
		Select
			Id,
			ServiceId,
			TestNotes,
			ResultNotes,
			ResultBy,
			ResultDate
		From SR;
	Begin Transaction ServiceOrder
	Begin Try
		
		

		Update C Set
			ResultBy = O.ResultBy,
			ResultDate = O.ResultDate,
			ResultNotes = O.ResultNotes		
		From dtl_ClinicalServiceOrder C 
		Inner Join @OrderedServices O		On O.Id = C.Id
		Where c.ResultBy Is Null And O.ResultBy Is Not Null;

		declare @rCount int, @sCount int;

		Select 
			@rCount = Count(*) ,
			@sCount = Sum(Case When ResultBy Is Null Then 0 Else 1 End)
		From dtl_ClinicalServiceOrder
		Where OrderId =@OrderId;

		Update ord_ClinicalServiceOrder  Set
			OrderStatus = Case When @sCount = 0 Then 'Pending' 
							   When @sCount < @rCount Then 'Partially Complete'
							   Else 'Complete'  End
		Where Id = @OrderId;	
		
		Update V Set
			DataQuality =  Case 
							   When @sCount < @rCount Then 0
							   Else 1  End
		From ord_ClinicalServiceOrder O  
		Inner Join ord_Visit V On V.Visit_Id = O.VisitId And O.Id=@OrderId	;

	If @@TRANCOUNT > 0 Commit Transaction ServiceOrder;
	End Try 
	Begin Catch
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
		Select	@ErrorMessage = error_message(),
				@ErrorSeverity = error_severity(),
				@ErrorState = error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
		If @@TRANCOUNT > 0 Rollback Transaction ServiceOrder;
	End Catch;
End
GO
