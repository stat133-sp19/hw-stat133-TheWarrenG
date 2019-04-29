source("../../R/functions.R")

context("Test for checker functions")

test_that("check_prob works as expected", {
  x <- -0.5

  expect_error(check_prob(x), "probability has to be a number between 0 and 1")

  y <- 0

  expect_true(check_prob(y))
  expect_length(check_prob(y), 1)

  w <- 0.5

  expect_true(check_prob(w))
  expect_length(check_prob(w), 1)

  z <- 1

  expect_true(check_prob(z))
  expect_length(check_prob(z), 1)

  u <- 1.01

  expect_error(check_prob(x), "probability has to be a number between 0 and 1")
})

test_that("check_trials works as expected", {
  x <- -0.01

  expect_error(check_trials(x), "Invalid trials value")

  y <- 0

  expect_true(check_trials(y))
  expect_length(check_trials(y), 1)

  z <- 100

  expect_true(check_trials(z))
  expect_length(check_trials(z), 1)
})

test_that("check_success works as expected", {
  x <- -0.5

  expect_error(check_success(x, x), "Invalid success value")

  y <- 0

  expect_true(check_success(y, y))
  expect_length(check_success(y, y), 1)

  expect_error(check_success(x, y), "Invalid success value")
  expect_error(check_success(y, x), "Invalid success value")

  w <- 42
  z <- 100

  expect_true(check_success(w, z))
  expect_length(check_success(w, z), 1)

  expect_error(check_success(x, w), "Invalid success value")
  expect_error(check_success(w, x), "Invalid success value")

  expect_true(check_success(z, z))
  expect_length(check_success(z, z), 1)

  expect_error(check_success(x, z), "Invalid success value")
  expect_error(check_success(z, x), "Invalid success value")

  expect_true(check_success(c(y, w), z))
  expect_length(check_success(c(y, w), z), 1)

  expect_true(check_success(c(w, y, w), w))
  expect_length(check_success(c(w, y, w), w), 1)

  expect_error(check_success(c(x, y, w), z), "Invalid success value")
  expect_error(check_success(c(w, y), x), "Invalid success value")
})
