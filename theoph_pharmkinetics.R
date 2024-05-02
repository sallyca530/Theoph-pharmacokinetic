# Import tidyverse
library(tidyverse)

# Import theoph data
data("Theoph")

head(Theoph)
tail(Theoph)

subset(Theoph, Subject == 1)

sub1 <- subset(Theoph, Subject == 1)
sub1$conc

# find mean of concentration of subject 1
mean(sub1$conc)

# find max of concentration of subject 1
max(sub1$conc)

# plot subject 1 concentration vs time
plot(x = sub1$Time, y = sub1$conc)

#plot all subjects concentration vs time
plot(x = Theoph$Time, y = Theoph$conc, col = Theoph$Subject)