# Import tidyverse
library(tidyverse)
library(ggplot2)
library(dplyr)

# Import theoph data
data("Theoph")

# View the data structure and summary
str(Theoph)
summary(Theoph)

# The Theoph dataset contains data on the pharmacokinetics of theophylline:
# Subject: Identifier of the subject
# Time: Time since drug administration (hr)
# conc: Plasma theophylline concentration (mg/L)
# Weight: Weight of the subject (kg)
# Dose: Dose of the drug administered (mg/kg)

# Plot 1: Plasma concentration vs Time for all subjects
ggplot(Theoph, aes(x = Time, y = conc, color = factor(Subject))) +
  geom_line() +
  labs(title = "Plasma Theophylline Concentration Over Time",
       x = "Time (hr)",
       y = "Concentration (mg/L)",
       color = "Subject") +
  theme_minimal()

# Plot 2: Relationship between Dose and Weight
ggplot(Theoph, aes(x = Wt, y = Dose)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Relationship Between Dose and Weight",
       x = "Weight (kg)",
       y = "Dose (mg/kg)") +
  theme_minimal()

# Plot 3: Plasma concentration vs Time for each subject
ggplot(Theoph, aes(x = Time, y = conc)) +
  geom_line() + 
  facet_wrap(~ Subject, scales = "free_y") +
  labs(title = "Plasma Concentration Over Time for Each Subject",
       x = "Time (hr)",
       y = "Concentration (mg/L)") +
  theme_minimal()

# Calculate peak concentration for each subject
peak_conc <- Theoph %>%
  group_by(Subject) %>%
  summarise(PeakConc = max(conc), Dose = first(Dose))

#View data structure of peak_conc to ensure it has the right columns
str(peak_conc)

# Plot 4: Dose vs Peak Concentration
ggplot(peak_conc, aes(x = Dose, y = PeakConc)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Dose vs Peak Plasma Concentration",
       x = "Dose (mg/kg)",
       y = "Peak Concentration (mg/L)") +
  theme_minimal()