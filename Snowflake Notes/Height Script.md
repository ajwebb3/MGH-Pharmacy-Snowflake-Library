  extract(height, 
          into = c("feet", "inches"), 
          regex = "(\\d+)'\\s*(\\d*\\.?\\d+)\"",
          remove = FALSE,
          convert = TRUE) %>%
  mutate(height_cm = round((feet * 30.48) + (inches * 2.54), 1))