# Load libraries
library(ggplot2)
library(dplyr)

# Data for pandemic risk based on SSP narratives (might need to be slightly tweaked)
years <- seq(2000, 2100, by = 10)
ssp1 <- c(0.2, 0.3, 0.25, 0.2, 0.15, 0.1, 0.08, 0.05, 0.03, 0.02, 0.01)
ssp2 <- c(0.2, 0.25, 0.3, 0.35, 0.4, 0.35, 0.3, 0.25, 0.2, 0.15, 0.1)
ssp3 <- c(0.2, 0.3, 0.4, 0.5, 0.6, 0.55, 0.5, 0.45, 0.4, 0.35, 0.3)
ssp4 <- c(0.2, 0.28, 0.36, 0.44, 0.52, 0.5, 0.48, 0.46, 0.44, 0.42, 0.4)
ssp5 <- c(0.2, 0.22, 0.24, 0.26, 0.28, 0.25, 0.22, 0.19, 0.16, 0.13, 0.1)

# Create data frame
data <- data.frame(
  Year = rep(years, 5),
  Pandemic_Risk = c(ssp1, ssp2, ssp3, ssp4, ssp5),
  Scenario = factor(rep(c("SSP1", "SSP2", "SSP3", "SSP4", "SSP5"), each = length(years)))
)

# Plot data
ggplot(data, aes(x = Year, y = Pandemic_Risk, color = Scenario)) +
  geom_line(size = 1.2) +
  labs(
    title = "Data Sharing and Information Flow: Pandemic Risk (2000 to 2100)",
    x = "Year",
    y = "Pandemic Risk",
    color = "SSP Scenario"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14),
    axis.title = element_text(size = 12),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10)
  )
