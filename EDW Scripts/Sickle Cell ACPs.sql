select distinct t4.PatientID, PatientIdentityID from Epic.Patient.Goal_MGH t1 
left join Epic.Reference.Goal t2 on t1.GoalID = t2.GoalID
left join Epic.Clinical.NoteText_MGH t3 on t2.GoalDescriptionID = t3.NoteID
left join Epic.Patient.Identity_MGH t4 on t1.PatientID = t4.PatientID
where t1.GoalTemplateID = '3017' and
t3.NoteTXT like '%MGH SICKLE CELL%' and
t3.ContactDTS >'2022-01-01'
and t4.IdentityTypeID = '0'
