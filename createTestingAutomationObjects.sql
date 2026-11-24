/****
Table Type  = Bronze, Silver, Dimension, Fact
Column Type = PK for Primary Key 
              CK for Composite Key
			  FK for Foreign Key 
			  BK for Business Key
			  TK for Technical Key
			  NK for Normal Key
****/
--DROP SCHEMA STAGE 

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'QAStage')
BEGIN
EXEC('CREATE SCHEMA QAStage')
END;

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'EDW_QA')
BEGIN
EXEC('CREATE SCHEMA EDW_QA')
END;

IF NOT EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'EDW_QA.QATestingLog') AND type in (N'U'))
--DROP TABLE EDW_QA.QATestingLog;

BEGIN
CREATE TABLE EDW_QA.QATestingLog(
   DateTested		   DATETIME NOT NULL,
   TestCaseId		   INT NOT NULL,
   ProjectName         NVARCHAR(100) NOT NULL,
   TableType		   NVARCHAR(100) NOT NULL,
   TableSchema		   NVARCHAR(100) NOT NULL,
   TableName           NVARCHAR(1000) NOT NULL,
   TestCaseName		   NVARCHAR(100)  NOT NULL,
   TestCaseScript      NVARCHAR(MAX)  NOT NULL,
   ExpectedValue	   INT NOT NULL,
   ActualValue         INT NOT NULL,
   TestResult          NVARCHAR(10) NOT NULL,
   TesterName          NVARCHAR(100) NULL,
   Remarks			   NVARCHAR(500)
);

END

IF NOT EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'QASTAGE.QASTTMDetail') AND type in (N'U'))
--DROP TABLE QASTAGE.QASTTMDetail;

BEGIN
CREATE TABLE QASTAGE.QASTTMDetail(
   ProjectName         NVARCHAR(100) NOT NULL,
   TableType		   NVARCHAR(100) NOT NULL,
   TableSchema		   NVARCHAR(100) NOT NULL,
   TableName           NVARCHAR(1000) NOT NULL,
   ColumnName		   NVARCHAR(1000) NOT NULL,
   ColumnDataType      NVARCHAR(100) NOT NULL,
   Precision           INT NULL,
   Length              INT NULL,
   MandatoryTechnicalFIeld NVARCHAR(3) NULL,
   ColumnType          NVARCHAR(10) NULL,
   IS_NULLABLE         NVARCHAR(3)  NOT NULL,
   SCD_type            NVARCHAR(10) NULL,
  -- Seq				   INT NOT NULL,
   DistributionBy      NVARCHAR(1000) NULL,
   PartitionBy         NVARCHAR(1000) NULL,
   ParentTableName     NVARCHAR(1000) NULL,
   ParentColumnName	   NVARCHAR(1000) NULL,
   ColumnDefaultValue  NVARCHAR(100) NULL,
   BronzeLoadType      NVARCHAR(100) NOT NULL,
   BronzeFileFormat    NVARCHAR(100) NULL,
   BronzePathLocation  NVARCHAR(1000) NULL,
   BronzeTableName     NVARCHAR(1000) NULL,
   SourceLocation     NVARCHAR(100) NOT NULL,
   SourceTableName    NVARCHAR(1000) NULL,
   SourceColumnName   NVARCHAR(1000) NULL,
   SourceTransformLogic NVARCHAR(MAX) NULL,
   SourceSQLJoin         NVARCHAR(100) NULL,
   Comment 				 NVARCHAR(1000) NULL, 
   CreationDateTime      DateTime2, 
   Creator	             NVARCHAR(100) NULL, 
   ModificationDateTime  DateTime2,
   Modifier              NVARCHAR(1000) NULL
  -- RowHash               VARBINARY(64)  NULL
  -- STTMVersion           INT  NULL
);
END

IF NOT EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'EDW_QA.QASTTMDetail') AND type in (N'U'))
--DROP TABLE EDW_QA.QASTTMDetail;

