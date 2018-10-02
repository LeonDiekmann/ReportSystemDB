CREATE PROCEDURE [dbo].[spAddOrUpdateReport]
	@Id INT = -1,
	@CreatorId INT = NULL,
	@ImageUrl VARCHAR(256) = NULL,
	@ShortDescription VARCHAR(256) = NULL,
	@Description VARCHAR(256) = NULL,
	@DestinationId INT = NULL
AS
BEGIN
	SELECT @Id,@CreatorId,@ImageUrl,@ShortDescription,@Description,@DestinationId

	DECLARE @DBId int
	Set @DBId = (SELECT Id FROM [Report] WHERE Id = @Id)
	if(@DBId is NULL)
		begin
			INSERT INTO [dbo].[Report]
				([CreatorId],[ImageUrl],[ShortDescription],[Description],[DestinationId])
				VALUES
				(@CreatorId,@ImageUrl,@ShortDescription,@Description,@DestinationId)
			SET @DBId = @@IDENTITY
		end
	else
		begin
			UPDATE [dbo].[Report]
			SET [CreatorId] = case when @CreatorId is null then CreatorId else @CreatorId end,
			[ImageUrl] = case when @ImageUrl is null then ImageUrl else @ImageUrl end,
			[ShortDescription] = case when @ShortDescription is null then ShortDescription else @ShortDescription end,
			[Description] = case when @Description is null then Description else @Description end,
			[DestinationId] = case when @DestinationId is null then DestinationId else @Description end
			WHERE Id = @Id
		end
	return @DBId
END