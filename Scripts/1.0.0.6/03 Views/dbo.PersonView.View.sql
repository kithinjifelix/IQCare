/****** Object:  View [dbo].[PersonView]    Script Date: 25-May-2018 11:59:20 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PersonView]'))
DROP VIEW [dbo].[PersonView]
GO
/****** Object:  View [dbo].[PersonView]    Script Date: 25-May-2018 11:59:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[PersonView]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[PersonView]
AS
SELECT        Id, CAST(DECRYPTBYKEY(FirstName) AS VARCHAR(50)) AS FirstName, CAST(DECRYPTBYKEY(MidName) AS VARCHAR(50)) AS MiddleName, CAST(DECRYPTBYKEY(LastName) AS VARCHAR(50)) AS LastName, 
                         Sex, Active, DeleteFlag, CreateDate, CreatedBy, AuditData, DateOfBirth, DobPrecision
FROM            dbo.Person


' 
GO
