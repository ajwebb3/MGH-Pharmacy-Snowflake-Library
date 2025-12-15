SELECT t1.PatientID,
       t2.FlowsheetDataID,
          InpatientDataID,
          RecordDTS,
          PatientIdentityID,
          MeasureTXT,
          RecordedDTS,
          EntryTimeDTS,
       t4.FlowsheetMeasureNM,
          DisplayNM,
FROM EDW_SOURCE_ZONE_EPIC.Patient_Clinical.Identity as t1
Inner Join EDW_SOURCE_ZONE_EPIC.Clinical.FlowsheetRecordLink as t2 on t1.PatientID = t2.PatientID
Inner Join EDW_SOURCE_ZONE_EPIC.Clinical.FlowsheetMeasure as t3 on t2.FlowsheetDataID = t3.FlowsheetDataID 
Inner Join EDW_SOURCE_ZONE_EPIC.Reference.FlowsheetGroup as t4 on t3.FlowsheetMeasureID = t4.FlowsheetMeasureID 
    where t1.PatientID in (' ')   -- Enter one or multiple Patient IDs ("Z" numbers)
    and t3.FlowsheetMeasureID = ' ' 
    /** Enter one or multiple Flowsheet Measure IDs, or just remove this filter to pull all Flowsheet rows for a unique patient. 
        Be aware that this will pull ALL flowsheet rows regardless of encounter, i.e. if they had BP measured in a clinic visit, that will be pulled
		You can filter by date within the query or after the fact, whatever is easier **/