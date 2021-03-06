IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_DeleteLabOrder]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabOrder]    Script Date: 12/1/2016 9:42:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 01-Dec-2016
-- Description:	Delete Laborder
-- =============================================
CREATE PROCEDURE Laboratory_DeleteLabOrder 
	-- Add the parameters for the stored procedure here
	@LabOrderId int,
	@DeletedBy int,
	@DeleteReason varchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Begin Transaction LabOrder
	Begin Try
		Update ord_LabOrder Set
				DeleteFlag = 1
			,	DeletedBy=@DeletedBy
			,	DeleteDate=getdate()
			,	DeleteReason= @DeleteReason
		Where Id = @LabOrderId;
		Update dtl_LabOrderTest Set
				DeleteFlag = 1
		Where LabOrderId = @LabOrderId;

		Update dtl_LabOrderTestResult Set
				DeleteFlag = 1
		Where LabOrderId = @LabOrderId;

		If @@TRANCOUNT > 0 Commit Transaction LabOrder;
	End Try 
	Begin Catch
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
		Select	@ErrorMessage = error_message(),
				@ErrorSeverity = error_severity(),
				@ErrorState = error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
		If @@TRANCOUNT > 0 Rollback Transaction LabOrder;
	End Catch;
END
GO

/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestParameter]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestParameter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveTestParameter]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabTest]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveLabTest]
GO			   
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupRemoveTest]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupRemoveTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GroupRemoveTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupGetLabTest]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupGetLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GroupGetLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupAddTest]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupAddTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GroupAddTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestParameterResult]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestParameterResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetTestParameterResult]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestDepartment]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestDepartment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetTestDepartment]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetResultUnit]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetResultUnit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetResultUnit]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultOption]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultOption]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetParameterResultOption]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultConfig]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultConfig]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetParameterResultConfig]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTestParameters]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTestParameters]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabTestParameters]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTest]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrderTests]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrderTests]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabOrderTests]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrder]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_GetLabOrder]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_FindTestByName]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_FindTestByName]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_FindTestByName]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteTestParameter]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteTestParameter]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_DeleteTestParameter]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabTest]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_DeleteLabTest]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SetLabTestDeleteFlag]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SetLabTestDeleteFlag]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_ActivateLabTest]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_ActivateLabTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_ActivateLabTest]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteLabTest]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_DeleteLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Delete Lab Test
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_DeleteLabTest] 
	-- Add the parameters for the stored procedure here
	@LabTestId int , 	
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update mst_LabTestMaster Set DeleteFlag = 1, DeletedBy=@UserId, DeleteDate=getdate() Where Id=@LabTestId;
END

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_ActivateLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_ActivateLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Inactivite/Activate Lab Test
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_ActivateLabTest]
	-- Add the parameters for the stored procedure here
	@LabTestId int , 	
	@Active bit,
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update mst_LabTestMaster Set Active = @Active Where Id=@LabTestId;
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_DeleteTestParameter]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_DeleteTestParameter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_DeleteTestParameter] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Delete Lab Test Parameter
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_DeleteTestParameter] 
	-- Add the parameters for the stored procedure here
	@ParameterId int , 
	@LabTestId int , 
	@UserId int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Mst_LabTestParameter Set DeleteFlag= 1,UserId=@UserId, UpdateDate=getdate()  Where Id = @ParameterId;
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_FindTestByName]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_FindTestByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_FindTestByName] AS' 
END
GO


 
ALTER PROCEDURE [dbo].[Laboratory_FindTestByName] 
      -- Add the parameters for the stored procedure here
      @SearchText varchar(15),
	  @ExcludeGroup bit= 0
