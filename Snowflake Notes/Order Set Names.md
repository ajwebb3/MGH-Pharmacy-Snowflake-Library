To get order set information, the "ord_nested_osqs" table should be linked to "cl_osq" to get the name of the orderset. This table should also contain order questions

For example,
> SELECT ... 
> t14.orderset_id,
> t14.orderset_name,
> ...
> left join EDW_SOURCE_ZONE_CLARITY.CLINICAL.ORD_NESTED_OSQS t13 on t1.order_med_id = t13.order_id
> left join EDW_SOURCE_ZONE_CLARITY.common.cl_osq t14 on t13.nested_panel_id = t14.orderset_id