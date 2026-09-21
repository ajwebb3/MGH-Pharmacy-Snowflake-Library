---
tags:
  - AdminProjects
---
Melissa reached out to request data on TPN utilization in an effort to increase Clinimix use

### Original email:
Andy,

I hope you are doing well. I look forward to connecting soon.

In the meantime, I am hoping you can help us with a data request that would provide meaningful insight and inform the future infrastructure of the Center for Drug Outcomes.

We recently approved a medication-use guideline promoting commercially available TPN, with defined criteria for when customized TPN is clinically appropriate. We would ideally like to establish the following outcome measure:

Adoption rate: Percentage of eligible patients who receive commercially available TPN, such as Clinimix.

Could you help us determine how to define the eligible patient population, identify the necessary data elements, and develop a practical approach for manually monitoring adoption until a more automated solution is available?

Thank you for your expertise and partnership.

With appreciation,

Melissa

## Snowflake Scratch Notes
- Seems impetus for dashboard would be to align use with guideline published here: https://mgb.ellucid.com/pman/documents/view/49900
- The crux of the ask is:
	- Define the rate of "appropriate use" of custom TPN across the system
	- Determine percent of patients who might be able to use Clinimix
- How to operationalize this:
	- Define baseline number of patients on TPN over time
	- Determine percent on custom vs Clinimix
	- Pull relevant baseline labs that might be important
- Data elements pertinent to Clinimix eligibility
	- Allergies (egg, soy, or peanut)
	- Duration of therapy (not feasible to pull automatically)
	- Baseline electrolytes
		- K
		- PO4
		- Mg
		- "Acid base disorders"
	- "Electrolyte wasting conditions"
		- Diarrhea
		- Ostomy
		- SIADH
		- Obesity
		- Critical illness
		- Pregnancy
		- "High protein requirements"
		- Custom additives needed
	- Medications that may worsen wasting
		- Ampho
		- Foscarnet
		- Cisplatin
		- Ifosfomide
	- Fluid restrition
	- Poor renal function (GFR <30)
	- Poor glycemic control
	- SMOFLipid need
		- Elevated LFT
		- Elevated trig
		- Long term PN use
		- Inflammatory states