AS
BEGIN
      -- SET NOCOUNT ON added to prevent extra result sets from
      -- interfering with SELECT statements.
      SET NOCOUNT ON;
      If ltrim(rtrim(@SearchText)) <> ''
      Begin
            Select @SearchText = '%'+@SearchText+'%';
            
            Select @SearchText = Case When nullif(@SearchText,'') Is Null Then Null Else '%'+@SearchText+'%' End
		-- Insert statements for procedure here
			Select	Id,
					ReferenceId,
					Name,
					IsGroup,
					DepartmentId,
					Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
					ParameterCount,
					DeleteFlag
			From mst_LabTestMaster As M
			Where (DeleteFlag = 0)
			And Active = 1
			And  Name Like @SearchText
			And Case When @ExcludeGroup = 1 And IsGroup = 1 Then 0 Else 1 End = 1
			And (ParameterCount > 0 Or IsGroup = 1);
       
                  
      End
      
    -- Insert statements for procedure here
      
 END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrder]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabOrder] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get Lab Order details
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabOrder] 
	-- Add the parameters for the stored procedure here
	@LabOrderId int = null,
	@PatientPk int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Select	O.Id LabOrderId,
			O.OrderNumber ,
			O.Ptn_pk PatientPk,
			O.LocationId,
			O.VisitId,
			O.OrderedBy ,
			O.OrderDate OrderDate,
			O.ClinicalOrderNotes ClinicalNotes,
			O.DeleteFlag,
			O.ModuleId ,
			O.PreClinicLabDate,
			O.UserId,
			O.Createdby,
			O.CreateDate,
			O.UpdateDate,
			OrderStatus
	From ord_LabOrder O
	Where (O.Id = @LabOrderId Or @LabOrderId Is Null)
	And	  (O.Ptn_Pk = @PatientPk Or @PatientPk Is Null);

	
	
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrderTests]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabOrderTests]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabOrderTests] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get the lab tests in lab order order
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabOrderTests] 
	-- Add the parameters for the stored procedure here
	@LabOrderId int ,
	@LabOrderTestId int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select 
		P.LabOrderId,
		O.OrderedBy,
		O.ModuleId,
		O.OrderDate,
		O.OrderNumber,
		P.Id TestOrderId,
		P.LabTestId TestId,
		L.Name TestName,
		P.TestNotes,
		P.ResultNotes,
		D.LabDepartmentName Department,
		D.LabDepartmentId DepartmentId,
		L.IsGroup,	
		P.DeleteFlag,		
		P.ParentTestId,
		P.IsParent,		
		L.DeleteFlag TestDeleteFlag,
		L.ReferenceId,	
		P.ResultBy,
		P.ResultDate,
		P.ResultStatus,
		P.UserId,
		P.StatusDate,
		HasResult = Case When (Select Count(HasResult) - Sum(Convert(int,HasResult))
						From dtl_LabOrderTestResult R 
					 Where P.LabOrderId=@LabOrderId 
						And R.LabOrderTestId = P.Id
					) = 0 Then Convert(bit,1) Else Convert(bit,0) End
	From dtl_LabOrderTest P
	Inner Join mst_LabTestMaster L On L.Id = P.LabTestID
	Inner Join ord_LabOrder O On O.Id = P.LabOrderId
	Left Outer join mst_LabDepartment D On D.LabDepartmentID = L.DepartmentId
	Where P.LabOrderID = @LabOrderId  And (P.Id = @LabOrderTestId Or @LabOrderTestId Is Null)
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTest]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160212
-- Description:	Get Lab Test.
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabTest] 
	-- Add the parameters for the stored procedure here
	@LabTestId int = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	
-- Insert statements for procedure here
	Select	Id,
			ReferenceId,
			Name,
			IsGroup,
			DepartmentId,
			Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
			ParameterCount,
			Active,
			DeleteFlag
	From mst_LabTestMaster As M
	Where DeleteFlag = 0  And (Id = isnull(@LabTestId, Id))
End

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabTestParameters]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetLabTestParameters]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetLabTestParameters] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get Testparameters for a labtest
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabTestParameters] 
	-- Add the parameters for the stored procedure here
	@LabTestId int , 
	@ParameterId int = null
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

-- Insert statements for procedure here
Select	Id,
		ReferenceId,
		ParameterName,
		LabTestId,
		DataType,
		P.OrdRank,
		LoincCode,
		UserId,
		CreateDate,
		UpdateDate,
		DeleteFlag
From Mst_LabTestParameter As P
Where (LabTestId = @LabTestId)
And (Id = isnull(@ParameterId, Id))
And (DeleteFlag = 0)
End


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultConfig]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultConfig]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetParameterResultConfig] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160224
-- Description:	Get the lab test parameter result option
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetParameterResultConfig]
	-- Add the parameters for the stored procedure here
	@ParameterId int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

