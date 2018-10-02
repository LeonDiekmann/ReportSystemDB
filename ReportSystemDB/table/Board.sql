CREATE TABLE [dbo].[Board]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[DestinationId] INT NOT NULL,
	[TappId] INT NOT NULL,
	[CreationTime] DATETIME2 DEFAULT getDate() NOT NULL, 
	[DeleteTime] DATETIME2
)
