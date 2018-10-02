CREATE VIEW [dbo].[viUser]
	AS SELECT Id, Username FROM [User]
	WHERE DeleteTime IS NULL
