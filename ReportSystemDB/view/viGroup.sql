CREATE VIEW [dbo].[viGroup]
	AS SELECT Id, UacGroup, BoardId FROM [Group]
	WHERE DeleteTime IS NULL
