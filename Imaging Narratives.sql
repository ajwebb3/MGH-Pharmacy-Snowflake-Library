/** Components of the imaging report are stored in different tables, with their own line numbers, which means combining them into one query is a huge pain. I suggest querying separately and binding the rows together in post processing. **/

SELECT t1.OrderID, 
       t1.PatientNameMRN, 
	   t1.StudyStatusDSC, 
	   t1.StudyStatusCD,
	   t1.ExamStartDTS,
	   t1.ExamEndDTS,
	   t1.FinalizedProviderDTS,
	   t1.ProcedureNM,
	   t1.ProcedureCD,
	   t3.OrderProcedureID,
	   t3.LineNBR,
	   t3.NarrativeTXT
  FROM EDW_SOURCE_ZONE_EPIC.Orders_Clinical.Imaging t1
  INNER JOIN EDW_SOURCE_ZONE_EPIC.Orders_Clinical.Procedure t2 on (t1.OrderID = t2.OrderProcedureID)
  INNER JOIN EDW_SOURCE_ZONE_EPIC.Orders_Clinical.Narrative t3 on (t2.OrderProcedureID = t3.OrderProcedureID)
  WHERE t1.ProcedureID in () 

/** ProcedureID Dictionary **/
/**
CTA: 142123, 142121
EEG: 541504, 1226, 540486, 1218, 7536, 540487,498972,546568,540486,509122,7536,498976,541504,498974,537003,135880,1218,569303,1226,498970,509120,509148
TCDs: 146756, 146764, 146758, 146760, 146762, 475523, 541504
IAT: 534699, 555098, 541897, 535946, 440351, 541899, 541903, 167652, 535947
**/
