- EDW_SOURCE_ZONE_CLARITY.Common.Clarity_Medication
	- List of medication names with primary key being MEDICATION_ID
	- Seems similar to EDW_SOURCE_ZONE_EPIC.Reference.Medication
- EDW_SOURCE_ZONE_CLARITY.Clinical.Orders
	- Has primary key of ORDER_ID, seems similar to EDW_SOURCE_ZONE_EPIC.Orders_Clinical but perhaps not as specific as the subfolders within that?
	- Has PAT_ID as a link
	- Not specific to meds, has no link to medication ID
- EDW_SOURCE_ZONE_CLARITY.Clinical.Order_Med 
	- Seems to be most akin to EDW_SOURCE_ZONE_EPIC.Orders_Clinical.Medications
	- Has Order_Med_ID as primary key that appears to link to Order_ID
	- Also has PAT_ID, PAT_ENC_CSN_ID (CSN), and MEDICATION ID
- EDW_SOURCE_ZONE_CLARITY.Clinical.MAR_ADMIN_INFO
	- Seems to be akin to EDW_SOURCE_ZONE_EPIC.Clinical.AdministeredMedication
	- Everything is codes (ie MAR action code, sig code, etc are all numeric. Will need to find reference tables.)
		- EDW_SOURCE_ZONE_CLARITY.Common.ZC_MAR_RSLT stores the codes for MAR actions (mar_action_c = result_c)
		- Relevant administration codes (not all of the available codes):

| RESULT_C | NAME                    |
| -------- | ----------------------- |
| 1        | Given                   |
| 6        | New Bag                 |
| 7        | Restarted               |
| 9        | Rate Change             |
| 12       | Bolus                   |
| 13       | Push                    |
| 16       | Paused                  |
| 102      | Given by Other          |
| 105      | New Syringe/Cartridge   |
| 113      | Given During Downtime   |
| 114      | Started During Downtime |
| 116      | Override Pull           |
| 117      | Bolus from Bag          |
| 128      | Same Bag                |
		- EDW_SOURCE_ZONE_CLARITY.COMMON.ZC_ROUTE is the reference table for route it seems
			- An unusual number of administrations seem to be linked to Other/Misc route? Need to look into that
			- Turns out there is a separate EDW_SOURCE_ZONE_CLARITY.COMMON.ZC_ADMIN_ROUTE that has the right data
- EDW_SOURCE_ZONE_CLARITY.Clinical.ORDER_MED_SIG only seems to include SIG instructions for actual outpatient scripts
	- SIG in MAR_ADMIN_INFO is the dose it seems