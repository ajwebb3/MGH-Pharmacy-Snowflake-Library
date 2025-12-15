SELECT DISTINCT t1.PatientEncounterID,
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
FROM EDW_SOURCE_ZONE_EPIC.Orders_Clinical.Medication as t1
left join EDW_SOURCE_ZONE_EPIC.Clinical.AdministeredMedication t2 on t1.OrderID=t2.OrderID
inner join EDW_SOURCE_ZONE_EPIC.Reference.Medication t3 on t1.MedicationID=t3.MedicationID
where t1.OrderStatusCD  in (5,2,9,10) 
/**Removing irrelevant MAR actions **/
and MARActionCD != 2 and MARActionCD != 10 and MARActionCD != 11 and MARActionCD != 1001 and MARActionCD !=99 and MARActionCD != 1002 and MARActionCD != 4
/**Enter one or multiple CSNs here **/
and t1.PatientEncounterID in (' ')
order by PatientEncounterID, MedicationTakenDTS