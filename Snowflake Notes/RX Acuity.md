---
tags:
  - AdminProjects
---
- Ramy asked about trending or reporting RxAcuity scores with Snowflake
- There seems to be several tables in Snowflake that relate to acuity scoring, but the documentation of what is what and how they link together is sparse, even in the Clarity dictionary
- As an FYI, to link the acuity scoring tables to a patient, use this code:
	-  left join edw_source_zone_clarity.clinical.QM_GEN_INFO t3 on t1.registry_data_id = t3.registry_data_id
	 - left join edw_source_zone_clarity.clinical.rdi_pat_csn t4 on t1.registry_data_id = t4.registry_data_id
	 - With t3 here containing pat_id and t4 containing pat_csn
## Clinical.Acuity_Rule_Score
- This was the first table I tried
	- It has a few primary keys - registry_data_id and rule_id being the main ones I tried
	- registry_data_id seems to be a unique identifier for an individual score calculation. This links to a line number and score_calc_utc_dttm which is when the score was calculated
	- I tried linking this to common.CL_CHRG_EDIT_RULE with rule_id as the linking key, but this only resulted with ~500 Rx Acuity scores ever, despite CL_CHRG_EDIT_RULE hosting the names of all of the acuity score types
	- This made me think that maybe acuite_rule_score was not the right table to look in
		- This seemed to capture MEWS scoring mostly...
## Clinical.Acuity_Score_Specific
- It's a little unclear as to what is different about this table
- This also has registry_data_id and total_score, but lacks the rule_id that I would use to link to another table
- A little more luck trying to link this "acuity_config", which I found has the parent acuity types rather than the individual rules
	- The interlink is QM_GEN_INFO, with the linking column "acuity_system_id"
	- Nevermind... this did not work