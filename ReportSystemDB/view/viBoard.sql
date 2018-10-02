CREATE VIEW [dbo].[viBoard]
	AS SELECT Id, DestinationId, TappId FROM [Board]
	WHERE DeleteTime IS NULL