BEGIN
CREATE TABLE EDW_QA.QASTTMDetail(
   ProjectName         NVARCHAR(100) NOT NULL,
   TableType		   NVARCHAR(100) NOT NULL,
   TableSchema		   NVARCHAR(100) NOT NULL,
   TableName           NVARCHAR(1000) NOT NULL,
   ColumnName		   NVARCHAR(1000) NOT NULL,
   ColumnDataType      NVARCHAR(100) NOT NULL,
   Precision           INT NULL,
   Length              INT NULL,
   MandatoryTechnicalFIeld NVARCHAR(3) NULL,
   ColumnType          NVARCHAR(10) NULL,
   IS_NULLABLE         NVARCHAR(3)  NOT NULL,
   SCD_type            NVARCHAR(10) NULL,
   Seq				   INT NOT NULL,
   DistributionBy      NVARCHAR(1000) NULL,
   PartitionBy         NVARCHAR(1000) NULL,
   ParentTableName     NVARCHAR(1000) NULL,
   ParentColumnName	   NVARCHAR(1000) NULL,
   ColumnDefaultValue  NVARCHAR(100) NULL,
   BronzeLoadType      NVARCHAR(100) NOT NULL,
   BronzeFileFormat    NVARCHAR(100) NULL,
   BronzePathLocation  NVARCHAR(1000) NULL,
   BronzeTableName     NVARCHAR(1000) NULL,
   SourceLocation     NVARCHAR(100) NOT NULL,
   SourceTableName    NVARCHAR(1000) NULL,
   SourceColumnName   NVARCHAR(1000) NULL,
   SourceTransformLogic NVARCHAR(MAX) NULL,
   SourceSQLJoin         NVARCHAR(100) NULL,
   Comment 				 NVARCHAR(1000) NULL, 
   CreationDateTime      DateTime2, 
   Creator	             NVARCHAR(100) NULL, 
   ModificationDateTime  DateTime2,
   Modifier              NVARCHAR(1000) NULL,
   RowHash               VARBINARY(64)  NULL,
   STTMVersion           INT  NULL
);

END


IF NOT EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'EDW_QA.QASTTMMINUSSQL') AND type in (N'U'))
--DROP TABLE EDW_QA.QASTTMMINUSSQL;
CREATE TABLE EDW_QA.QASTTMMINUSSQL(
   ProjectName         NVARCHAR(100) NOT NULL,
   TableType		   NVARCHAR(100) NOT NULL,
   TableSchema		   NVARCHAR(100) NOT NULL,
   TableName           NVARCHAR(1000) NOT NULL,
   MINUSSQLSTATEMENT1   NVARCHAR(MAX) NOT NULL,
   MINUSSQLSTATEMENT2   NVARCHAR(MAX) NOT NULL,
   MINUSSQLSTATEMENT3   NVARCHAR(MAX) NOT NULL,
   MINUSSQLSTATEMENT4   NVARCHAR(MAX) NOT NULL,
   MINUSSQLSTATEMENT5   NVARCHAR(MAX) NOT NULL,
);


IF NOT EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'EDW_QA.QAPLACEHOLDER') AND type in (N'U'))
--DROP TABLE EDW_QA.QAPLACEHOLDER;
CREATE TABLE EDW_QA.QAPLACEHOLDER(
   ProjectName         NVARCHAR(100) NOT NULL,
   TableType		   NVARCHAR(100) NOT NULL,
   TableSchema		   NVARCHAR(100) NOT NULL,
   TableName           NVARCHAR(1000) NOT NULL,
   PlaceholderName     NVARCHAR(MAX) NOT NULL,
   PlaceholderValue    NVARCHAR(MAX) NOT NULL
);
--select * from INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'QASTTMDetail'

IF NOT EXISTS (SELECT * FROM sys.objects
WHERE object_id = OBJECT_ID(N'EDW_QA.QASQLTemplate') AND type in (N'U'))
--DROP TABLE EDW_QA.QASQLTemplate;

BEGIN
CREATE TABLE EDW_QA.QASQLTemplate(
   ProjectName         NVARCHAR(100) NOT NULL,
   TableType		   NVARCHAR(100) NOT NULL,
   TestCaseId		   INT NOT NULL,
   TestCaseName		   NVARCHAR(100)  NOT NULL,
   TestCaseDescription NVARCHAR(500)  NOT NULL,
   TestCaseDynamicSQL  NVARCHAR(MAX) NOT NULL,
   IS_Enabled          BIT,
   ExpectedValue       INT NOT NULL,
   DateUpdated         Date,
   Remarks             NVARCHAR(500) 
);

