# GDP and Secondary School Enrollment: A Cross-Country Panel Data Analysis

![R](https://img.shields.io/badge/R-Programming-blue)
![Econometrics](https://img.shields.io/badge/Method-Linear%20Regression-green)
![Data](https://img.shields.io/badge/Data-World%20Bank-orange)
![Panel Data](https://img.shields.io/badge/Type-Panel%20Data-purple)
![Period](https://img.shields.io/badge/Years-2015--2024-yellowgreen)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

---

## Overview

This project explores the relationship between GDP per capita and secondary school enrollment across countries between 2015 and 2024. The analysis also examines whether access to electricity helps explain differences in educational outcomes after controlling for GDP per capita.

---

## Research Question

**How are GDP per capita and access to electricity associated with secondary school enrollment across countries?**

---

## Data

Source: **World Bank Open Data**

Variables used:

- GDP per capita (current US$)
- Secondary school enrollment (% gross)
- Access to electricity (% of population)

Final dataset:

- **232 countries**
- **1,829 country-year observations**
- **2015–2024**

---

## Methods

- Data cleaning using **tidyverse**
- Converted datasets from **wide** to **long** format
- Merged datasets using country code and year
- Created a cross-country panel dataset
- Log transformation of GDP per capita
- Exploratory data analysis
- Simple linear regression
- Multiple linear regression
- Data visualization with **ggplot2**

---

## Main Findings

- Higher GDP per capita is positively associated with secondary school enrollment.
- After controlling for electricity access, GDP remained statistically significant.
- Adding electricity access improved model fit (**R² increased from 0.61 to 0.70**).

---

## Project Structure

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

---

## Figure

![GDP and Secondary School Enrollment](figures/Figure1_GDP_SchoolEnrollment.png)

---

## Tools

- R
- tidyverse
- ggplot2
- World Bank Open Data
