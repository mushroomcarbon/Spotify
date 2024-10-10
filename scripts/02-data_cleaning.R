#### Preamble ####
# Purpose: Cleans the raw spotify data into an analysis dataset
# Author: Andrew Goh, Yisu Hou, Jiwon Choi, Xiaolu Ji
# Date: 10 October 2024
# Contact: andrew.goh@utoronto.ca
# License: MIT
# Pre-requisites: Need to have downloaded the data
# Any other information needed? None.

library(here)
library(lubridate)
library(dplyr)

# Load the data
data <- read_rds(here::here("data/raw_data/the_national.rds"))

# Ensure that variables of interest are doubles, removing rows if not
data <- data %>%
  filter(
    is.double(album_release_year),
    is.double(danceability),
    is.double(energy),
    is.double(instrumentalness),
    is.double(valence)
  )

# Save the cleaned data back to the .rds file
saveRDS(data, here::here("data/analysis_data/the_national_cleaned.rds"))
