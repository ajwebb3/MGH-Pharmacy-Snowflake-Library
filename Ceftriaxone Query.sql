SELECT t1.order_med_id, 
       t1.pat_id,
       t1.pat_enc_csn_id,
       t1.medication_id,
       t1.display_name,
       t2.taken_time,
       t5.name as MAR_ACTION,
       t2.route_c,
       t6.name as ROUTE,
       t2.sig,
       t4.DEATH_TM
FROM EDW_SOURCE_ZONE_CLARITY.Clinical.Order_Med as t1
left join EDW_SOURCE_ZONE_CLARITY.Clinical.MAR_ADMIN_INFO t2 on t1.Order_Med_ID = t2.Order_Med_ID
inner join EDW_SOURCE_ZONE_CLARITY.Common.Clarity_Medication t3 on t1.Medication_ID = t3.Medication_ID
left join EDW_SOURCE_ZONE_CLARITY.Clinical.Patient_2 t4 on t1.pat_id = t4.pat_id
left join EDW_SOURCE_ZONE_CLARITY.Common.ZC_MAR_RSLT t5 on t2.mar_action_c = t5.result_c
left join EDW_SOURCE_ZONE_CLARITY.COMMON.ZC_ADMIN_ROUTE t6 on t2.route_c = t6.med_route_c
where  t3.Name like '%ceftriaxone%' and t2.mar_action_c in (1, 6, 7, 9, 12, 13, 16, 102, 105, 113, 114, 116, 117, 128)