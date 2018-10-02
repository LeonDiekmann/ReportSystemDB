CREATE PROCEDURE [dbo].[spAddOrUpdateDestination]
	@Id INT = -1,
	@Name VARCHAR(256) = NULL,
	@BoardId INT = NULL,
	@Location VARCHAR(256) = NULL
AS
BEGIN
	SELECT @Id,@Name,@BoardId,@Location

	DECLARE @DBId int
	Set @DBId = (SELECT Id FROM Destination WHERE Id = @Id)
	if(@DBId is NULL)
		begin
			INSERT INTO [dbo].[Destination]
				([Name],[BoardId],[Location])
				VALUES
				(@Name,@BoardId,@Location)
			SET @DBId = @@IDENTITY
		end
	else
		begin
			UPDATE [dbo].[Destination]
			SET [Name] = case when @Name is null then Name else @Name end,
			[BoardId] = case when @BoardId is null then BoardId else @BoardId end,
			[Location] = case When @Location is null then Location else @Location end
			WHERE Id = @Id
		end
	return @DBId
END
