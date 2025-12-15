/** Updated for Clarity syntax, 12/15/25 **/

SELECT DISTINCT t1.pat_id,
                t2.pat_enc_csn_id,
				t1.borth_date,
				t1.DeathDTS,
				t2.HospitalAdmitDTS,
				t2.HospitalDischargeDTS, 
                DATEDIFF(minute,t2.HospitalAdmitDTS,t2.HospitalDischargeDTS)/1440.0 as HospitalLOS, 
				DATEDIFF(year,t1.BirthDTS,t2.HospitalAdmitDTS) as AgeNBR, 
				t2.WeightOunceNBR, 
				t1.SexCD, 
				t1.SexDSC,
				t1.EthnicGroupCD,
				t1.EthnicGroupDSC,
				t3.PatientRaceCD,
				t3.PatientRaceDSC,
				t3.LineNBR as RaceLineNBR,
				t1.MaritalStatusCD, 
				t1.MaritalStatusDSC, 
				t1.LanguageCD, 
				t1.LanguageDSC, 
				t1.InterpreterNeededFLG, 
				t4.EducationLevelCD, 
				t4.EducationLevelDSC, 
				t1.ReligionCD, 
				t1.ReligionDSC,
                t1.AddressLine01TXT, 
				t1.CityNM, 
				t1.StateDSC, 
				t1.CountyDSC, 
				t1.CountryDSC, 
				t1.ZipCD
FROM EDW_SOURCE_ZONE_CLARITY.Clinical.Patient t1
				LEFT JOIN 
                RIGHT JOIN EDW_Source_Zone_Epic.Encounter_Clinical.PatientEncounter t2 on (t1.PatientID=t2.PatientID)
                LEFT JOIN EDW_Source_Zone_Epic.Patient_Clinical.Race t3 on (t1.PatientID=t3.PatientID)
                LEFT JOIN EDW_Source_Zone_Epic.Patient_Clinical.Patient4 t4 on t4.PatientID=t2.PatientID
WHERE t2.PatientEncounterID in (' ') -- Encounter CSN

/** t2.EncounterTypeCD Dictionary **/
/**
Hospital (Inpatient Admission): 3
**/