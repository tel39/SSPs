# Load libraries
library(ggplot2)
library(dplyr)

# Organize data by Year, SSP1_Forests, SSP2_Forests, SSP3_Forests, SSP4_Forests, SSP5_Forests
data <- read.csv("/Users/torrelavelle/Documents/GitHub/SSPs/SspDb_country_data_2013-06-12 3.csv")

# Define function to calculate pandemic risk based on forest data
calculate_pandemic_risk <- function(forest_cover) {
  baseline_risk <- 1  # Define baseline risk level
  risk <- baseline_risk * (1 - forest_cover)
  return(risk)
}

# Apply function to each SSP scenario
data <- data %>%
  mutate(
    SSP1_Risk = calculate_pandemic_risk(SSP1_Forests),
    SSP2_Risk = calculate_pandemic_risk(SSP2_Forests),
    SSP3_Risk = calculate_pandemic_risk(SSP3_Forests),
    SSP4_Risk = calculate_pandemic_risk(SSP4_Forests),
    SSP5_Risk = calculate_pandemic_risk(SSP5_Forests)
  )

# Reshape data for plotting
data_long <- data %>%
  select(Year, SSP1_Risk, SSP2_Risk, SSP3_Risk, SSP4_Risk, SSP5_Risk) %>%
  pivot_longer(cols = starts_with("SSP"), names_to = "SSP", values_to = "Pandemic_Risk")

# Plot data
ggplot(data_long, aes(x = Year, y = Pandemic_Risk, color = SSP)) +
  geom_line(size = 1.2) +
  labs(
    title = "Intact Forests and Deforestation: Pandemic Risk (2000 to 2100)",
    x = "Year",
    y = "Pandemic Risk",
    color = "SSP Scenario"
  ) +
  theme_minimal()

