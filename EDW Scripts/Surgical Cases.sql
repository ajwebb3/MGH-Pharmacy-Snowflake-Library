SELECT t1.CaseID,
       t1.SurgeryDTS,
       t1.PatientID,
       t1.ServiceDSC,
       t2.CASETYPEDSC,
       t3.PROCEDUREID,
       t3.procedurenm,
       t3.panelprimaryphysiciannm,
       t3.lateralitynm,
       t3.woundclassnm
FROM EDW_SOURCE_ZONE_EPIC.SURGERY.CASE t1
left join EDW_SOURCE_ZONE_EPIC.SURGERY.LOG t2 on t1.CaseID = t2.caseid
left join EDW_SOURCE_ZONE_EPIC.SURGERY.LOGPROCEDURE t3 on t1.caseid = t3.caseid
WHERE t1.PatientID in