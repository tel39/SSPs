# Load libraries
library(tidyverse)
library(readxl)
library(ggplot2)

# Load data (downloaded from IIASA database and stored in "SSP_Animal_Production.xlsx")
data <- read_excel("Users/torrelavelle/documents/SSP_Animal_Production.xlsx")

# Process and merge data (filtered by year, SSP, Animal_Production_Index)
data_processed <- data %>%
  filter(Year >= 2000 & Year <= 2100) %>%
  select(Year, SSP, Animal_Production_Index)

# Calculate pandemic risk (risk increases exponentially with animal production index)
calculate_pandemic_risk <- function(animal_production_index) {
  return(exp(animal_production_index / 100))
}

data_processed <- data_processed %>%
  mutate(Pandemic_Risk = calculate_pandemic_risk(Animal_Production_Index))

# Plot data
ggplot(data_processed, aes(x = Year, y = Pandemic_Risk, color = SSP)) +
  geom_line(size = 1) +
  labs(title = "Animal Production and Livestock Systems: Pandemic Risk (2000-2100)",
       x = "Year",
       y = "Pandemic Risk",
       color = "SSP Scenario") +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")

