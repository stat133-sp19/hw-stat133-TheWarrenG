# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

#title Check Probability
#description Checks whether the input prob is a valid probability
#param prob Probability that we check whether is valid (numeric)
#return Returns a logical vector of whether prob is a valid probability
check_prob <- function(prob) {
  if (prob < 0 || prob > 1) {
    stop('probability has to be a number between 0 and 1')
  }
  TRUE
}

#title Check Trials
#description Checks whether the input trials is valid
#param trials Number that we check whether is valid (numeric)
#return Returns a logical vector of whether trials is valid
check_trials <- function(trials) {
  if (trials < 0) {
    stop("Invalid trials value")
  }
  TRUE
}

#title Check Success
#description Checks whether the input success is valid
#param success Success that we check whether is valid (numeric)
#param trials Number of trials (numeric)
#return Returns a logical vector of whether success is valid
check_success <- function(success, trials) {
  if (success < 0 || success > trials) {
    stop("Invalid success value")
  }
  TRUE
}

#title Auxillary Mean
#description Computes the expected value of the binomial distribution
#param trials Number of trials in the binomial distribution (numeric)
#param prob Probability of success in the binomial distribution (numeric)
#return Expected value of binomial distribution
aux_mean <- function(trials, prob) {
  trials * prob
}

#title Auxillary Variance
#description Computes the variance of the binomial distribution
#param trials Number of trials in the binomial distribution (numeric)
#param prob Probability of success in the binomial distribution (numeric)
#return Variance of binomial distribution
aux_variance <- function(trials, prob) {
  trials * prob * (1 - prob)
}

#title Auxillary Mode
#description Computes the mode of the binomial distribution
#param trials Number of trials in the binomial distribution (numeric)
#param prob Probability of success in the binomial distribution (numeric)
#return Mode of binomial distribution
aux_mode <- function(trials, prob) {
  mode <- trials * prob + prob
  if (typeof(mode) == "double") {
    return(as.integer(mode))
  }
  mode
}

#title Auxillary Skewness
#description Computes the skewness of the binomial distribution
#param trials Number of trials in the binomial distribution (numeric)
#param prob Probability of success in the binomial distribution (numeric)
#return Skewness of binomial distribution
aux_skewness <- function(trials, prob) {
  (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
}

#title Auxillary Kurtosis
#description Computes the kurtosis of the binomial distribution
#param trials Number of trials in the binomial distribution (numeric)
#param prob Probability of success in the binomial distribution (numeric)
#return Kurtosis of binomial distribution
aux_kurtosis <- function(trials, prob) {
  (1 - 6 * prob * (1 - prob)) / (trials * prob * (1 - prob))
}

#' @title Binomial Coefficient
#' @description Calculates the binomial coefficient of a binomial distribution
#' @param n Number of trials in the binomial distribution (numeric)
#' @param k Number of successes in the binomial distribution (numeric)
#' @return Returns the binomial coefficient
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
bin_choose <- function(n, k) {
  if (k > n) {
    stop("k cannot be greater than n")
  }
  factorial(n) / (factorial(k) * factorial(n - k))
}
