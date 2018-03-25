# Preprocess data to standard long format

library(tidyverse)

d <- read_csv("data/feasibility_HPBM_data.csv")

# Convert to long.
d <- gather(d, variable, value, 3:18)

# Separate variable and time to 2 columns.
d <- separate(d, variable, c("item", "time"), sep = "_T")

# Transform Time to a numeric variable 0-1.
d$time <- as.integer(d$time)-1

# Sort data for clarity.
d <- arrange(d, ID, time)

write_csv(d, "data/motivation.csv")
