# Import tidyverse
library(tidyverse)

# Import theoph data
data("Theoph")

head(Theoph)
tail(Theoph)

# The Theoph dataset contains data on the pharmacokinetics of theophylline:
# - Subject: Identifier of the subject
# - Time: Time since drug administration (hr)
# - conc: Plasma theophylline concentration (mg/L)
# - Weight: Weight of the subject (kg)
# - Dose: Dose of the drug administered (mg/kg)

# Plot 1: Plasma concentration vs Time for all subjects
ggplot(Theoph, aes(x = Time, y = conc, color = factor(Subject))) +
  geom_line() +
  labs(title = "Plasma Theophylline Concentration Over Time",
       x = "Time (hr)",
       y = "Concentration (mg/L)",
       color = "Subject") +
  theme_minimal()


# subset(Theoph, Subject == 1)
# 
# sub1 <- subset(Theoph, Subject == 1)
# sub1$conc
# 
# # find mean of concentration of subject 1
# mean(sub1$conc)
# 
# # find max of concentration of subject 1
# max(sub1$conc)
# 
# # plot subject 1 concentration vs time
# plot(x = sub1$Time, y = sub1$conc)
# 
# #plot all subjects concentration vs time
# plot(x = Theoph$Time, y = Theoph$conc, col = Theoph$Subject)