# Load libraries
library(ggplot2)
library(dplyr)

# Define years and population projections for each SSP scenario
years <- seq(2000, 2100, by = 10)
ssp1_pop <- c(6, 6.5, 6.8, 7, 7.2, 7.1, 7, 6.9, 6.8, 6.7, 6.6)  # SSP1 population in billions
ssp2_pop <- c(6, 6.8, 7.5, 8.1, 8.5, 8.7, 8.6, 8.4, 8.3, 8.2, 8.1)  # SSP2 population in billions
ssp3_pop <- c(6, 7, 8, 9, 10, 10.5, 11, 11.5, 12, 12.5, 13)  # SSP3 population in billions
ssp4_pop <- c(6, 6.9, 7.8, 8.6, 9.2, 9.6, 9.8, 9.9, 10, 10.1, 10.2)  # SSP4 population in billions
ssp5_pop <- c(6, 6.5, 6.9, 7.3, 7.5, 7.4, 7.2, 7, 6.8, 6.7, 6.6)  # SSP5 population in billions

# Assuming a linear relationship between population and pandemic risk
pandemic_risk <- function(population) {
  return(population * 0.1)  # Adjust coefficient as needed
}

# Calculate pandemic risk for each SSP
ssp1_risk <- pandemic_risk(ssp1_pop)
ssp2_risk <- pandemic_risk(ssp2_pop)
ssp3_risk <- pandemic_risk(ssp3_pop)
ssp4_risk <- pandemic_risk(ssp4_pop)
ssp5_risk <- pandemic_risk(ssp5_pop)

# Create data frame for plotting
data <- data.frame(
  year = rep(years, times = 5),
  risk = c(ssp1_risk, ssp2_risk, ssp3_risk, ssp4_risk, ssp5_risk),
  ssp = rep(c("SSP1", "SSP2", "SSP3", "SSP4", "SSP5"), each = length(years))
)

# Check data structure and content
print(str(data))
print(head(data))

# Plot the data
ggplot(data, aes(x = year, y = risk, color = ssp)) +
  geom_line(size = 1) +
  labs(title = "Population Change: Pandemic Risk (2000-2100)",
       x = "Year",
       y = "Pandemic Risk",
       color = "SSP Scenario") +
  theme_minimal()

  