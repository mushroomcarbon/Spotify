#### Preamble ####
# Purpose: Downloads and saves the data from Spotify
# Author: Andrew Goh
# Date: 11 October 2024
# Contact: andrew.goh@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

library(dplyr)
library(tidyverse)

the_national <- get_artist_audio_features("the national")
saveRDS(the_national, "data/raw_data/the_national.rds")