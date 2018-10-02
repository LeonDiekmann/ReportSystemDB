CREATE PROCEDURE [dbo].[spAddOrUpdateBoard]
	@Id INT = -1,
	@DestinationId INT = NULL,
	@TappId INT = NULL
AS
BEGIN
	SELECT @Id,@DestinationId,@TappId

	DECLARE @DBId int
	Set @DBId = (SELECT Id FROM Board WHERE Id = @Id)
	if(@DBId is NULL)
		begin
			INSERT INTO [dbo].[Board]
				([DestinationId],[TappId])
				VALUES
				(@DestinationId,@TappId)
			SET @DBId = @@IDENTITY
		end
	else
		begin
			UPDATE [dbo].[Board]
			SET [DestinationId] = case when @DestinationId is null then DestinationId else @DestinationId end,
			[TappId] = case when @TappId is null then TappId else @TappId end
			WHERE Id = @Id
		end
	return @DBId
END