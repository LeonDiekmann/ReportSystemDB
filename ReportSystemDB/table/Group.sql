CREATE TABLE [dbo].[Group]
(
	[Id] INT NOT NULL PRIMARY KEY,
	[UacGroup] INT NOT NULL,
	[BoardId] INT NOT NULL REFERENCES Board(Id),
	[CreationTime] DATETIME2(7) DEFAULT getDate() NOT NULL,
	[DeleteTime] DATETIME2(7)
)
