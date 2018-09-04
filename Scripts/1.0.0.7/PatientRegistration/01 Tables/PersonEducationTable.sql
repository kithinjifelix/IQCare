
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS
(
	SELECT *
	FROM sys.objects
	WHERE object_id = OBJECT_ID(N'[dbo].[PersonEducation]')
		  AND type IN(N'U')
)
BEGIN

CREATE TABLE [dbo].[PersonEducation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[EducationLevel] [int] NOT NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_PatientEducation_IsActive]  DEFAULT ((1)),
	[DeleteFlag] [bit] NOT NULL CONSTRAINT [DF_PersonEducation_Void]  DEFAULT ((0)),
	[CreatedBy] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[AuditData] [xml] NULL,
 CONSTRAINT [PK_PersonEducation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]



SET ANSI_PADDING OFF


ALTER TABLE [dbo].[PersonEducation]  WITH CHECK ADD  CONSTRAINT [FK_PersonEducation_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])


ALTER TABLE [dbo].[PersonEducation] CHECK CONSTRAINT [FK_PersonEducation_Person]


END