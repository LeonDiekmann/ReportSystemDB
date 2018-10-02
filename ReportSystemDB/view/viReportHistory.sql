CREATE VIEW [dbo].[viReportHistory]
	AS SELECT Id, Status, UserId, GroupId, ReportId FROM [ReportHistory]
	WHERE DeleteTime IS NULL
