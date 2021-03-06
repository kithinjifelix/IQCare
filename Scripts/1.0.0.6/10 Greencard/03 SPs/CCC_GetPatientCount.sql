IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CCC_GetPatientCount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CCC_GetPatientCount]
GO
/****** Object:  StoredProcedure [dbo].[CCC_GetPatientCount]    Script Date: 2/27/2018 7:09:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CCC_GetPatientCount]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT        COUNT(distinct PT.Id) AS PatientCount
	FROM            dbo.Patient AS PT INNER JOIN
							 dbo.PatientEnrollment AS PE ON PT.Id = PE.PatientId INNER JOIN
							 dbo.PatientIdentifier AS PI ON PE.Id = PI.PatientEnrollmentId AND PT.Id = PI.PatientId INNER JOIN
							 dbo.Identifiers AS IDE ON PI.IdentifierTypeId = IDE.Id
	WHERE        (PT.DeleteFlag = 0) AND (IDE.Name = 'CCC Registration Number')
END

