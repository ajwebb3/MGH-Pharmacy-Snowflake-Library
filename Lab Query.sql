select t1.order_proc_id, 
       t1.result_date, 
       t1.result_time, 
       t1.pat_enc_csn_id, 
       t5.pat_id,
       t1.ord_value, 
       t1.ord_num_value, 
       t1.reference_unit, 
       t2.specimn_taken_time, 
       t2.pat_loc_id,
       t4.department_name,
       t3.component_id, 
       t3.name as component_name, 
       t3.base_name 
from EDW_SOURCE_ZONE_Clarity.clinical.order_results t1
left join EDW_SOURCE_ZONE_Clarity.clinical.order_proc_2 t2 on t1.order_proc_id=t2.order_proc_id 
left join edw_source_zone_clarity.common.clarity_component t3 on t1.component_id=t3.component_id
left join edw_source_zone_clarity.common.clarity_dep t4 on t2.pat_loc_id = t4.department_id
left join edw_source_zone_clarity.clinical.order_proc t5 on t1.order_proc_id = t5.order_proc_id
/**Enter BaseNM of labs of interest here
If multiple needed, change = to in and list separated by comma (e.g. t3.BaseNM in ('ALB', 'CRE')) **/
where (t3.base_name = )
/** If there are specific CSNs of interest, enter here, separated by comma **/
and t1.pat_enc_csn_id in ()