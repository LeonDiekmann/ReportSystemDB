CREATE TABLE [dbo].[Destination]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[Name] VARCHAR(256) NOT NULL,
	[BoardId] INT NOT NULL REFERENCES Board(Id),
	[location] INT NOT NULL,
	[CreationTime] DATETIME2(7) DEFAULT getDate() NOT NULL,
	[DeleteTime] DATETIME2(7)
)
