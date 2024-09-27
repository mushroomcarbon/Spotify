#### Preamble ####
# Purpose: Sanity check of the data
# Author: Andrew Goh
# Date: 19 September 2024
# Contact: andrew.goh@utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None.


#### Workspace setup ####
library(tidyverse)
library(testthat)

# test simulated data
data <- read_csv(here::here("data/raw_data/simulated.csv"))

# Convert Date column to Date format
data$Date <- as.Date(data$Date)

# Test 1: Check if all dates are within 2022-2023
test_that("All dates are within 2022-2023", {
  expect_true(all(data$Date >= as.Date("2022-01-01") & data$Date <= as.Date("2023-12-31")))
})

# Test 2: Check if all Min.Delay values are non-negative
test_that("No negative values in Min.Delay", {
  expect_true(all(data$Min.Delay >= 0))
})

# Test 3: Check for any missing values in the data
test_that("No missing values (NA) in the dataset", {
  expect_false(any(is.na(data)))
})

# test raw data
data <- read_csv(here::here("data/raw_data/raw_data.csv"))

# Convert Date column to Date format
data$Date <- as.Date(data$Date)

# Test 1: Check if all dates are within 2022-2023
test_that("All dates are within 2022-2023", {
  expect_true(all(data$Date >= as.Date("2022-01-01") & data$Date <= as.Date("2023-12-31")))
})

# Test 2: Check if all Min.Delay values are non-negative
test_that("No negative values in Min.Delay", {
  expect_true(all(data$"Min Delay" >= 0))
})

# Test 3: Check for any missing values in the data
test_that("No missing values (NA) in the dataset", {
  expect_false(any(is.na(data)))
})

# test raw data for buses
data <- read_csv(here::here("data/raw_data/raw_data_bus.csv"))

# Convert Date column to Date format
data$Date <- as.Date(data$Date)

# Test 1: Check if all dates are within 2022-2023
test_that("All dates are within 2022-2023", {
  expect_true(all(data$Date >= as.Date("2022-01-01") & data$Date <= as.Date("2023-12-31")))
})

# Test 2: Check if all Min.Delay values are non-negative
test_that("No negative values in Min.Delay", {
  expect_true(all(data$"Min Delay" >= 0))
})

# Test 3: Check for any missing values in the data
test_that("No missing values (NA) in the dataset", {
  expect_false(any(is.na(data)))
})

# test cleaned data
data <- read_csv(here::here("data/analysis_data/analysis_data.csv"))

# Convert Date column to Date format
data$Date <- as.Date(data$Date)

# Test 1: Check if all dates are within 2022-2023
test_that("All dates are within 2022-2023", {
  expect_true(all(data$Date >= as.Date("2022-01-01") & data$Date <= as.Date("2023-12-31")))
})

# Test 2: Check if all Min.Delay values are non-negative
test_that("No negative values in Min.Delay", {
  expect_true(all(data$Min.Delay >= 0))
})

# Test 3: Check for any missing values in the data
test_that("No missing values (NA) in the dataset", {
  expect_false(any(is.na(data)))
})

# test cleaned data for buses
data <- read_csv(here::here("data/analysis_data/analysis_data_bus.csv"))

# Convert Date column to Date format
data$Date <- as.Date(data$Date)

# Test 1: Check if all dates are within 2022-2023
test_that("All dates are within 2022-2023", {
  expect_true(all(data$Date >= as.Date("2022-01-01") & data$Date <= as.Date("2023-12-31")))
})

# Test 2: Check if all Min.Delay values are non-negative
test_that("No negative values in Min.Delay", {
  expect_true(all(data$Min.Delay >= 0))
})

# Test 3: Check for any missing values in the data
test_that("No missing values (NA) in the dataset", {
  expect_false(any(is.na(data)))
})
