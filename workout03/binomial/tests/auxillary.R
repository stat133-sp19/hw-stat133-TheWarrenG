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
})
