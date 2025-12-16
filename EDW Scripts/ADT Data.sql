SELECT DISTINCT PatientID,
                PatientEncounterID,
                DepartmentDSC,
                ADTEventTypeDSC,
                ADTEventSubtypeDSC,
                EffectiveDTS,
                PatientServiceDSC
	   FROM EDW_SOURCE_ZONE_EPIC.Encounter_Clinical.ADT
       where (ADTEventTypeDSC = 'Admission' or ADTEventTypeDSC = 'Transfer In' or ADTEventTypeDSC = 'Discharge' or ADTEventTypeDSC = 'Transfer Out') 
       and ADTEventSubtypeCD != '2' /** Is not canceled **/
       and PatientEncounterID in () /** and DepartmentID in () **/
       ORDER BY PatientID, PatientEncounterID, EffectiveDTS

/** DepartmentID Dictionary **/
/**
CARDIAC CATH LAB: 10020010606
BIGELOW 6 PICU: 10020010614
BLAKE 10 NICU: 10020010616
BLAKE 12 ICU: 10020010619
BLAKE 7 MICU: 10020010622
BLAKE 8 CARD SICU: 10020010623
ELLISON 4 SICU: 10020010631
ELLISON 9 MED\CCU: 10020010635
LUNDER 6 NEURO ICU: 10020010637
LUNDER 7 NEURO: 10020010638
LUNDER 8 NEURO: 10020010639
ELLISON 3 PACU: 10020010735
ELLISON 14 BRN ICU: 10020011140
BIGELOW 13 RACU: 10020011442
ELLISON 3 ICU: 10020011540
WHITE 3 ICU: 10020011542
**/