# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)

# Define function to download and prepare SSP data
prepare_ssp_data <- function(ssp_url) {
  ssp_data <- read_csv(ssp_url)
  ssp_data <- ssp_data %>%
    filter(Indicator %in% c("Poverty", "Economic Inequality")) %>%
    select(Year, SSP, Value, Indicator)
  return(ssp_data)
}

# URLs for SSP poverty and economic inequality data from IIASA database
ssp1_url <- "https://iiasa.ac.at/web/scientific_update/ssp1.csv"
ssp2_url <- "https://iiasa.ac.at/web/scientific_update/ssp2.csv"
ssp3_url <- "https://iiasa.ac.at/web/scientific_update/ssp3.csv"
ssp4_url <- "https://iiasa.ac.at/web/scientific_update/ssp4.csv"
ssp5_url <- "https://iiasa.ac.at/web/scientific_update/ssp5.csv"

# Prepare data for each SSP
ssp1_data <- prepare_ssp_data(ssp1_url)
ssp2_data <- prepare_ssp_data(ssp2_url)
ssp3_data <- prepare_ssp_data(ssp3_url)
ssp4_data <- prepare_ssp_data(ssp4_url)
ssp5_data <- prepare_ssp_data(ssp5_url)

# Combine data into single dataframe
ssp_data <- bind_rows(ssp1_data, ssp2_data, ssp3_data, ssp4_data, ssp5_data)

# Define function to model pandemic risk: pandemic risk increases with both poverty and inequality
model_pandemic_risk <- function(poverty, inequality) {
  risk <- poverty * 0.5 + inequality * 0.5
  return(risk)
}

# Apply model to data
ssp_data <- ssp_data %>%
  spread(Indicator, Value) %>%
  mutate(PandemicRisk = model_pandemic_risk(Poverty, EconomicInequality))

# Plot trajectories
ggplot(ssp_data, aes(x = Year, y = PandemicRisk, color = SSP)) +
  geom_line(size = 1.2) +
  theme_minimal() +
  labs(title = "Poverty and Economic Inequality: Pandemic Risk (2000-2100)",
       x = "Year",
       y = "Pandemic Risk",
       color = "SSP") +
  theme(legend.position = "bottom")
