# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Load biodiversity loss data (CSV file named 'biodiversity_loss.csv' with columns: Year, SSP, BiodiversityLoss)
biodiversity_loss <- read.csv("User/torrelavelle/biodiversity_loss.csv")

# Function to calculate pandemic risk based on biodiversity loss
calculate_pandemic_risk <- function(biodiversity_loss) {
  # Define relationship between biodiversity loss and pandemic risk
  risk <- 0.5 * biodiversity_loss + 1 
  return(risk)
}

# Add new column for pandemic risk
biodiversity_loss <- biodiversity_loss %>%
  mutate(PandemicRisk = calculate_pandemic_risk(BiodiversityLoss))

# Filter data for years 2000 to 2100
biodiversity_loss_filtered <- biodiversity_loss %>%
  filter(Year >= 2000 & Year <= 2100)

# Plot data
ggplot(biodiversity_loss_filtered, aes(x = Year, y = PandemicRisk, color = SSP)) +
  geom_line(size = 1) +
  labs(title = "Biodiversity Loss and Extinctions: Pandemic Risk (2000-2100)",
       x = "Year",
       y = "Pandemic Risk",
       color = "SSP") +
  theme_minimal()

