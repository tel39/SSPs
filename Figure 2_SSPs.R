# Load necessary library
library(ggplot2)

# Create a data frame for the SSP points
ssp_data <- data.frame(
  SSP = c("SSP1", "SSP2", "SSP3", "SSP4", "SSP5"),
  x = c(-2, 0, 2, 1, -1),  # Qualitative placements
  y = c(-2, 0, 2, -1, 2)   # Qualitative placements
)

# Create the plot
ggplot(ssp_data, aes(x = x, y = y, label = SSP)) +
  geom_point(size = 4) +
  geom_text(vjust = -1) +
  xlab("Change in Spillover Risk (Challenges to Primary Prevention)") +
  ylab("Change in Risk of Spillover Leading to Epidemics/Pandemics (Challenges to Secondary Prevention)") +
  ggtitle("Challenges Space for SSP Pandemic Risk") +
  theme_minimal()

