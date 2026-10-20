# African Agricultural Production Analysis

## Project Overview
This project analyzes agricultural production data from selected West African countries using SQL and data from the Food and Agriculture Organization of the United Nations (FAOSTAT).

The analysis compares the recorded production of cassava, maize, and rice between 2000 and 2024.

## Objectives
- Compare crop production between 2000 and 2024.
- Identify countries with the largest percentage increases in recorded production.
- Compare production growth across cassava, maize, and rice.
- Practice SQL data analysis using real-world agricultural data.

## Data Source
- Source: FAOSTAT
- Website: https://www.fao.org/faostat/
- Geographic coverage: Selected West African countries
- Period: 2000–2024
- Crops: Cassava, fresh; Maize (corn); Rice

## Tools Used
- MySQL
- MySQL Workbench
- SQL

## SQL Techniques
- SELECT and WHERE
- SUM and CASE WHEN
- GROUP BY and ORDER BY
- Aggregate functions
- Percentage-change calculations
- NULLIF to avoid division by zero
- HAVING to filter country-crop combinations with records in both comparison years

## Preliminary Findings
- Senegal recorded the largest percentage increase in cassava production among the country-crop combinations analyzed, at 979.02%.
- Niger recorded the largest percentage increase in maize production, at 1,070.66%.
- Senegal recorded the largest percentage increase in rice production, at 681.05%.
- Nigeria had the largest recorded 2024 production quantity for cassava and rice among the countries represented in the comparisons.
- Cabo Verde's recorded maize production fell sharply between 2000 and 2024 and requires further investigation.

## Data Limitations
- The analysis covers only the selected countries, crops, and years in the downloaded dataset.
- Some country-crop combinations do not have records for both comparison years.
- A missing record should not automatically be interpreted as zero production.
- Unusual values and reporting flags require verification before drawing conclusions.
- The units and metadata should be confirmed against the original FAOSTAT download before final publication.
  
## Data Quality Checks

- Confirmed 1,575 records covering eight selected West African countries, three crops, and the period 2000–2024.
- Verified that each available country-crop combination contains 25 annual records for production, area harvested, and yield.
- Checked reporting flags for official, estimated, imputed, and external-organization values.
- Found 457 of 525 production records (87.0%) marked as official values.
- Compared reported and calculated maize yields for Cabo Verde in 2017 and 2024. The results were consistent after unit conversion and rounding.
- Missing country-crop combinations were not automatically treated as zero production.

## Project Status
Initial SQL exploration and production comparison completed. Further data validation and documentation are ongoing.
