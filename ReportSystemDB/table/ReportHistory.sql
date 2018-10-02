CREATE TABLE [dbo].[ReportHistory]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Status] INT NOT NULL,
	[UserId] INT REFERENCES [dbo].[User](Id),
	[GroupId] INT NOT NULL REFERENCES [dbo].[Group](Id),
	[ReportId] INT NOT NULL REFERENCES [dbo].[Report](Id),
	[CreationTime] DATETIME2(7) DEFAULT getDate() NOT NULL,
	[DeleteTime] DATETIME2(7)
)
