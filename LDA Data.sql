SELECT LineDrainAirwayID,
       PatientID,
       PatientEncounterID, 
       FlowsheetMeasureID,
       RemovalInstantDTS,
       PlacementDTS,
       FlowsheetDataID,
       LineDrainDSC,
       PropertiesDisplayDSC,
       SiteCD,
       RemovalDTS,
       FROM EDW_SOURCE_ZONE_Epic.Clinical.LineDrainAirwayNoAddSingle
       WHERE ***