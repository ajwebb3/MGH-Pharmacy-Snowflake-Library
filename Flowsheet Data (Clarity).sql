SELECT DISTINCT t1.PAT_ID,
		t1.FSD_ID,
		t1.INPATIENT_DATA_ID,
        t4.EPT_CSN as PAT_ENC_CSN_ID,
		t2.RECORDED_TIME,
		t3.FLO_MEAS_NAME,
		t3.FLO_DIS_NAME,
		t2.MEAS_VALUE
FROM EDW_SOURCE_ZONE_CLARITY.CLINICAL.IP_FLWSHT_REC as t1
Inner Join EDW_SOURCE_ZONE_CLARITY.CLINICAL.IP_FLWSHT_MEAS as t2 on t1.FSD_ID = t2.FSD_ID 
Inner Join EDW_SOURCE_ZONE_CLARITY.COMMON.IP_FLO_GP_DATA as t3 on t2.FLO_MEAS_ID = t3.FLO_MEAS_ID 
Left Join EDW_SOURCE_ZONE_CLARITY.CLINICAL.IP_DATA_STORE as t4 on t1.INPATIENT_DATA_ID = t4.INPATIENT_DATA_ID
    where t1.PAT_ID in (' ')   -- Enter one or multiple Patient IDs ("Z" numbers)
    and t2.FLO_MEAS_ID = ' ' 
    /** Enter one or multiple Flowsheet Measure IDs, or just remove this filter to pull all Flowsheet rows for a unique patient. 
        Be aware that this will pull ALL flowsheet rows regardless of encounter, i.e. if they had BP measured in a clinic visit, that will be pulled
		You can filter by date within the query or after the fact, whatever is easier **/