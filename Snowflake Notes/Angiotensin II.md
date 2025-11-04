---
tags:
  - MUE
  - PGY2
---
## Overview
[[MUE]] evaluating MGB's institutional adherence to angiotensin II restriction criteria. Snowflake used to extract relevant objective information with supplemental chart review for key outcomes. Primary pull completed In June 2025 for patients who received angiotensin II from Epic initiation (December 2015) through June 10th, 2025.

## Remaining Data Elements to Process
- [x] Amount of fluid administered in the 24 hours prior to angiotensin II administration
	- Pulled flowsheet rows of all Volume documentation
	- Notably, vent tidal volume also gets pulled using the syntax "t4.displaynm like '%Volume (ml)%' or t4.FlowsheetMeasureNM = 'R IP BLOOD ADMINISTRATION VOLUME'" and thus this needs to get filtered off in post
		- Blood is called out specifically because the display name is just "volume", not "volume (mL)"
- [x] Type of fluid administered (NS/LR/D5/Albumin)
- [x] Cardiac index at the time of ang II initiation
	- Processed as within 2 hours of ang II initiation
- [x] CVP at the time of ang II initiation
	- Also within 2 hours
- [x] Time ang II ordered
- [x] Time ang II ended
- [x] Maximum ang II rate in the first 3 hours of infusion
- [x] ICU LOS
- [x] Vasopressors on at 0.5, 1, 2, 4, 6, 12, and 24 hours and their doses
- [x] Whether ang II was restarted at least 24 hours from initial discontinuation
- [x] Whether a MAP of 65 was achieved within 3 hours of initiation
- [x] Whether MAP increased by 10 mmHg or more within 3 hours
- [x] Whether NE equivalents decreased by 20% or more within 3 hours