# GDP, Electricity Access, and Secondary School Enrollment
# World Bank Open Data
# 2015-2024

library(tidyverse)

# Import data

gdp <- read_csv("data/GDP.csv", skip = 4)
education <- read_csv("data/SchoolEnrollment.csv", skip = 4)
electricity <- read_csv("data/ElectricityAccess.csv", skip = 4)

# Clean GDP data

gdp_10yr <- gdp %>%
  select(
    `Country Name`,
    `Country Code`,
    `2015`, `2016`, `2017`, `2018`, `2019`,
    `2020`, `2021`, `2022`, `2023`, `2024`
  )

gdp_long <- gdp_10yr %>%
  pivot_longer(
    cols = `2015`:`2024`,
    names_to = "year",
    values_to = "gdp_per_capita"
  )

gdp_long <- gdp_long %>%
  mutate(year = as.numeric(year))

# Clean school enrollment data

education_10yr <- education %>%
  select(
    `Country Name`,
    `Country Code`,
    `2015`, `2016`, `2017`, `2018`, `2019`,
    `2020`, `2021`, `2022`, `2023`, `2024`
  )

education_long <- education_10yr %>%
  pivot_longer(
    cols = `2015`:`2024`,
    names_to = "year",
    values_to = "school_enrollment"
  )

education_long <- education_long %>%
  mutate(year = as.numeric(year))

# Clean electricity access data

electricity_10yr <- electricity %>%
  select(
    `Country Name`,
    `Country Code`,
    `2015`, `2016`, `2017`, `2018`, `2019`,
    `2020`, `2021`, `2022`, `2023`, `2024`
  )

electricity_long <- electricity_10yr %>%
  pivot_longer(
    cols = `2015`:`2024`,
    names_to = "year",
    values_to = "electricity_access"
  )

electricity_long <- electricity_long %>%
  mutate(year = as.numeric(year))

electricity_long <- electricity_long %>%
  select(-`Country Name`)

# Merge datasets

education_long <- education_long %>%
  select(-`Country Name`)

research_data <- left_join(
  gdp_long,
  education_long,
  by = c("Country Code", "year")
)

research_data <- left_join(
  research_data,
  electricity_long,
  by = c("Country Code", "year")
)

# Create final dataset

analysis_data <- research_data %>%
  filter(
    !is.na(gdp_per_capita),
    !is.na(school_enrollment),
    !is.na(electricity_access)
  )

analysis_data <- analysis_data %>%
  mutate(log_gdp = log(gdp_per_capita))

# Regression models

# Model 1
model1 <- lm(
  school_enrollment ~ log_gdp,
  data = analysis_data
)

summary(model1)

# Model 2
model2 <- lm(
  school_enrollment ~ log_gdp + electricity_access,
  data = analysis_data
)

summary(model2)

# Scatter plot

ggplot(
  analysis_data,
  aes(
    x = log_gdp,
    y = school_enrollment
  )
) +
  geom_point(
    alpha = 0.25,
    size = 2,
    color = "black"
  ) +
  geom_smooth(
    method = "lm",
    se = TRUE,
    color = "darkblue",
    linewidth = 1
  ) +
  labs(
    title = "GDP per Capita vs. Secondary School Enrollment",
    subtitle = "Cross-country panel data (2015-2024)",
    x = "Log GDP per Capita",
    y = "Secondary School Enrollment (%)",
    caption = "Source: World Bank Open Data"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    axis.title = element_text(size = 13),
    axis.text = element_text(size = 11),
    plot.caption = element_text(size = 10, hjust = 1)
  )

# Save figure

ggsave(
  "figures/Figure1_GDP_SchoolEnrollment.png",
  width = 10,
  height = 7,
  dpi = 300
)

# Save final dataset

write_csv(
  analysis_data,
  "analysis_data.csv"
)
# End of analysis