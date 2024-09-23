#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Rohan Alexander
# Date: 19 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####

library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("996cfe8d-fb35-40ce-b569-698d51fc683b")

# get all resources for this package
resources <- list_package_resources("996cfe8d-fb35-40ce-b569-698d51fc683b")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(resources, row_number()==10) %>% 
  get_resource()


#### Save data ####
write_csv(data, "data/raw_data/raw_data.csv") 
