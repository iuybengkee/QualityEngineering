ALTER PROCEDURE EDW_QA.spQATestingLog @i_TestCaseId INT
	, @i_ProjectName NVARCHAR(100)
	, @i_TableType NVARCHAR(100)
	, @i_TableSchema  NVARCHAR(100)
	, @i_TableName  NVARCHAR(1000)
	, @i_TestCaseName  NVARCHAR(100)
	, @i_TestCaseScript  NVARCHAR(MAX)
	, @i_ExpectedValue  INT
	, @i_ActualResult INT
	, @i_TestResult  NVARCHAR(10)
	, @i_testername NVARCHAR(100)
	, @i_Remarks  NVARCHAR(500)
	, @i_currenttime NVARCHAR(100)
AS
BEGIN
/*********************************************************************************** 
**	This procedure will Insert Testing information into EDW_QA.QATestingLog
**  Date		Created by		Description
-------------------------------------------------------------------------------------
**  07/18/2023  IU				Initial Creation
************************************************************************************/
DECLARE @pipeline_dt  DATETIME

SET @pipeline_dt = REPLACE(REPLACE(@i_currenttime, RIGHT(@i_currenttime,5),''),'T',' ')

	DELETE EDW_QA.QATestingLog
	WHERE DateTested = @pipeline_dt
    AND TestCaseId = @i_TestCaseId
	AND ProjectName = @i_ProjectName
	AND TableType = @i_TableType
	AND TableSchema = @i_TableSchema
	AND TableName = @i_TableName
	AND TestCaseName = @i_TestCaseName
	AND TestCaseScript = @i_TestCaseScript
	AND TesterName = @i_testername;

	--SELECT @i_TestResultCount, @i_TestCaseScript, @i_TestCaseId
	
	INSERT INTO EDW_QA.QATestingLog
	(  DateTested
    , TestCaseId
	, ProjectName
	, TableType
	, TableSchema
	, TableName
	, TestCaseName
	, TestCaseScript
	, ExpectedValue
	, ActualValue
	, TestResult
	, TesterName
	, Remarks)
	SELECT @pipeline_dt
	, @i_TestCaseId
	, UPPER(@i_ProjectName)
	, @i_TableType
	, @i_TableSchema
	, @i_TableName
	, @i_TestCaseName
	, @i_TestCaseScript
	, @i_ExpectedValue
	, @i_ActualResult
	, UPPER(@i_TestResult)
	, @i_testername
	, @i_Remarks;

END