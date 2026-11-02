---
tags:
  - Research
---
Starting to work on data pull for cefepime neurotox project. Will be a beast of a pull. 
Copy of research protocol can be found here: [CIN Research Proposal Draft.docx](https://partnershealthcare-my.sharepoint.com/:w:/g/personal/enchan_mgh_harvard_edu/IQD_-dPoKsARSpKpvJuf7Yg6AaEuYLS4_SBV7bIwm1Uw_rU)

## Inclusion Criteria
- Adult patients
- Admitted to MGH between 2016-2026
- Received cefepime

## Exclusion Criteria
- Positive delirium screen within 48 hours of beta lactam initiation
	- +CAM-ICU
	- GCS <8
	- Restraint order
	- ICD10 code for delirium
		- **F05**: Delirium due to known physiological condition (ICD-10-CM). Subcodes: F05 (as of FY2023 it’s a valid billable code, previously F05 alone).
- **F10.231, F10.921, F10.121 and similar**: Alcohol-related delirium (withdrawal delirium, intoxication delirium).
- **F13.231, F13.921, F13.121**: Sedative/hypnotic/anxiolytic-related delirium.
- **F19.231, F19.921, F19.121**: Other psychoactive substance delirium.
- Other substance classes with delirium subcodes: F11 (opioid) F12 (cannabis) F14 (cocaine) F15 (stimulant) F16 (hallucinogen) F18 (inhalant), mostly in the `x21` / `x21`-style intoxication and `x31` withdrawal delirium positions.
- **R41.0**: Disorientation, unspecified (often used for “confusion”; includes “delirium NOS” in ICD-10-CM index mapping).

