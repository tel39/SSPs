# Load library
library(ggplot2)

# Create data frame for SSP points
ssp_data <- data.frame(
  SSP = c("SSP1", "SSP2", "SSP3", "SSP4", "SSP5"),
  x = c(-2, 0, 2, 1, -1),  
  y = c(-2, 0, 2, -1, 2) 
)

# Create plot
ggplot(ssp_data, aes(x = x, y = y, label = SSP)) +
  geom_point(size = 4) +
  geom_text(vjust = -1) +
  xlab("Change in Spillover Risk\n(Challenges to Primary Prevention)") +
  ylab("Change in Risk of Spillover Leading to Epidemics/Pandemics\n(Challenges to Secondary Prevention)") +
  ggtitle("Challenges Space for SSP Pandemic Risk") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, vjust = 1.5, size = 14),
    plot.margin = margin(60, 10, 10, 10),                           
    axis.title.x = element_text(margin = margin(t = 10)),        
    axis.title.y = element_text(margin = margin(r = 10)),           
    panel.grid = element_blank(),                               
    aspect.ratio = 1                                          
  ) +
  scale_x_continuous(limits = c(-3, 3), breaks = seq(-3, 3, by = 1)) + 
  scale_y_continuous(limits = c(-3, 3), breaks = seq(-3, 3, by = 1)) + 
  annotate("text", x = -2.5, y = 3, label = "Secondary\nPrevention\nChallenges\nDominate", hjust = 0, size = 3) +
  annotate("text", x = 2.5, y = 3, label = "High\nChallenges", hjust = 1, size = 3) +
  annotate("text", x = -2.5, y = -2.7, label = "Low\nChallenges", hjust = 0, size = 3) +
  annotate("text", x = 2.5, y = -2.4, label = "Primary\nPrevention\nChallenges\nDominate", hjust = 1, size = 3)

