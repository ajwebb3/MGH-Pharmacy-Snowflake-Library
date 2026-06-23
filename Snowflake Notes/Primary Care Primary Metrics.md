---
tags:
  - AdminProjects
---
- TuTran asking about reporting on clinical metrics in AmCare patients
- Epic referral order is placed for pharmacist clinic
	- PharmD see patients every 2-3 weeks
- Patient follow up window is 3mo on average 
- Ambulatory Referral to MGH Primary Care Pharmacist 
- Every 6 months reporting
- A1C, BP, LDL


## Data Sleuthing
- clinical.order_proc hosts the referral orders
	- display_name like 'Ambulatory Referral to MGH Primary Care Pharmacist%'
	- This lists a CSN ID but does not seem to link to anything
- clinical.referral_apt lists outpatient visits that originate from a referral, but do not seem to link back to the referral order
- clinical.referral_order_id links order_proc_id to referral_id which can be linked to pat_enc_csn_id

### General Framework
- select distinct t1.order_proc_id,
                t1.pat_id,
                t3.serial_number as pat_enc_csn_id
                from edw_source_zone_clarity.clinical.order_proc as t1
                left join edw_source_zone_clarity.clinical.referral_order_id as t2 on t1.order_proc_id = t2.order_id
                inner join edw_source_zone_clarity.clinical.referral_apt as t3 on t2.referral_id = t3.referral_id                
where display_name like 'Ambulatory Referral to MGH Primary Care Pharmacist%'****