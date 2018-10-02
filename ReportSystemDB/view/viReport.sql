CREATE VIEW [dbo].[viReport]
	AS SELECT Id, CreatorId, ImageUrl, ShortDescription, Description, DestinationId FROM [Report]
	WHERE DeleteTime IS NULL
