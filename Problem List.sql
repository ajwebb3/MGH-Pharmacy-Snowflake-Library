SELECT DISTINCT t1.problemlist_id,
                t1.pat_id,
				t1.dx_id, 
				t2.CURRENT_ICD10_LIST, 
				t2.dx_name,
				t1.DIAG_START_DATE,
				t1.RESOLVED_DATE
FROM EDW_SOURCE_ZONE_CLARITY.Clinical.Problem_List t1 
INNER JOIN EDW_SOURCE_ZONE_CLARITY.COMMON.CLARITY_EDG t2 on (t1.dx_id=t2.dx_id) 
WHERE t1.pat_id in ()