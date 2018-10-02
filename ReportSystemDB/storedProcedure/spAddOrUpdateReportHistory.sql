CREATE PROCEDURE [dbo].[spAddOrUpdateReportHistory]
	@Id INT = -1,
	@Status INT = NULL,
	@UserId INT = NULL,
	@GroupId INT = NULL,
	@ReportId INT = NULL
AS
BEGIN
	SELECT @Id,@Status,@UserId,@GroupId,@ReportId

	DECLARE @DBId int
	Set @DBId = (SELECT Id FROM [ReportHistory] WHERE Id = @Id)
	if(@DBId is NULL)
		begin
			INSERT INTO [dbo].[ReportHistory]
				([Status],[UserId],[GroupId],[ReportId])
				VALUES
				(@Status,@UserId,@GroupId,@ReportId)
			SET @DBId = @@IDENTITY
		end
	else
		begin
			UPDATE [dbo].[ReportHistory]
			SET [Status] = case when @Status is null then Status else @Status end,
			[UserId] = case when @UserId is null then UserId else @UserId end,
			[GroupId] = case when @GroupId is null then GroupId else @GroupId end,
			[ReportId] = case when @ReportId is null then ReportId else @ReportId end
			WHERE Id = @Id
		end
	return @DBId
END