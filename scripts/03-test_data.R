#### Preamble ####
# Purpose: Sanity check of the data
# Author: Andrew Goh
# Date: 10 October 2024
# Contact: andrew.goh@utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)

# test data from Spotify
data <- read_rds(here::here("data/the_national.rds"))

# test for missing values in the dataset
any(is.na(data))

# test whether variables of interest are doubles
is.double(data$album_release_year)
is.double(data$danceability)
is.double(data$energy)
is.double(data$instrumentalness)
is.double(data$valence)

