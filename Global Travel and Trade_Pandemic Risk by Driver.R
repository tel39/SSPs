# Load libraries
library(tidyverse)

# Load SSP data (need to add in)
ssp1 <- read.csv("path_to_ssp1_trade_travel_data.csv")
ssp2 <- read.csv("path_to_ssp2_trade_travel_data.csv")
ssp3 <- read.csv("path_to_ssp3_trade_travel_data.csv")
ssp4 <- read.csv("path_to_ssp4_trade_travel_data.csv")
ssp5 <- read.csv("path_to_ssp5_trade_travel_data.csv")

# Function to calculate pandemic risk based on trade and travel
calculate_pandemic_risk <- function(trade_volume, travel_volume) {
  # Risk increases with trade and travel
  risk <- (trade_volume * 0.4) + (travel_volume * 0.6)
  return(risk)
}

# Apply function to datasets
ssp1$risk <- mapply(calculate_pandemic_risk, ssp1$trade, ssp1$travel)
ssp2$risk <- mapply(calculate_pandemic_risk, ssp2$trade, ssp2$travel)
ssp3$risk <- mapply(calculate_pandemic_risk, ssp3$trade, ssp3$travel)
ssp4$risk <- mapply(calculate_pandemic_risk, ssp4$trade, ssp4$travel)
ssp5$risk <- mapply(calculate_pandemic_risk, ssp5$trade, ssp5$travel)

# Combine datasets for plotting
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
  labs(title = "Global Travel and Trade: Pandemic Risk (2000-2100)",
       x = "Year",
       y = "Pandemic Risk",
       color = "SSP") +
  theme_minimal()


