# Load libraries
library(tidyverse)

# Load SSP healthcare access data (need to add)
ssp1 <- read.csv("path_to_ssp1_healthcare_access_data.csv")
ssp2 <- read.csv("path_to_ssp2_healthcare_access_data.csv")
ssp3 <- read.csv("path_to_ssp3_healthcare_access_data.csv")
ssp4 <- read.csv("path_to_ssp4_healthcare_access_data.csv")
ssp5 <- read.csv("path_to_ssp5_healthcare_access_data.csv")

# Function to calculate pandemic risk based on healthcare access
calculate_pandemic_risk <- function(healthcare_access) {
  # Risk decreases with better healthcare access
  risk <- (1 - healthcare_access) * 100
  return(risk)
}

# Apply function to datasets
ssp1$risk <- mapply(calculate_pandemic_risk, ssp1$healthcare_access)
ssp2$risk <- mapply(calculate_pandemic_risk, ssp2$healthcare_access)
ssp3$risk <- mapply(calculate_pandemic_risk, ssp3$healthcare_access)
ssp4$risk <- mapply(calculate_pandemic_risk, ssp4$healthcare_access)
ssp5$risk <- mapply(calculate_pandemic_risk, ssp5$healthcare_access)

# Combine datasets
ssp_data <- bind_rows(
  ssp1 %>% mutate(ssp = "SSP1"),
  ssp2 %>% mutate(ssp = "SSP2"),
  ssp3 %>% mutate(ssp = "SSP3"),
  ssp4 %>% mutate(ssp = "SSP4"),
  ssp5 %>% mutate(ssp = "SSP5")
)

# Plot data
ggplot(ssp_data, aes(x = year, y = risk, color = ssp)) +
  geom_line(size = 1.2) +
  labs(title = "Healthcare Access: Pandemic Risk (2000-2100)",
       x = "Year",
       y = "Pandemic Risk",
       color = "SSP") +
  theme_minimal()

