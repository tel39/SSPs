# Load libraries
library(ggplot2)
library(dplyr)
library(readr)

# Load population data
ssp_data <- read_csv('/Users/torrelavelle/Documents/GitHub/SSPs/SspDb_country_data_2013-06-12 3.csv')

# Inspect data structure
# Confirm columns are named as follows:'Year' for year,'Scenario' for SSP scenario,'Population' for population
head(ssp_data)
str(ssp_data)

# Filter and prepare data for plotting
ssp_data <- ssp_data %>%
  filter(Scenario %in% c("SSP1", "SSP2", "SSP3", "SSP4", "SSP5")) %>%
  group_by(Year, Scenario) %>%
  summarise(Population = sum(Population, na.rm = TRUE))

# Calculate pandemic risk with coefficient below
ssp_data <- ssp_data %>%
  mutate(Risk = Population * 0.1)

# Plot data
ggplot(ssp_data, aes(x = Year, y = Risk, color = Scenario)) +
  geom_line(size = 1) +
  labs(title = "Pandemic Risk Trajectories (2000-2100)",
       x = "Year",
       y = "Pandemic Risk",
       color = "SSP Scenario") +
  theme_minimal()

