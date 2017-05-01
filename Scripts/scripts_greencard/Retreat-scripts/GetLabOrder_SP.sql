USE [IQCareDefault]
GO
/****** Object:  StoredProcedure [dbo].[Laboratory_GetLabOrder]    Script Date: 4/27/2017 3:54:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Joseph Njung'e
-- Create date: 20160223
-- Description:	Get Lab Order details
-- =============================================
ALTER PROCEDURE [dbo].[Laboratory_GetLabOrder] 
	-- Add the parameters for the stored procedure here
	@LabOrderId int = null,
	@PatientId int = null
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
	And	  (O.Ptn_Pk = @PatientId Or @PatientId Is Null);

	
	
END

