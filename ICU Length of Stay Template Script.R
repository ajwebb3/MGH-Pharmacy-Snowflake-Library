adt_times <- adt %>% 
  filter(patientencounterid %in% rc$patientencounterid) %>% 
  filter(adteventtypedsc != "Census" & adteventtypedsc != "Patient Update") %>% 
  group_by(patientencounterid) %>% 
  arrange(patientencounterid, effectivedts) %>% 
  filter(grepl("ICU|CCU", departmentdsc, ignore.case = T)) %>% 
  mutate(action = ifelse(adteventtypedsc == "Admission" | adteventtypedsc == "Transfer In", "In", "Out"))

adt_ins <- adt_times %>% filter(action == "In")
adt_outs <- adt_times %>% filter(action == "Out")

adt_pairs <- adt_ins %>% 
  left_join(adt_outs, by = c("patientencounterid", "departmentdsc")) %>% 
  mutate(los = difftime(effectivedts.y, effectivedts.x, units = "days")) %>% 
  filter(los >= 0) %>%
  group_by(patientencounterid, effectivedts.x) %>% 
  filter(los == min(los)) %>% 
  ungroup() %>% 
  group_by(patientencounterid) %>% 
  summarize(icu_length_of_stay = sum(los))


icu_adt_los <- adt_times %>% mutate(icu_admission_date = min(effectivedts),
                                    icu_discharge_date = max(effectivedts)) %>% 
  distinct(patientencounterid, .keep_all = T) %>% 
  left_join(adt_pairs) %>% 
  select(patientencounterid, icu_admission_date, icu_discharge_date, icu_length_of_stay) %>%
  ungroup() %>%  
  mutate(icu_length_of_stay = round(icu_length_of_stay, 2))