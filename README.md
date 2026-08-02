# GDP and Secondary School Enrollment Analysis

## Overview

This project examines the relationship between GDP per capita and secondary school enrollment across countries from 2015 to 2024 using World Bank Open Data. The goal was to gain experience working with real-world data in R while exploring the relationship between economic development and education.

## Figure

![GDP and Secondary School Enrollment](figures/Figure1_GDP_SchoolEnrollment.png)

## Research Question

How are GDP per capita and access to electricity associated with secondary school enrollment across countries?

## Data

Data were obtained from the World Bank Open Data database.

Datasets used:

- GDP per capita (current US$)
- School enrollment, secondary (% gross)
- Access to electricity (% of population)

Study period: **2015–2024**

## Methodology

The analysis was completed in **R** using the **tidyverse** package.

Main steps included:

- Importing multiple World Bank datasets
- Cleaning and selecting relevant variables
- Converting datasets from wide format to long format
- Merging datasets using country code and year
- Creating a cross-country panel dataset
- Applying a log transformation to GDP per capita
- Conducting exploratory data analysis
- Estimating simple and multiple linear regression models
- Visualizing the relationship using **ggplot2**

## Results

The analysis found a positive relationship between GDP per capita and secondary school enrollment.

Adding access to electricity as a control variable improved the model and increased the explanatory power from approximately **R² = 0.61** to **R² = 0.70**, while GDP per capita remained positively associated with school enrollment.

## Repository Structure

```
analysis.R                 # Main R script
analysis_data.csv          # Final cleaned dataset

data/
    GDP.csv
    SchoolEnrollment.csv
    ElectricityAccess.csv

figures/
    Figure1_GDP_SchoolEnrollment.png
```

## Tools

- R
- tidyverse
- ggplot2
- World Bank Open Data

## Notes

This project was completed as a personal learning exercise to develop practical skills in data cleaning, data visualization, and regression analysis using R.
