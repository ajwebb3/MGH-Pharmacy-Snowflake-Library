/** Updated for Clarity syntax, 12/15/25 **/

SELECT DISTINCT t1.pat_id,
                t1.pat_enc_csn_id,
				t2.birth_date,
				t3.death_tm,
				t1.HOSP_ADMSN_TIME,
				t1.HOSP_DISCHRG_TIME, 
				DATEDIFF(year, t2.birth_date, t1.HOSP_ADMSN_TIME) as AgeNBR, 
				t1.height,
				t1.weight,
				t2.sex_c, 
				t5.name as PATIENT_RACE,
				t4.LINE as RACE_LINE_NM
FROM EDW_SOURCE_ZONE_CLARITY.CLINICAL.PAT_ENC t1
                LEFT JOIN EDW_SOURCE_ZONE_CLARITY.Clinical.Patient t2 on (t1.pat_id = t2.pat_id)
				LEFT JOIN EDW_SOURCE_ZONE_CLARITY.Clinical.Patient_2 t3 on t1.pat_id = t3.pat_id
				LEFT JOIN EDW_SOURCE_ZONE_CLARITY.CLINICAL.PATIENT_RACE t4 on t1.pat_id = t4.pat_id
				LEFT JOIN EDW_SOURCE_ZONE_CLARITY.COMMON.ZC_PATIENT_RACE t5 on t4.patient_race_c = t5.patient_race_c
WHERE t3.pat_enc_csn_id in (' ') -- Encounter CSN
and t4.LINE = 1

/** t2.EncounterTypeCD Dictionary **/
/**
Hospital (Inpatient Admission): 3
**/