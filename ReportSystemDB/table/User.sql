CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[Username] VARCHAR(256) NOT NULL,
	[CreationTime] DATETIME2(7) NOT NULL DEFAULT getDate(),
	[DeleteTime] DATETIME2(7)
)