Select	Id,
		C.ParameterId,
		MinBoundary,
		MaxBoundary,
		MinNormalRange,
		MaxNormalRange,
		Isnull(DefaultUnit,0) DefaultUnit,
		U.UnitName,
		C.UnitId,
		DetectionLimit
From dtl_LabTestParameterConfig C
Inner Join vw_LabTestParameterUnits U On U.UnitId = C.UnitId
Where ParameterId = @ParameterId
And C.DeleteFlag = 0


End

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetParameterResultOption]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetParameterResultOption]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetParameterResultOption] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160224
-- Description:	Get the lab test parameter result option
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetParameterResultOption] 
	-- Add the parameters for the stored procedure here
	@ParameterId int
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;

Select	Id,
		Value,
		ParameterId,
		DeleteFlag
From dtl_LabTestParameterResultOption
Where ParameterId = @ParameterId And DeleteFlag = 0 Order by Value
End

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetResultUnit]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetResultUnit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetResultUnit] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Get Test result units
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetResultUnit] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select UnitId UnitID,UnitName Name from vw_LabTestParameterUnits Where DeleteFlag=0 order by Name   
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestDepartment]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestDepartment]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetTestDepartment] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Get Test departments
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetTestDepartment] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select D.LabDepartmentID Id, D.LabDepartmentName Name, D.DeleteFlag from mst_LabDepartment D Where D.DeleteFlag = 0  
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetTestParameterResult]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GetTestParameterResult]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GetTestParameterResult] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get test parameter result
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetTestParameterResult] 
	-- Add the parameters for the stored procedure here
	@LabTestOrderId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 Select 
		R.Id  Id,
		LabOrderId,
		R.LabTestId,
		LabOrderTestId ,
		R.ParameterId,	
		ResultValue,
		isnull(Undetectable,0)Undetectable,
		DetectionLimit,
		ResultText,
		ResultOption,
		ResultOptionId,
		R.UserId,
		R.DeleteFlag,
		HasResult,
		ResultConfigId,
		ResultUnitId,
		ResultUnit,
		R.CreateDate	,
		P.ParameterName,
		P.ReferenceId,
		P.DataType	,
		P.OrdRank,
		P.DeleteFlag ParamDeleteFlag	,
		R.StatusDate
	From dtl_LabOrderTestResult R Inner Join Mst_LabTestParameter P
	On R.ParameterId = P.Id			 
	Where R.LabOrderTestId = @LabTestOrderId And R.DeleteFlag=0 AND P.DeleteFlag=0
	Order By P.OrdRank;
END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupAddTest]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupAddTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GroupAddTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 201602023
-- Description:	Add labTest to group
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GroupAddTest] 
	-- Add the parameters for the stored procedure here
	@MainTestId int , 
	@LabTestId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		Delete From lnk_GroupLabTest Where GroupLabTestId = @MainTestId And LabTestId=@LabTestId;
		Insert Into lnk_GroupLabTest(GroupLabTestId,LabTestId) Values(@MainTestId, @LabTestId);
	END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupGetLabTest]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupGetLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GroupGetLabTest] AS' 
END
GO

-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 201602023
-- Description:	Get the labtests in a group
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GroupGetLabTest] 
	-- Add the parameters for the stored procedure here
	@MainTestId int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select	
		M.Id,
		M.ReferenceId,
		M.Name,
		M.IsGroup,
		M.DepartmentId,
		Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
		M.ParameterCount,
		M.DeleteFlag,
		M.Active
	From lnk_GroupLabTest As G
	Inner Join mst_LabTestMaster As M On M.Id = G.LabTestId
	Where  M.DeleteFlag = 0 And G.GroupLabTestId = @MainTestId And M.IsGroup = 0
END


GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GroupRemoveTest]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_GroupRemoveTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_GroupRemoveTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Remove lab test from a group
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GroupRemoveTest]
	-- Add the parameters for the stored procedure here
	@MainTestId int , 
	@LabTestId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Delete From lnk_GroupLabTest Where GroupLabTestId = @MainTestId And LabTestId=@LabTestId;
END

