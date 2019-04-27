source("../../R/functions.R")

context("Test for auxillary functions")

test_that("aux_mean works as expected", {
  x <- 100
  y <- 0.2
  z <- 0.5
  w <- 0.8

  expect_equal(aux_mean(x, y), 20)
  expect_length(aux_mean(x, y), 1)

  expect_equal(aux_mean(x, z), 50)
  expect_length(aux_mean(x, z), 1)

  expect_equal(aux_mean(x, w), 80)
  expect_length(aux_mean(x, w), 1)

  v <- 42

  expect_equal(aux_mean(v, y), 8.4)
  expect_length(aux_mean(v, y), 1)

  expect_equal(aux_mean(v, z), 21)
  expect_length(aux_mean(v, z), 1)

  expect_equal(aux_mean(v, w), 33.6)
  expect_length(aux_mean(v, w), 1)
})

test_that("aux_variance works as expected", {
  x <- 100
  y <- 0.2
  z <- 0.5
  w <- 0.8
  
  expect_equal(aux_variance(x, y), 16)
  expect_length(aux_variance(x, y), 1)
  
  expect_equal(aux_variance(x, z), 25)
  expect_length(aux_variance(x, z), 1)
  
  expect_equal(aux_variance(x, w), 16)
  expect_length(aux_variance(x, w), 1)
  
  v <- 42
  
  expect_equal(aux_variance(v, y), 6.72)
  expect_length(aux_variance(v, y), 1)
  
  expect_equal(aux_variance(v, z), 10.5)
  expect_length(aux_variance(v, z), 1)
  
  expect_equal(aux_variance(v, w), 6.72)
  expect_length(aux_variance(v, w), 1)
})

test_that("aux_mode works as expected", {
  x <- 100
  y <- 0.2
  z <- 0.5
  w <- 0.8
  
  expect_equal(aux_mode(x, y), 20)
  expect_length(aux_mode(x, y), 1)
  
  expect_equal(aux_mode(x, z), 50)
  expect_length(aux_mode(x, z), 1)
  
  expect_equal(aux_mode(x, w), 80)
  expect_length(aux_mode(x, w), 1)
  
  v <- 42
  
  expect_equal(aux_mode(v, y), 8)
  expect_length(aux_mode(v, y), 1)
  
  expect_equal(aux_mode(v, z), 21)
  expect_length(aux_mode(v, z), 1)
  
  expect_equal(aux_mode(v, w), 34)
  expect_length(aux_mode(v, w), 1)
})

test_that("aux_skewness works as expected", {
  x <- 100
  y <- 0.2
  z <- 0.5
  w <- 0.8
  
  expect_equal(aux_skewness(x, y), 0.15)
  expect_length(aux_skewness(x, y), 1)
  
  expect_equal(aux_skewness(x, z), 0)
  expect_length(aux_skewness(x, z), 1)
  
  expect_equal(aux_skewness(x, w), -0.15)
  expect_length(aux_skewness(x, w), 1)
  
  v <- 42
  
  expect_equal(aux_skewness(v, y), 0.23145502494)
  expect_length(aux_skewness(v, y), 1)
  
  expect_equal(aux_skewness(v, z), 0)
  expect_length(aux_skewness(v, z), 1)
  
  expect_equal(aux_skewness(v, w), -0.23145502494)
  expect_length(aux_skewness(v, w), 1)
})

test_that("aux_kurtosis works as expected", {
  x <- 100
  y <- 0.2
  z <- 0.5
  w <- 0.8
  
  expect_equal(aux_kurtosis(x, y), 0.0025)
  expect_length(aux_kurtosis(x, y), 1)
  
  expect_equal(aux_kurtosis(x, z), -0.02)
  expect_length(aux_kurtosis(x, z), 1)
  
  expect_equal(aux_kurtosis(x, w), 0.0025)
  expect_length(aux_kurtosis(x, w), 1)
  
  v <- 42
  
  expect_equal(aux_kurtosis(v, y), 0.005952381)
  expect_length(aux_kurtosis(v, y), 1)
  
  expect_equal(aux_kurtosis(v, z), -0.04761905)
  expect_length(aux_kurtosis(v, z), 1)
  
  expect_equal(aux_kurtosis(v, w), 0.005952381)
  expect_length(aux_kurtosis(v, w), 1)
})