SELECT t1.[PatientID],
	   t2.[FlowsheetDataID],
		  [InpatientDataID],
		  [RecordDTS], 
		  [PatientIdentityID] as MRN,
	   t3.[MeasureTXT],
		  [RecordedDTS],
		  [EntryTimeDTS],
	   t4.[FlowsheetMeasureNM],
		  [DisplayNM]
          FROM [Epic].[Patient].[Identity_MGH] as t1
          Inner Join [Epic].[Clinical].[FlowsheetRecordLink_MGH] as t2 on t1.PatientID = t2.PatientID
          Inner Join [Epic].[Clinical].[FlowsheetMeasure_MGH] as t3 on t2.FlowsheetDataID = t3.FlowsheetDataID 
          Inner Join [Epic].[Clinical].[FlowsheetGroup_MGH] as t4 on t3.FlowsheetMeasureID = t4.FlowsheetMeasureID 
		  where t1.[PatientID] in (' ')   -- Enter one or multiple Patient IDs ("Z" numbers)
		  and t3.FlowsheetMeasureID = ' ' -- Enter one or multiple Flowsheet Measure IDs, or just remove this filter to pull all Flowsheet rows for a unique patient. 
										  -- Be aware that this will pull ALL flowsheet rows regardless of encounter, i.e. if they had BP measured in a clinic visit, that will be pulled
										  -- You can filter by date within the query or after the fact, whatever is easier