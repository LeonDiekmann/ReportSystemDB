CREATE PROCEDURE [dbo].[spAddOrUpdateUser]
	@Id INT = -1,
	@Username VARCHAR(256) = NULL
AS
BEGIN
	SELECT @Id,@Username

	DECLARE @DBId int
	Set @DBId = (SELECT Id FROM [User] WHERE Id = @Id)
	if(@DBId is NULL)
		begin
			INSERT INTO [dbo].[User]
				([username])
				VALUES
				(@Username)
			SET @DBId = @@IDENTITY
		end
	else
		begin
			UPDATE [dbo].[User]
			SET [Username] = case when @Username is null then Username else @Username end
			WHERE Id = @Id
		end
	return @DBId
END