CREATE PROCEDURE [dbo].[spAddOrUpdateGroup]
	@Id INT = -1,
	@UacGroup INT = NULL,
	@BoardId INT = NULL
AS
BEGIN
	SELECT @Id,@BoardId,@BoardId

	DECLARE @DBId int
	Set @DBId = (SELECT Id FROM [Group] WHERE Id = @Id)
	if(@DBId is NULL)
		begin
			INSERT INTO [dbo].[Group]
				([UacGroup],[BoardId])
				VALUES
				(@UacGroup,@BoardId)
			SET @DBId = @@IDENTITY
		end
	else
		begin
			UPDATE [dbo].[Group]
			SET [UacGroup] = case when @UacGroup is null then UacGroup else @UacGroup end,
			[BoardId] = case when @BoardId is null then BoardId else @BoardId end
			WHERE Id = @Id
		end
	return @DBId
END