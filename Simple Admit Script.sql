select PAT_ID, 
        PAT_ENC_CSN_ID,
        WEIGHT,
        HEIGHT,
        HOSP_ADMSN_TIME,
        HOSP_DISCHRG_TIME
from EDW_SOURCE_ZONE_CLARITY.CLINICAL.PAT_ENC
where pat_enc_csn_id in ()