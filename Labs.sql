-- AS WRITTEN, THIS CODE IS FORMATTED FOR ON-PREM EDW, **NOT SNOWFLAKE** (8/12/2024)

select t1.OrderProcedureID, t1.ResultDateDTS, t1.PatientID, t1.PatientEncounterID, t1.ResultTXT, t1.ResultValueNBR, t1.ReferenceRangeUnitCD, t1.ResultDTS,
                          t2.SpecimenTakenTimeDTS, t2.PatientLocationDSC, t3.ComponentID, t3.ComponentNM, t3.ComponentAbbreviationTXT, t3.BaseNM from Epic.Orders.Result_MGH t1 
                          left join Epic.Orders.Procedure2_MGH t2 on t1.OrderProcedureID=t2.OrderProcedureID 
                          left join Epic.Reference.Component t3 on t1.ComponentID=t3.ComponentID
                          -- Enter BaseNM of labs of interest here
						  -- If multiple needed, change = to in and list separated by comma (e.g. t3.BaseNM in ('ALB', 'CRE'))
						  where (t3.BaseNM = ' ')
						  -- If there are specific CSNs of interest, enter here, separated by comma
                and t1.PatientEncounterID in (' ')
				-- If there is a date range of interest, delet if not
				and t2.SpecimenTakenTimeDTS > ' ' 
