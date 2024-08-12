SELECT distinct t1.PatientEncounterID, t5.BirthDTS, t2.LineDrainAirwayID, t2.PatientID, t2.PatientEncounterID, t2.FlowsheetMeasureID, t2.RemovalInstantDTS,
                         t2.PlacementDTS, t2.FlowsheetDataID, t2.LineDrainDSC, t2.PropertiesDisplayDSC, t2.SiteCD, t2.RemovalDTS, t4.ICD10CD
                 from Epic.Encounter.ADT_MGH as t1
				 inner join [Epic].[Clinical].[LineDrainAirwayNoAddSingle_MGH] as t2 on t1.PatientID = t2.PatientID
				 inner join Epic.Encounter.PatientEncounterDiagnosis_MGH as t3 on (t1.PatientEncounterID = t3.PatientEncounterID)
				 inner join Epic.Reference.DiagnosisCurrentICD10 as t4 on (t4.DiagnosisID = t3.DiagnosisID)
				 inner join Epic.Patient.Patient_MGH as t5 on t1.PatientID = t5.PatientID
				 left join Epic.Surgery.Log_MGH as t6 on t1.PatientID = t6.PatientID
				 left join Epic.Surgery.LogProcedure_MGH as t7 on t6.LogID = t7.LogID
                 where t1.DepartmentDSC like '%Lunder 6%' and t2.LineDrainDSC like '%neuro external ventricular%' and 
				 t7.ProcedureID in ('10700000897', '10700000896', '10700000895', '10700000898') and
				 (t4.ICD10CD like '%I60%' or t4.ICD10CD like '%I69.0%' or t4.ICD10CD like '%I67.1%' or t4.ICD10CD like '%I72.0%' or
				 t4.ICD10CD like '%I77.1%' or t4.ICD10CD like '%I61%' or t4.ICD10CD like '%I69.10%' or t4.ICD10CD like '%I69.159%' or
				 t4.ICD10CD like '%I62.9%')
				 
				 
				 /*('%I60%', '%I69.0%', '%I67.1%', '%I72.0%', '%I77.1%', '%I61%', '%I69.10%', '%I69.159%', '%I62.9%') */