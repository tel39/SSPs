# Load libraries
library(ggplot2)

# Load data (or decide on more qualitative assessment)
data <- read.csv('Users/torrelavelle/figure2.csv')

# Add column names
ssp_data <- data[data$SSP %in% 1:5, ]

# Create scatter plot
ggplot(ssp_data, aes(x = PrimaryPrevention, y = SecondaryPrevention, color = factor(SSP))) +
  geom_point(size = 3) +
  labs(
    title = "Shared Socioeconomic Pathways",
    x = "Change in Spillover Risk (Challenges to Primary Prevention)",
    y = "Change in Risk of Spillover Leading to Epidemics/Pandemics (Challenges to Secondary Prevention)",
    color = "SSP"
  ) +
  theme_minimal()