TRUNCATE TABLE EDW_QA.QASQLTemplate
INSERT INTO EDW_QA.QASQLTemplate
            SELECT 'BSP','Dim',-1, 'Validate Table Row Count Silver'  ,'To validate if table is not empty','SELECT COUNT(1) FROM (SELECT TOP 1 * FROM {TABLENAME}) a',1,1,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim',-2, 'Validate Row Count against Bronze','To validate data loaded in Silver match from Bronze','SELECT((SELECT COUNT({PRIMARYKEY}) FROM {BRONZE} - (SELECT COUNT(DISTINCT {PRIMARYKEY}) FROM {TABLENAME}))',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim',-3, 'Validate Deduplicate Row'         ,'To validate for any duplicate data','SELECT COUNT(1) FROM ( SELECT COUNT(1) cnt, {PRIMARYKEY} FROM {TABLENAME} GROUP BY {PRIMARYKEY} HAVING COUNT(1) > 1 )',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 1, 'Validate Table Row Count Gold'    ,'To validate if table is not empty','SELECT @Cnt = COUNT(1) FROM (SELECT TOP 1 * FROM {TABLESCHEMA}.{TABLENAME}) a',1,1,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 2, 'Validate Schema Table Name'              ,'Check Table Name Exists','SELECT @Cnt = COUNT(1) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = ''{TABLESCHEMA}'' AND TABLE_NAME = ''{TABLENAME}''',1,1,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 2, 'Validate Schema Number of Columns'       ,'Check Number of Columns are Correct','SELECT @Cnt = ((SELECT COUNT(COLUMN_NAME) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = ''{TABLESCHEMA}'' AND TABLE_NAME = ''{TABLENAME}'') - (SELECT COUNT(COLUMNNAME) FROM EDW_QA.QASTTMDetail WHERE TABLESCHEMA = ''{TABLESCHEMA}'' AND TABLENAME = ''{TABLENAME}'' AND STTMVERSION = (SELECT MAX(STTMVERSION) FROM EDW_QA.QASTTMDetail WHERE TABLESCHEMA = ''{TABLESCHEMA}'' AND TABLENAME = ''{TABLENAME}'' )))',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 2, 'Validate Schema Number of Column Names'  ,'Check Column Names and Ensure that no columns are missed in the Target table','SELECT @Cnt = COUNT(1) FROM (SELECT columnname FROM EDW_QA.QASTTMDetail WHERE TABLESCHEMA = ''{TABLESCHEMA}'' AND TABLENAME = ''{TABLENAME}'' AND STTMVERSION = (SELECT MAX(STTMVERSION) FROM EDW_QA.QASTTMDetail WHERE TABLESCHEMA = ''{TABLESCHEMA}'' AND TABLENAME = ''{TABLENAME}'' ) EXCEPT SELECT Column_Name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = ''{TABLESCHEMA}'' AND TABLE_NAME = ''{TABLENAME}'' ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 2, 'Validate Schema Column Data Type, Precision & Scale'  ,'Check Data Type, Precision and Scale are correct','SELECT @Cnt = COUNT(1) FROM (SELECT columnname, columndatatype, precision, length FROM EDW_QA.QASTTMDetail WHERE TABLESCHEMA = ''{TABLESCHEMA}'' AND TABLENAME = ''{TABLENAME}'' AND STTMVERSION = (SELECT MAX(STTMVERSION) FROM EDW_QA.QASTTMDetail WHERE TABLESCHEMA = ''{TABLESCHEMA}'' AND TABLENAME = ''{TABLENAME}'' ) EXCEPT SELECT column_name, data_type , NUMERIC_PRECISION, NUMERIC_SCALE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = ''{TABLESCHEMA}'' AND TABLE_NAME = ''{TABLENAME}'' ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 3, 'Validate Column NULL Constraint'  ,'When the NOT NULL constraint has been set for a field, the field cannot accept the NULL values'	,'SELECT @Cnt = COUNT(1) FROM {TABLESCHEMA}.{TABLENAME} WHERE {NULLLOOPCONDITION}'	,1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 4, 'Validate Column Default Value'	  ,'When the Default constraint has been set for a field, the field cannot accept any value other than the default'	,'SELECT @Cnt =  COUNT(1) FROM {TABLESCHEMA}.{TABLENAME} WHERE {COLUMNNAME} != {DEFAULTVALUE}'	,1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 5, 'Validate Count between Silver Raw & EDW','To validate data loaded in EDW match from Bronze','SELECT @Cnt =  ((SELECT COUNT(1) FROM (SELECT ActualValue FROM EDW_QA.QATestingLog WHERE DateTested = CAST(GETDATE() AS DATE) AND TableSchema = ''{TABLESCHEMA}'' AND TableName = ''{TABLENAME}'' AND TestCaseId = -1) a )- (SELECT COUNT(1) FROM {TABLESCHEMA}.{TABLENAME}))',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 6, 'Validate EDW Deduplicate Active Row'    ,'To validate for any duplicate Active data','SELECT @Cnt = COUNT(1) FROM ( SELECT COUNT(1) cnt, {PRIMARYKEY} FROM {TABLESCHEMA}.{TABLENAME} WHERE {ACTIVEFLAG} GROUP BY {PRIMARYKEY} HAVING COUNT(1) > 1 ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 7, 'Validate EDW Deduplicate Row'           ,'To validate for any duplicate data','SELECT @Cnt = COUNT(1) FROM ( SELECT COUNT(1) cnt, {PRIMARYKEY} FROM {TABLESCHEMA}.{TABLENAME} GROUP BY {PRIMARYKEY} HAVING COUNT(1) > 1 ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 8, 'Validate EDW Deduplicate BusinessKeyHash'       ,'To validate for any duplicate SID data','SELECT @Cnt = COUNT(1) FROM ( SELECT COUNT(1) cnt, {UNIQUEHASH} FROM {TABLESCHEMA}.{TABLENAME} GROUP BY {UNIQUEHASH} HAVING COUNT(1) > 1 ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 9, 'Validate for any Effective Start/End date Overlap'           ,'To Ensure EffectiveStartDateTime & EffectiveEndDateTime fields cannot overlap . The EffectiveStartDateTime date cannot be the same as the EffectiveEndDateTime of a previous record.','SELECT @Cnt = COUNT(1) FROM (SELECT {PRIMARYKEY}, {ROWEFFECTIVEFROM}, {ROWEFFECTIVETO}, {ACTIVEFLAG}, Lag({ROWEFFECTIVETO}, 1) OVER(partition by {PRIMARYKEY} ORDER BY {ROWEFFECTIVEFROM} ASC) As Previous_To FROM {TABLESCHEMA}.{TABLENAME}) a WHERE {ROWEFFECTIVEFROM} = Previous_To AND Previous_To IS NOT NULL',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 10,'Validate for any Effective End date greater than Start date' ,'To Ensure EffectiveStartDateTime is never greater than EffectiveEndDateTime for any given record.','SELECT @Cnt = COUNT(1) FROM {TABLESCHEMA}.{TABLENAME} WHERE {ROWEFFECTIVEFROM} > {ROWEFFECTIVETO}',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 11,'Validate Not NULL Foreign Key Data Integrity Checks'  ,'Check for count of records with null Foreign keys values in the child table.','SELECT @Cnt = COUNT(1) FROM {TABLESCHEMA}.{TABLENAME} WHERE {FOREIGNKEY} is null',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 12,'Validate Valid Foreign Key Data Integrity Checks' ,'Count of invalid Foreign Key values in the child table that do not have a corresponding Primary key.','SELECT @Cnt = COUNT(1) FROM {TABLESCHEMA}.{TABLENAME} WHERE {TARGETCOLUMN} NOT IN (SELECT {PARENTCOLUMN} FROM {PARENTTABLE})',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', -13,'Validate Minus Query Silver-RAW to Gold'                ,'To Ensure that the EDW records match the Silver Raw','SELECT COUNT(1) FROM ( SELECT {SOURCECOLUMNS} FROM {SOURCESCHEMA}.{SOURCETABLE} EXCEPT SELECT {TARGETCOLUMNS} FROM {TABLESCHEMA}.{TABLENAME} ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 14,'Validate Synapse Minus Query'                      ,'To Ensure that the EDW records match the Source','SELECT @Cnt = COUNT(1) FROM ( SELECT {SOURCECOLUMNS} FROM {SOURCESCHEMA}.{SOURCETABLE} EXCEPT SELECT {TARGETCOLUMNS} FROM {TABLESCHEMA}.{TABLENAME} ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 15,'Validate Mantory technical fields Exists in {TABLENAME}','To Ensure all the mandatory fields exists in the EDW table','SELECT @Cnt = COUNT(1) FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema =''{TABLESCHEMA}'' AND table_name = ''{TABLENAME}'' AND LOWER(COLUMN_NAME) IN ({TECHCOLUMNS})',1,10,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension (Get the expected count from STTM)'
  UNION ALL SELECT 'BSP','Dim', -16, 'Validate Type1Hash'				  , 'Validate the assigned Type1Hash from the STTM is the same with the type1 used in the developer''s code','SELECT COUNT(1) FROM {SOURCESCHEMA}.{SOURCETABLE} WHERE {CalTYPE1Hash} NOT IN (SELECT TYPE1Hash FROM {TABLESCHEMA}.{TABLENAME})',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', -17, 'Validate Type2Hash'				  , 'Validate the assigned Type2Hash from the STTM is the same with the type2 used in the developer''s code','SELECT COUNT(1) FROM {SOURCESCHEMA}.{SOURCETABLE} WHERE {CalTYPE2Hash} NOT IN (SELECT TYPE2Hash FROM {TABLESCHEMA}.{TABLENAME})',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Dimension'
  UNION ALL SELECT 'BSP','Dim', 18, 'Validate DistributionBy Column'      , 'Validate if DistributionBy Column is added in the Table as stated from STTM','Synapse SQL to be added',0,1,CAST(GETDATE() AS DATE),'This will be added in only in Synapse'
  UNION ALL SELECT 'BSP','Dim', 19, 'Validate PatitionBy Column'          , 'Validate if PatitionBy Column is added in the Table as stated from STTM','Synapse SQL to be added',0,1,CAST(GETDATE() AS DATE),'This will be added in only in Synapse'
  UNION ALL SELECT 'BSP','Fact',-1, 'Validate Table Row Count Silver'  ,'To validate if table is not empty','SELECT COUNT(1) FROM (SELECT TOP 1 * FROM {TABLENAME}) a',1,1,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact',-2, 'Validate Row Count against Bronze','To validate data loaded in Silver match from Bronze','SELECT((SELECT COUNT({PRIMARYKEY}) FROM {BRONZE} - (SELECT COUNT(DISTINCT {PRIMARYKEY}) FROM {TABLENAME}))',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact',-3, 'Validate Deduplicate Row'         ,'To validate for any duplicate data','SELECT COUNT(1) FROM ( SELECT COUNT(1) cnt, {PRIMARYKEY} FROM {TABLENAME} GROUP BY {PRIMARYKEY} HAVING COUNT(1) > 1 )',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 1, 'Validate Table Row Count Gold'   ,'To validate if table is not empty','SELECT @Cnt = COUNT(1) FROM (SELECT TOP 1 * FROM {TABLESCHEMA}.{TABLENAME}) a',1,1,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 2, 'Validate Table Schema'            ,'Check Table Name, Number of Columns, Column Names, Data Type and Ensure that no columns are missed in the Target table','SELECT @Cnt =  COUNT(1) FROM (SELECT column_name, data_type FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = ''{TABLESCHEMA}'' AND TABLE_NAME = ''{TABLENAME}'' EXCEPT SELECT ColumnName, ColumnDataType FROM EDW_QA.QASTTMDetail WHERE TABLESCHEMA = ''{TABLESCHEMA}'' AND TABLENAME = ''{TABLENAME}'') a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 3, 'Validate Column NULL Constraint'  ,'When the NOT NULL constraint has been set for a field, the field cannot accept the NULL values'	,'SELECT @Cnt = COUNT(1) FROM {TABLESCHEMA}.{TABLENAME} WHERE {NULLLOOPCONDITION}'	,1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 4, 'Validate Column Default Value'	  ,'When the Default constraint has been set for a field, the field cannot accept any value other than the default'	,'SELECT @Cnt = COUNT(1) FROM {TABLESCHEMA}.{TABLENAME} WHERE {COLUMNNAME} != {DEFAULTVALUE}'	,1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 5, 'Validate Count between Silver Raw & EDW','To validate data loaded in EDW match from Bronze','SELECT @Cnt =  ((SELECT COUNT(1) FROM (SELECT ActualValue FROM EDW_QA.QATestingLog WHERE DateTested = CAST(GETDATE() AS DATE) AND TableSchema = ''{TABLESCHEMA}'' AND TableName = ''{TABLENAME}'' AND TestCaseId = -1) a ) - (SELECT COUNT(1) FROM {TABLESCHEMA}.{TABLENAME}))',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 6, 'Validate EDW Deduplicate Active Row'    ,'To validate for any duplicate Active data','SELECT  @Cnt = COUNT(1) FROM ( SELECT COUNT(1) cnt, {PRIMARYKEY} FROM {TABLESCHEMA}.{TABLENAME} WHERE {ACTIVEFLAG} GROUP BY {PRIMARYKEY} HAVING COUNT(1) > 1 ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'  
  UNION ALL SELECT 'BSP','Fact', 7, 'Validate EDW Deduplicate Row'           ,'To validate for any duplicate data','SELECT @Cnt = COUNT(1) FROM ( SELECT COUNT(1) cnt, {PRIMARYKEY} FROM {TABLESCHEMA}.{TABLENAME}  GROUP BY {PRIMARYKEY} HAVING COUNT(1) > 1 ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 8, 'Validate EDW Deduplicate FactKeyHash'       ,'To validate for any duplicate SID data','SELECT @Cnt = COUNT(1) FROM ( SELECT COUNT(1) cnt, {UNIQUEHASH} FROM {TABLESCHEMA}.{TABLENAME} GROUP BY {UNIQUEHASH} HAVING COUNT(1) > 1 ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 11,'Validate Not NULL Foreign Key Data Integrity Checks'  ,'Check for count of records with null Foreign keys values in the child table.','SELECT @Cnt = COUNT(1) from {TABLESCHEMA}.{TABLENAME} where {FOREIGNKEY} is null',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 12,'Validate Valid Foreign Key Data Integrity Checks' ,'Count of invalid Foreign Key values in the child table that do not have a corresponding Primary key.','SELECT @Cnt = COUNT(1) FROM {TABLESCHEMA}.{TABLENAME} WHERE {TARGETCOLUMN} NOT IN (SELECT {PARENTCOLUMN} FROM {PARENTTABLE})',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', -13,'Validate Minus Query Silver-RAW to Gold'                ,'To Ensure that the EDW records match the Silver Raw','SELECT COUNT(1) FROM ( SELECT {SOURCECOLUMNS} FROM {SOURCESCHEMA}.{SOURCETABLE} EXCEPT SELECT {TARGETCOLUMNS} FROM {TABLESCHEMA}.{TABLENAME} ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 14,'Validate Synapse Minus Query'                   ,'To Ensure that the EDW records match the Source','SELECT @Cnt = COUNT(1) FROM ( SELECT {SOURCECOLUMNS} FROM {SOURCESCHEMA}.{SOURCETABLE} EXCEPT SELECT {TARGETCOLUMNS} FROM {TABLESCHEMA}.{TABLENAME} ) a',1,0,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact'
  UNION ALL SELECT 'BSP','Fact', 15,'Validate Mantory technical fields Exists in {TABLENAME}','To Ensure all the mandatory fields exists in the EDW table','SELECT @Cnt = COUNT(1) FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema =''{TABLESCHEMA}'' AND table_name = ''{TABLENAME}'' AND LOWER(COLUMN_NAME) IN ({TECHCOLUMNS})',1,10,CAST(GETDATE() AS DATE),'TestCase SQL Template for Fact (Get the expected count from STTM)'
  UNION ALL SELECT 'BSP','Fact', 18, 'Validate DistributionBy Column'      , 'Validate if DistributionBy Column is added in the Table as stated from STTM','Synapse SQL to be added',0,1,CAST(GETDATE() AS DATE),'This will be added in only in Synapse'
  UNION ALL SELECT 'BSP','Fact', 19, 'Validate PatitionBy Column'          , 'Validate if PatitionBy Column is added in the Table as stated from STTM','Synapse SQL to be added',0,1,CAST(GETDATE() AS DATE),'This will be added in only in Synapse'

END

