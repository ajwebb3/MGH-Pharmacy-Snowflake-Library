select t1.PatientEncounterID, 
                            t1.AdmitDiagnosisTXT, 
                            t2.DiagnosisID, 
                            t2.DiagnosisNM, 
                            t2.CurrentICD10ListTXT from EDW_SOURCE_ZONE_Epic.Encounter_Clinical.HospitalAdmitDiagnosis as t1
                   left join EDW_SOURCE_ZONE_Epic.Reference.ICDDiagnosis as t2 on t1.DiagnosisID = t2.DiagnosisID 
                   where PatientEncounterID IN ( )