GO	  

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabOrder]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveLabOrder]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Laboratory_SaveLabOrder]                                       
	@PatientPk int,                  
	@LocationId int,   
	@UserId int,                  
	@OrderedBy int,                                      
	@OrderDate datetime,     
	@LabOrderId int = Null,    
	@PreClinicDate datetime=null,
	@ClinicalNotes varchar(250) = null   ,	
	@itemList xml = null  ,  
	@ParameterList xml = null,
	@VisitId int = null,  
	@ModuleId int              
As                             
Begin

	Set Nocount On;
	Declare @OrderedTest Table(TestId int, TestNotes varchar(255), IsGroup bit, IsParent bit, ParentTestId int);	
	Declare @SavedTest Table(OrderTestId int, LabTestId int);
	Declare @OrderNumber varchar(50);
	;With LabR As
		(
			Select
				L.G.query('testid').value('.', 'int') TestId,
				nullif(L.G.query('testnotes').value('.', 'varchar(255)'), '') TestNotes,
				L.G.query('isgroup').value('.', 'bit') IsGroup
			From @itemList.nodes('/root/request') As L (G)
		)
	Insert Into @OrderedTest (
		TestId,
		TestNotes,
		IsGroup,
		IsParent)
		Select	TestID,
				TestNotes,
				IsGroup,
				1 IsParent
		From LabR;
	Insert Into @OrderedTest (
		TestId,
		TestNotes,
		IsGroup,
		IsParent,
		ParentTestId)
		Select	G.LabTestId TestId,
				Null As TestNotes,
				0 IsGroup,
				0 IsParent,
				L.TestId As ParentTestId
		From @OrderedTest L
		Inner Join lnk_GroupLabTest G On L.TestId = G.GroupLabTestId
				And L.IsGroup = 1;

	Begin Transaction LabOrder
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
			@PatientPk,
			@LocationId,
			@OrderDate,
			6,
			0,
			@UserID,
			getdate(),
			@OrderDate,
			@ModuleId,
			@OrderedBy );
		Select @VisitId = scope_identity();

		Select @OrderNumber = max(convert(varchar, replace(OrderNumber, '-', '')))
		From ord_LabOrder
		Where OrderNumber Like convert(varchar, datepart(Year, getdate())) + '-%'

		If (@OrderNumber Is Null) Select @OrderNumber = convert(varchar(4),datepart(year, getdate())) + replicate('0', 5) + convert(varchar, 1); 
		Else Select @OrderNumber = convert(int, @OrderNumber) + 1;

		Select @OrderNumber = stuff(@OrderNumber, 5, 0, '-');

		Insert Into ord_LabOrder (
			Ptn_Pk,
			LocationId,
			ModuleId,
			VisitId,
			OrderedBy,
			OrderDate,
			CreateDate,
			CreatedBy,
			UserId,
			PreClinicLabDate,
			ClinicalOrderNotes,
			OrderNumber,
			OrderStatus,
			DeleteFlag
		)
		Values (
			@PatientPk,
			@LocationId,
			@ModuleId,
			@VisitId,
			@OrderedBy,
			@OrderDate,
			getdate(),
			@UserID,
			@UserId,			
			@PreClinicDate,
			@ClinicalNotes,
			@OrderNumber,			
			'Pending',
			0 );

		Select @LabOrderId = scope_identity();

		Insert Into dtl_LabOrderTest (
			LabOrderId,
			LabTestId,
			TestNotes,
			IsParent,
			ParentTestId,
			DeleteFlag,
			ResultStatus,
			UserId,
			StatusDate)
		Output Inserted.Id, Inserted.LabTestId Into @SavedTest (OrderTestId, LabTestId)
			Select	@LabOrderId,
					T.TestId,
					T.TestNotes,
					T.IsParent,
					T.ParentTestId,
					0,
					'Pending',
					@UserId,
					getdate()
			From @OrderedTest T;

		Insert Into dtl_LabOrderTestResult (
			LabOrderId,
			LabTestId,
			LabOrderTestId,
			ParameterId,
			CreatedBy,
			CreateDate,
			UserId,
			DeleteFlag,
			StatusDate)
			Select	@LabOrderId,
					T.LabTestId,
					T.OrderTestId,
					P.Id,
					@UserId,
					getdate(),
					@UserId,
					0,
					getdate()
			From Mst_LabTestParameter P
			Inner Join @SavedTest T On T.LabTestId = P.LabTestId
			Where p.DeleteFlag =0 Order By OrdRank;

			-- Output the saved stuff.
			
			Select Id LabOrderId,
					O.Ptn_pk PatientPk,
					LocationId,
					O.OrderedBy,
					O.OrderDate,
					O.CreateDate ,
					O.UserId,
					O.PreClinicLabDate PreClinicDate,
					VisitId,
					O.OrderNumber,
					ModuleId,
					O.ClinicalOrderNotes ClinicalNotes,
					O.OrderStatus,
					O.CreatedBy,
					O.UpdateDate,
					O.DeleteFlag
			 From ord_LabOrder O Where O.Id = @LabOrderId;

			If @@TRANCOUNT > 0 Commit Transaction LabOrder;
	End Try 
	Begin Catch
		Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
		Select	@ErrorMessage = error_message(),
				@ErrorSeverity = error_severity(),
				@ErrorState = error_state();
		Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
		If @@TRANCOUNT > 0 Rollback Transaction LabOrder;
	End Catch;
