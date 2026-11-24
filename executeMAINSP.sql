EXEC [EDW_QA].[MainSP]
    @i_proj_name = 'BSP',
	@i_schema_name = 'EDW',
	@i_table_name = 'DimIncidentEvents',
	@i_test_case_id = '1',
	@i_remarks = 'Testing DimIncidentEvents',
	@i_testername = 'Irene'

	--SELECT * FROM [QAStage].[QASTTMDetail];