# Load libraries
library(ggplot2)
library(dplyr)

# Data for pandemic risk based on SSP narratives (may need to be tweaked)
years <- seq(2000, 2100, by = 10)
ssp1 <- c(0.1, 0.08, 0.07, 0.06, 0.05, 0.04, 0.03, 0.02, 0.015, 0.01, 0.005)
ssp2 <- c(0.1, 0.09, 0.085, 0.08, 0.075, 0.07, 0.065, 0.06, 0.055, 0.05, 0.045)
ssp3 <- c(0.1, 0.12, 0.14, 0.16, 0.18, 0.2, 0.22, 0.24, 0.26, 0.28, 0.3)
ssp4 <- c(0.1, 0.11, 0.12, 0.13, 0.14, 0.145, 0.15, 0.155, 0.16, 0.165, 0.17)
ssp5 <- c(0.1, 0.09, 0.08, 0.07, 0.06, 0.055, 0.05, 0.045, 0.04, 0.035, 0.03)

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
    title = "Political and Legal Determinants of Health: Pandemic Risk (2000 to 2100)",
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
