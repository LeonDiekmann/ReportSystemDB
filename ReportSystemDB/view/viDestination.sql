CREATE VIEW [dbo].[viDestination]
	AS SELECT Id, Name, BoardId, Location FROM [Destination]
	WHERE DeleteTime IS NULL
