select t1.PatientEncounterID, 
                            t1.AdmitDiagnosisTXT, 
                            t2.DiagnosisID, 
                            t2.DiagnosisNM, 
                            t2.CurrentICD10ListTXT from Epic.Encounter.HospitalAdmitDiagnosis_MGH as t1
                   left join Epic.Reference.ICDDiagnosis as t2 on t1.DiagnosisID = t2.DiagnosisID 
                   where PatientEncounterID IN ( )