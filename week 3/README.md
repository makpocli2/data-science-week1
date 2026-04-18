# Parasite Co-infection Analysis

## Project Overview

Brief description of the research question and dataset.

## Data

- **Source**: provided for course
- **Sample size**: 92 fish, 37 infected 58 not
- **Response variable**: Trematode count (integer, range:0-4)
- **Predictors**: 
  - Infection status (Uninfected vs Tapeworm)
  - Fish length (mm, range:30-58.7)

## Files

- `parasites.csv`: Raw data
- `01_data_cleaning.R`: Data preparation
- `02_analysis.R`: Statistical modelling
- `analysis_report.qmd`: Results write-up and figure [Optional]
- `README.md`: This file

## Analysis Workflow

1. **Data cleaning**: [i summarised the data and looked for any issues within it and fix them]
2. **Model selection**: using models that worked previously for similar data and tweaked anything to fit my data
3. **Final model**: [quasi poisson]
4. **Key finding**: 

## Software

- R version: [rstudio download on computer]
- Key packages:
  - tidyverse v[2.0.0]
  - performance v[0.16.0]
  - emmeans v[2.0.3]
  - [others]

## Results
the tapeworm didnt have an effect on the trematodes found
the fish length also affects the number of trematodes


## Key Decisions
using the quasi model over the standard

## Author

MEG AKPOCLI