End

GO


/****** Object:  StoredProcedure [dbo].[Laboratory_SaveLabTest]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveLabTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveLabTest] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njunge
-- Create date: 20160223
-- Description:	Save Lab Test
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_SaveLabTest] 
	-- Add the parameters for the stored procedure here
	 
	@ReferenceId varchar(36) = null,
	@TestName varchar(250),
	@IsGroup bit = 0,
	@DepartmentId int = null,
	@LoincCode varchar(15) = null,
	--@ParameterList xml = null,
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @LabTestId int;
	Declare @ParameterId int ;
	Select @ReferenceId = Isnull(@ReferenceId, Convert(varchar(36),newid()));
	Begin Transaction saveLabTest
	Begin Try
		If Exists(Select 1 From mst_LabTestMaster Where Name = @TestName) Begin
			Raiserror('Duplication Error :: Another lab test exists with the same name',16,1);
			Return 0;
		End
		If Exists(Select 1 From mst_LabTestMaster Where ReferenceId = @ReferenceId) Begin
			Raiserror('Duplication Error :: Another lab test exists with the Reference Id',16,1);
			Return 0;
		End
		Insert Into mst_LabTestMaster (
			ReferenceId,
			Name,
			IsGroup,
			DepartmentId,
			LoincCode,
			Active,
			DeleteFlag)
		Values (
			@ReferenceId,
			@TestName,
			@IsGroup,
			@DepartmentId,
			@LoincCode,
			1,
			0 );
		Select @LabTestId = Scope_Identity();

	
		Select	Id,
			ReferenceId,
			Name,
			IsGroup,
			DepartmentId,
			Department = (select D.LabDepartmentName From mst_LabDepartment D Where D.LabDepartmentID = M.DepartmentId),
			ParameterCount,
			Active,
			DeleteFlag
		From mst_LabTestMaster As M
		Where (Id = @LabTestId);
			
		If @@TRANCOUNT > 0 Commit Transaction saveLabTest;
		End Try 
		Begin Catch
			Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
			Select	@ErrorMessage = error_message(),
					@ErrorSeverity = error_severity(),
					@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0 Rollback Transaction saveLabTest;
		End Catch;

END

GO
/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestParameter]    Script Date: 03/17/2016 06:54:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestParameter]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Laboratory_SaveTestParameter] AS' 
END
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Save Test Parameter
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_SaveTestParameter] 
	-- Add the parameters for the stored procedure here
	@ParameterId int = null,
	@ReferenceId varchar(36),
	@Name varchar(250),
	@LabTestId int,
	@DataType varchar(20),
	@Rank decimal(5,2) = 0.00,
	@LoincCode varchar(50) = null,
	@UserId int,
	@DeleteFlag bit= 0,
	@OptionList xml = null,
	@ConfigList xml = null

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
Set Nocount On;
	declare @ResultOption Table(OptionId int, OptionValue varchar(50), DeleteFlag bit);
	declare @Config Table(
			ConfigId int,
			MinBoundary decimal(10,2),
			MaxBoundary decimal(10,2),
			MinNormal decimal(10,2),
			MaxNormal decimal(10,2),
			Unit int,
			DefaultUnit bit,
			Limit decimal(10,2),
			DeleteFlag bit);

		Begin Transaction saveTP
		Begin Try
			If (@ParameterId Is Null Or @ParameterId < 1 ) Begin
				Insert Into Mst_LabTestParameter (
					ReferenceId,
					parameterName,
					LabTestId,
					DataType,
					OrdRank,
					UserId,
					CreateDate,
					DeleteFlag,
					LoincCode)
				Values (
					@ReferenceId,
					@Name,
					@LabTestId,
					@DataType,
					@Rank,
					@UserId,
					getdate(),
					0,
					@LoincCode );
				Select @ParameterId = scope_identity();
			End
			Else Begin
				Update Mst_LabTestParameter Set
					ParameterName = isnull(@Name,ParameterName),
					DataType = @DataType,
					OrdRank = @Rank,
					LoincCode=@LoincCode,
					UpdateDate=getdate(),
					UserId =@UserId
				Where Id=@ParameterId;
			End
			If(@ConfigList Is Not Null) Begin
				Insert Into @Config(ConfigId, MinBoundary,MaxBoundary,MinNormal,MaxNormal, Unit,DefaultUnit,Limit,DeleteFlag)
				Select
					L.P.query('configid').value('.', 'int') ConfigId,
					convert(decimal(10,2),nullif(L.P.query('minboundary').value('.', 'varchar(10)'),'')) MinBoudary,
					convert(decimal(10,2),nullif(L.P.query('maxboundary').value('.', 'varchar(10)'),''))MaxBoundary,
					convert(decimal(10,2),nullif(L.P.query('minnormal').value('.', 'varchar(10)'),'')) MinNormal,
					convert(decimal(10,2),nullif(L.P.query('maxnormal').value('.', 'varchar(10)'),'')) MaxNormal,			
					L.P.query('unit').value('.', 'int') unit,
					L.P.query('defaultunit').value('.', 'bit') defaultunit,
					convert(decimal(10,2),nullif(L.P.query('limit').value('.', 'varchar(10)'),'')) Limit,	
					L.P.query('deleteflag').value('.', 'bit') DeleteFlag
				From @ConfigList.nodes('/root/config') As L (P);		
			End
			If(@OptionList Is Not Null) Begin
				Insert Into @ResultOption(OptionId,OptionValue,DeleteFlag)
				Select
					L.O.query('optionid').value('.', 'int') OptionId,
					L.O.query('value').value('.', 'varchar(50)') Value,
					L.O.query('deleteflag').value('.', 'bit') DeleteFlag
				From @OptionList.nodes('/root/options') As L (O);
			End
	
			Update p Set	
				MinBoundary= C.MinBoundary,
				MaxBoundary = C.MaxBoundary,
				MinNormalRange = C.MinNormal,
				MaxNormalRange = C.MaxNormal,
				UnitId = C.Unit,
				DefaultUnit = C.DefaultUnit,
				DetectionLimit = C.Limit,
				DeleteFlag = C.DeleteFlag
			From dtl_LabTestParameterConfig P
			Inner Join @Config C On  C.ConfigId = P.Id	And p.ParameterId = @ParameterId;

			Update p Set	
				MinBoundary= C.MinBoundary,
				MaxBoundary = C.MaxBoundary,
				MinNormalRange = C.MinNormal,
				MaxNormalRange = C.MaxNormal,
				UnitId = C.Unit,
				DefaultUnit = C.DefaultUnit,
				DetectionLimit = C.Limit,
				DeleteFlag = C.DeleteFlag
			From dtl_LabTestParameterConfig P
			Inner Join @Config C On C.Unit = P.UnitId
			Where P.ParameterId = @ParameterId And (ConfigId < 1 or ConfigId Is Null);


			Delete C From @Config C Inner Join dtl_LabTestParameterConfig P On P.UnitId = C.Unit
			Where P.ParameterId = @ParameterId And (ConfigId < 1 or ConfigId Is Null);

			Insert Into dtl_LabTestParameterConfig (
				ParameterId,
				MinBoundary,
				MaxBoundary,
				MinNormalRange,
				MaxNormalRange,
				UnitId,
				DefaultUnit,
				DetectionLimit,
				DeleteFlag)
			Select 
				@ParameterId,
				MinBoundary,
				MaxBoundary,
				MinNormal,
				MaxNormal,
				Unit,
				DefaultUnit,
				Limit,
				0
			From @Config Where DeleteFlag = 0 And (ConfigId < 1 or ConfigId Is Null) ;

			Update RO Set
				Value = O.OptionValue,
				DeleteFlag = O.DeleteFlag
			From dtl_LabTestParameterResultOption RO
			Inner Join @ResultOption O On RO.Id = O.OptionId
					And RO.ParameterId = @ParameterId;

			Insert Into dtl_LabTestParameterResultOption (
				ParameterId,
				Value,
				DeleteFlag)
			Select	@ParameterId,
					OptionValue,
					0
			From @ResultOption Where DeleteFlag = 0 And (OptionId < 1 or OptionId Is Null);

			Select	Id,
					ReferenceId,
					ParameterName,
					LabTestId,
					DataType,
					P.OrdRank,
					LoincCode,
					UserId,
					CreateDate,
					UpdateDate,
					DeleteFlag
			From Mst_LabTestParameter As P
			Where (Id = @ParameterId);

			Select	Id,
					ParameterId,
					MinBoundary,
					MaxBoundary,
					MinNormalRange,
					MaxNormalRange,
					C.UnitId,
					U.UnitName,
					Isnull(DefaultUnit,0) DefaultUnit,
					DetectionLimit,
					C.DeleteFlag
			From dtl_LabTestParameterConfig C
			Inner Join vw_LabTestParameterUnits U On U.UnitId = C.UnitId
			Where (ParameterId = @ParameterId)
			And (C.DeleteFlag = 0);

			Select	Id,
					ParameterId,
					Value,
					DeleteFlag
			From dtl_LabTestParameterResultOption
			Where (ParameterId = @ParameterId)
			And (DeleteFlag = 0);
		If @@TRANCOUNT > 0 Commit Transaction saveTP;
		End Try 
		Begin Catch
			Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
			Select	@ErrorMessage = error_message(),
					@ErrorSeverity = error_severity(),
					@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0 Rollback Transaction saveTP;
		End Catch;
End
GO

/****** Object:  StoredProcedure [dbo].[Laboratory_SaveTestResult]    Script Date: 03/17/2016 06:54:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratory_SaveTestResult]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Laboratory_SaveTestResult]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Joseph N
-- Create date: 20160223
-- Description:	Save Lab Result
-- =============================================
CREATE PROCEDURE [dbo].[Laboratory_SaveTestResult] 
	-- Add the parameters for the stored procedure here
	@LabTestOrderId int , 
	
	@ParameterList xml = null   ,
	@UserId int ,
	@ResultNotes varchar(250) = null,
	@ResultBy int,
	@ResultDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @Results Table(ResultId int, 
							ParameterId int, 
							ResultValue decimal(10,2), 
							ResultText varchar(400), 
							ResultOption varchar(50), 
							ResultOptionValue int,
							ResultDate datetime, 
							ResultBy int,
							ResultUnit varchar(50) , 							
							ConfigId int,
							ResultUnitValue int,
							Undetectable bit,
							DetectionLimit decimal(10,2));
	
			Insert Into @Results(
				ResultId,
				ParameterId,
				ResultValue,
				ResultText,
				ResultOption,
				ResultOptionValue,
				ResultDate,
				ResultBy,
				ResultUnitValue,
				ResultUnit,				
				Undetectable,
				DetectionLimit,
				ConfigId
			)
			Select
				L.G.query('id').value('.', 'int') ResultId,
				L.G.query('parameterid').value('.', 'int') ParameterId,
				Convert(decimal(10,2),nullif(L.G.query('resultvalue').value('.', 'varchar(10)'), '')) ResultValue,
				nullif(L.G.query('resulttext').value('.', 'varchar(400)'), '') ResultText,
				nullif(L.G.query('resultoption').value('.', 'varchar(50)'), '') ResultOption,
				nullif(L.G.query('resultoptionvalue').value('.', 'int'), '') ResultOptionValue,
				nullif(L.G.query('resultdate').value('.', 'datetime'), '') ResultDate,
				nullif(L.G.query('resultby').value('.', 'int'), '') ResultBy,
				nullif(L.G.query('resultunitid').value('.', 'int'), '') ResultUnitValue,
				nullif(L.G.query('resultunit').value('.', 'varchar(50)'), '') ResultUnit ,
				nullif(L.G.query('undetectable').value('.', 'bit'), '') Undetectable,
				Convert(decimal(10,2),nullif(L.G.query('detectionlimit').value('.', 'varchar(10)'), '')) DetectionLimit,
				nullif(L.G.query('configid').value('.', 'int'), '') ConfigId
			From @ParameterList.nodes('/root/result') As L (G);
		
			
		Begin Transaction LabOrder
		Begin Try
			
			Update T Set
				ResultValue		= Isnull(T.ResultValue,R.ResultValue),
				ResultText		= Isnull(T.ResultText,R.ResultText),
				ResultOption	= Isnull(T.ResultOption,R.ResultOption),
				ResultOptionId  = Isnull(T.ResultOptionId, R.ResultOptionValue),
				ResultUnitId	= isnull(T.ResultUnitId, R.ResultUnitValue),
				ResultUnit		= Isnull(T.ResultUnit,R.ResultUnit),
				Undetectable	= Isnull(T.Undetectable,R.Undetectable),
				DetectionLimit	= Isnull(T.DetectionLimit, R.DetectionLimit),
				ResultConfigId	=isnull(T.ResultConfigId,R.ConfigId),
				Statusdate		= getdate(),
				UserId= @UserId
			From dtl_LabOrderTestResult T
			Inner Join @Results R On R.ResultId = T.Id
					And R.ParameterId = T.ParameterId
			Where T.HasResult = 0
			And T.DeleteFlag = 0
			And T.LabOrderTestId = @LabTestOrderId;
			If(@@rowcount > 0) Begin
				Update dtl_LabOrderTest Set 
					ResultNotes = nullif(@ResultNotes,'') ,
					ResultBy = @ResultBy,
					ResultDate = @ResultDate,
					ResultStatus='Received',
					UserId = @UserId,
					StatusDate = getdate()
				Where Id = @LabTestOrderId;

				declare @labOrderId int, @PendingCount int;	
			
				Select Top 1 @labOrderId = T.LabOrderId From   dtl_LabOrderTest T Where Id=@LabTestOrderId;

				Select @PendingCount = Count(T.Id)
				From dtl_LabOrderTest T
				Inner Join mst_LabTestMaster M On T.LabTestId = M.Id
				Where T.LabOrderId = @labOrderId
					And M.IsGroup = 0
					And T.ResultDate Is Null;

					--Select  @labOrderId  = Max(LabOrderId),
					--	@PendingCount = Count(T.Id) - Sum(Case When ResultDate Is Not Null Then 1 Else 0 End)
				 --From dtl_LabOrderTest T Inner Join mst_LabTestMaster M On T.LabTestId= M.Id Where LabOrderId = @labOrderId And M.IsGroup = 0;
				 -- T.Id=@LabTestOrderId And M.IsGroup = 0;
				 
				-- Update ord_LabOrder Set OrderStatus = Case When @PendingCount = 0 Then 'Complete' Else OrderStatus End
				Update ord_LabOrder Set OrderStatus =  'Partially Completed'	 Where Id=@labOrderId;

				If(@PendingCount = 0) Begin
					Update dtl_LabOrderTest Set
							ResultStatus = 'Received'
						,	ResultNotes = 'Group lab tests complete'
						,	UserId = @UserId
						,	ResultDate = @ResultDate
						,	StatusDate = getdate()
						,	ResultBy = @ResultBy
					Where LabOrderId = @labOrderId
					And ResultDate Is Null
					Update ord_LabOrder Set OrderStatus = 'Complete'  Where Id=@labOrderId;	
					Update ord_Visit set DataQuality = 1 Where Visit_Id = (Select VisitId From ord_LabOrder Where Id= @labOrderId)
				End

			End
			If @@TRANCOUNT > 0 Commit Transaction LabOrder;
		End Try 
		Begin Catch
			Declare @ErrorMessage nvarchar(4000), @ErrorSeverity int, @ErrorState int;
			Select	@ErrorMessage = error_message(),
					@ErrorSeverity = error_severity(),
					@ErrorState = error_state();
			Raiserror (@ErrorMessage, @ErrorSeverity, @ErrorState);
			If @@TRANCOUNT > 0 Rollback Transaction LabOrder;
		End Catch;

END


GO