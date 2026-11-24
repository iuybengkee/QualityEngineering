SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE spTest
AS
BEGIN
    SET NOCOUNT ON

 	IF OBJECT_ID('tempdb..#tab_dedup') IS NOT NULL
      DROP TABLE #tab_dedup;
    SELECT CAST(NULL AS VARBINARY(64)) AS id, ProjectName, TableSchema, TableName, ColumnName , CAST(NULL AS VARBINARY(64)) AS RowHash,  CAST(NULL AS DATE) AS DateLoaded
	INTO #tab_dedup FROM QAStage.QASTTMDetail2 WHERE 1 = 2;

	INSERT INTO #tab_dedup
	(id, ProjectName, TableSchema, TableName, ColumnName, RowHash)
	SELECT HASHBYTES('SHA2_256', CONCAT_WS('|', TableSchema, TableName)) AS id
	,ProjectName
	,TableSchema
	,TableName
	,ColumnName
	,HASHBYTES('SHA2_256', CONCAT_WS('|', ProjectName, TableSchema, TableName, ColumnName)) AS RowHash,
	ROW_NUMBER() OVER (PARTITION BY TableSchema, TableName ORDER BY DateLoaded) dedup_rank
	FROM 
	(SELECT *, CAST(GETDATE() AS DATE) as DateLoaded
    FROM QAStage.QASTTMDetail2) a;

	/*SELECT [ReportSID], [ReportID], [EventReporter], [ReportDate], [ReporModifiedBy], [ReportModifiedAt], [ReportByMobile], [ReporterRoleInIncident], [__BusinessKeyHash], [__Type1Hash], [__Type2Hash], HASHBYTES('SHA2_256', CONCAT_WS('|', [ReportID], [EventReporter], [ReportDate], [ReporModifiedBy], [ReportModifiedAt], [ReportByMobile], [ReporterRoleInIncident])) AS RowHash
	FROM [Edw].[DimReport]
	WHERE ReportSID = 1;
	*/

END
GO
