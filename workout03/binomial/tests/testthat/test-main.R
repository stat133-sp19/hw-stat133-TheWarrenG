source("../../R/functions.R")

context("Test for main functions")

test_that("bin_choose works as expected", {
  n <- 5
  k <- 2
  
  expect_equal(bin_choose(n, k), 10)
  expect_length(bin_choose(n, k), 1)
  
  k <- 0
  
  expect_equal(bin_choose(n, k), 1)
  expect_length(bin_choose(n, k), 1)
  
  k <- 1:3
  
  expect_identical(bin_choose(n, k), c(5, 10, 10))
  expect_length(bin_choose(n, k), 3)
  
  k <- 1:8
  
  expect_error(bin_choose(n, k), "successes cannot be greater than trials")
})

test_that("bin_probability works as expected", {
  trials <- 5
  success <- 2
  prob <- 0.5
  
  expect_equal(bin_probability(success, trials, prob), 0.3125)
  expect_length(bin_probability(success, trials, prob), 1)
  
  success <- 0:2
  
  expect_equal(bin_probability(success, trials, prob), c(0.03125, 0.15625, 0.31250))
  expect_length(bin_probability(success, trials, prob), 3)
  
  trials <- 100
  success <- 55
  prob <- 0.45
  
  expect_equal(bin_probability(success, trials, prob), 0.01075277)
  expect_length(bin_probability(success, trials, prob), 1)
  
  success <- 1:101
  
  expect_error(bin_probability(success, trials, prob), "successes cannot be greater than trials")
  
  success <- 55
  prob <- -101
  
  expect_error(bin_probability(success, trials, prob), "probability has to be a number between 0 and 1")
  
  prob <- 0.5
  trials <- -101
  
  expect_error(bin_probability(success, trials, prob), "Invalid trials value")
})

test_that("bin_distribution works as expected", {
  trials <- 5
  prob <- 0.5
  
  expected_df <- data.frame(success = 0:trials,
                            probability = dbinom(0:trials, trials, prob))
  class(expected_df) <- c("bindis", "data.frame")
  
  expect_equal(bin_distribution(trials, prob), expected_df)
  
  trials <- 100
  prob <- 0.45
  
  expected_df <- data.frame(success = 0:trials,
                            probability = dbinom(0:trials, trials, prob))
  class(expected_df) <- c("bindis", "data.frame")
  
  expect_equal(bin_distribution(trials, prob), expected_df)
  
  prob <- -101
  
  expect_error(bin_distribution(trials, prob), "probability has to be a number between 0 and 1")
  
  prob <- 0.5
  trials <- -101
  
  expect_error(bin_distribution(trials, prob), "Invalid trials value")
})

test_that("bin_cumulative works as expected", {
  trials <- 5
  prob <- 0.5
  
  expected_df <- data.frame(success = 0:trials,
                            probability = dbinom(0:trials, trials, prob),
                            cumulative = pbinom(0:trials, trials, prob))
  class(expected_df) <- c("bincum", "data.frame")
  
  expect_equal(bin_cumulative(trials, prob), expected_df)
  
  trials <- 100
  prob <- 0.45
  
  expected_df <- data.frame(success = 0:trials,
                            probability = dbinom(0:trials, trials, prob),
                            cumulative = pbinom(0:trials, trials, prob))
  class(expected_df) <- c("bincum", "data.frame")
  
  expect_equal(bin_cumulative(trials, prob), expected_df)
  
  prob <- -101
  
  expect_error(bin_cumulative(trials, prob), "probability has to be a number between 0 and 1")
  
  prob <- 0.5
  trials <- -101
  
  expect_error(bin_cumulative(trials, prob), "Invalid trials value")
})