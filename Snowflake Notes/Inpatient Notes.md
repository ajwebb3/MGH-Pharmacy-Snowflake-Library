---
tags:
  - Notes
---
- Inpatient notes live under the HNO INI
- Text is stored in the HNO_NOTE_TEXT table and can be linked back to PAT_ENC_CSN_ID by the HNO_INFO table - NOT the NOTE_ENC_INFO table

select t1.* from edw_source_zone_clarity.clinical.hno_note_text as t1 
left join edw_source_zone_clarity.clinical.HNO_INFO as t2 on t1.note_id = t2.note_id