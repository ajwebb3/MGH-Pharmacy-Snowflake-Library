SELECT DISTINCT t1.pat_enc_csn_id,
                t1.pat_id,
                t1.order_med_id,
                t8.name as SIMPLE_GENERIC,
                t11.freq_name,
                t9.name as THERA_CLASS,
                t5.name as ROUTE,
                t1.display_name as MED_DISPLAY_NAME,
                t2.taken_time,
                t2.sig,
                t7.name as DOSE_UNIT,
                t2.infusion_rate,
                t6.name as INFUSION_RATE_UNIT,
                t4.name as MAR_ACTION,
                t10.name as SITE,
                t12.department_name
FROM EDW_SOURCE_ZONE_CLARITY.Clinical.Order_Med as t1
inner join EDW_SOURCE_ZONE_CLARITY.Clinical.MAR_ADMIN_INFO t2 on t1.Order_Med_ID=t2.Order_Med_ID
left join EDW_SOURCE_ZONE_CLARITY.Common.Clarity_Medication t3 on t1.Medication_ID=t3.Medication_ID
left join EDW_SOURCE_ZONE_CLARITY.Common.ZC_MAR_RSLT t4 on t2.mar_action_c = t4.result_c
left join EDW_SOURCE_ZONE_CLARITY.COMMON.ZC_ADMIN_ROUTE t5 on t2.route_c = t5.med_route_c
left join EDW_SOURCE_ZONE_CLARITY.COMMON.ZC_MED_UNIT t6 on t2.mar_inf_rate_unit_c = t6.disp_qtyunit_c
left join EDW_SOURCE_ZONE_CLARITY.COMMON.ZC_MED_UNIT t7 on t2.dose_unit_c = t7.disp_qtyunit_c
left join EDW_SOURCE_ZONE_CLARITY.Common.ZC_SIMPLE_GENERIC t8 on t3.simple_generic_c = t8.simple_generic_c
left join EDW_SOURCE_ZONE_CLARITY.Common.ZC_THERA_CLASS t9 on t3.thera_class_c = t9.thera_class_c
left join EDW_SOURCE_ZONE_CLARITY.Common.ZC_SITE t10 on t2.site_c = t10.site_c
left join EDW_SOURCE_ZONE_CLARITY.Common.IP_FREQUENCY t11 on t1.hv_discr_freq_id = t11.freq_id
left join EDW_SOURCE_ZONE_CLARITY.COMMON.CLARITY_DEP t12 on t2.mar_admin_dept_id = t12.department_id
where t1.pat_enc_csn_id in ()
order by pat_enc_csn_id, taken_time