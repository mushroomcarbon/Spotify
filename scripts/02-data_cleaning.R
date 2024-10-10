#### Preamble ####
# Purpose: Cleans the raw delay data into an analysis dataset
# Author: Andrew Goh
# Date: 10 October 2024
# Contact: andrew.goh@utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None.

library(here)
library(lubridate)
library(dplyr)

# Read the raw data
subwayData <- read.csv(here::here("./data/raw_data/raw_data.csv"))
busData <- read.csv(here::here("./data/raw_data/raw_data_bus.csv"))

# Convert the Time column to a proper time format
subwayData$Time <- hm(subwayData$Time) # Parse 'Time' as hours and minutes
busData$Time <- hm(busData$Time)

# Extract the hour from the Time column
subwayData$Hour <- hour(subwayData$Time)
busData$Hour <- hour(busData$Time)

# Select relevant columns and remove rows with NA values
subwayData <- subwayData %>%
  select(Time, Date, Min.Delay, Hour) %>%
  na.omit() %>%
  filter(Min.Delay != 0) # Remove rows where Min.Delay is 0

busData <- busData %>%
  select(Time, Date, Min.Delay, Hour) %>%
  na.omit() %>%
  filter(Min.Delay != 0) # Remove rows where Min.Delay is 0

# Convert Date column to Date object
subwayData <- subwayData %>%
  mutate(Date = as.Date(Date))

busData <- busData %>%
  mutate(Date = as.Date(Date))

# Create the directory for analysis data if it doesn't exist
dir.create(here::here("./data/analysis_data"), showWarnings = FALSE)

# Write the cleaned data to new CSV files
write.csv(subwayData, here::here("./data/analysis_data/analysis_data.csv"), row.names = FALSE)
write.csv(busData, here::here("./data/analysis_data/analysis_data_bus.csv"), row.names = FALSE)
