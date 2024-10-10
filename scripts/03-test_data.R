#### Preamble ####
# Purpose: Sanity check of the data
# Author: Andrew Goh, Yisu Hou, Jiwon Choi
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



# plot of danceability over time
ggplot(data, aes(x = album_release_year, y = danceability)) +
  geom_point(alpha = 0.7, color = "black") + 
  stat_summary(fun = mean, geom = "line", color = "green", size = 1.2) + 
  labs(
    title = "Danceability Over Album Release Years",
    x = "Album Release Year",
    y = "Danceability"
  ) +
  theme_minimal()

# plot of energy over time
ggplot(data, aes(x = album_release_year, y = energy)) +
  geom_point(alpha = 0.7, color = "black") +
  stat_summary(fun = mean, geom = "line", color = "blue", size = 1.2) +
  labs(
    title = "Energy Over Album Release Years",
    x = "Album Release Year",
    y = "Energy"
  ) +
  theme_minimal()

# plot of instrumentalness over time
ggplot(data, aes(x = album_release_year, y = instrumentalness)) +
  geom_point(alpha = 0.7, color = "black") +
  stat_summary(fun = mean, geom = "line", color = "red", size = 1.2) +
  labs(
    title = "Instrumentalness Over Album Release Years",
    x = "Album Release Year",
    y = "Instrumentalness"
  ) +
  theme_minimal()

# plot of valence over time
ggplot(data, aes(x = album_release_year, y = valence)) +
  geom_point(alpha = 0.7, color = "black") +
  stat_summary(fun = mean, geom = "line", color = "orange", size = 1.2) +
  labs(
    title = "Valence Over Album Release Years",
    x = "Album Release Year",
    y = "Valence"
  ) +
  theme_minimal()


