#### Preamble ####
# Purpose: Simulates data
# Author: Andrew Goh, Yisu Hou, Jiwon Choi
# Date: 10 October 2024
# Contact: andrew.goh@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(6737151)

n <- 100
# simulate 100 dates
dates <- seq.Date(from = as.Date("2022-01-01"), by = "day", length.out = n)
# same for times
times <- format(
  as.POSIXct("2022-01-01 00:00:00") + runif(n, min = 0, max = 24 * 3600),
  format = "%H:%M:%S"
)
# delay in minutes
min_delay <- abs(round(rnorm(n, 15, 5), 0))
# combine
simulated_data <- data.frame(Date = dates, Time = times, Min.Delay = min_delay)

# write to file
write_csv(simulated_data, file = "data/raw_data/simulated.csv")
