CREATE TABLE [dbo].[Report]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[CreatorId] INT NOT NULL REFERENCES [dbo].[User](Id),
	[ImageUrl] VARCHAR(256),
	[ShortDescription] VARCHAR(256),
	[Description] VARCHAR(256),
	[DestinationId] INT NOT NULL REFERENCES Destination(Id),
	[CreationTime] DATETIME2(7) DEFAULT getDate() NOT NULL,
	[DeleteTime] DATETIME2(7)
)
