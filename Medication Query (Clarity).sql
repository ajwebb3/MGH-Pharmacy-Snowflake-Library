SELECT DISTINCT t1.pat_enc_csn_id,
                t3.SimpleGenericDSC, 
                t3.TherapeuticClassCD,
                t3.TherapeuticClassDSC, 
                t3.PharmaceuticalClassCD, 
                t3.PharmaceuticalClassDSC, 
                t3.PharmaceuticalSubclassCD, 
                t3.PharmaceuticalSubclassDSC, 
                t1.MedicationDSC,
                t2.InfusionRateNBR,
                t2.InfusionRateUnitDSC,
                t2.SigTXT,
                t2.DoseUnitDSC,
                t2.MARActionDSC, 
                t2.RouteCD, 
                t2.RouteDSC, 
                t2.SiteCD,
                t2.SiteDSC, 
                t1.DiscreteFrequencyDSC,
                t2.MedicationTakenDTS
FROM EDW_SOURCE_ZONE_CLARITY.Clinical.Order_Med as t1
left join EDW_SOURCE_ZONE_CLARITY.Clinical.MAR_ADMIN_INFO t2 on t1.Order_Med_ID=t2.Order_Med_ID
inner join EDW_SOURCE_ZONE_CLARITY.Common.Clarity_Medication t3 on t1.Medication_ID=t3.Medication_ID
where t1.OrderStatusCD  in (5,2,9,10) 
/**Removing irrelevant MAR actions **/
and MARActionCD != 2 and MARActionCD != 10 and MARActionCD != 11 and MARActionCD != 1001 and MARActionCD !=99 and MARActionCD != 1002 and MARActionCD != 4
/**Enter one or multiple CSNs here **/
and t1.pat_enc_csn_id in (' ')
order by pat_enc_csn_id, MedicationTakenDTS