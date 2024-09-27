#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Andrew Goh
# Date: 27 September 2024
# Contact: andrew.goh@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

library(opendatatoronto)
library(dplyr)
library(tidyverse)

#---------------subway data:----------------#

# get package
package <- show_package("996cfe8d-fb35-40ce-b569-698d51fc683b")

# get all resources for this package
resources <- list_package_resources("996cfe8d-fb35-40ce-b569-698d51fc683b")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c("csv", "geojson"))
data <- filter(resources, row_number() == 9) %>%
  get_resource()
data2 <- filter(resources, row_number() == 10) %>%
  get_resource()
# merge 2022 and 2023 data into one set
data <- rbind(data, data2)
# save into csv
write_csv(data, "data/raw_data/raw_data.csv")

#---------------bus data:----------------#

# do the same for bus data: get data
package <- show_package("e271cdae-8788-4980-96ce-6a5c95bc6618")
# identify resources
resources <- list_package_resources("e271cdae-8788-4980-96ce-6a5c95bc6618")
# get data
data <- filter(resources, row_number() == 10) %>%
  get_resource()
data2 <- filter(resources, row_number() == 11) %>%
  get_resource()
# merge
data <- rbind(data, data2)
# save
write_csv(data, "data/raw_data/raw_data_bus.csv")
