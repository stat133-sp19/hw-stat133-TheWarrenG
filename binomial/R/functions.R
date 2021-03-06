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

library(ggplot2)

#title Check Probability
#description Checks whether the input prob is a valid probability
#param prob Probability that we check whether is valid (numeric)
#return Returns a logical vector of whether prob is a valid probability
#examples
#check_prob(0)
#check_prob(0.5)
#check_prob(1)
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
#examples
#check_trials(0)
#check_trials(100)
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
#examples
#check_success(0, 0)
#check_success(0, 100)
#check_success(42, 200)
#check_success(42, 42)
check_success <- function(success, trials) {
  success <- (success < 0 || success > trials)
  if (sum(success) > 0) {
    stop("Invalid success value")
  }
  TRUE
}

#title Auxillary Mean
#description Computes the expected value of the binomial distribution
#param trials Number of trials in the binomial distribution (numeric)
#param prob Probability of success in the binomial distribution (numeric)
#return Expected value of binomial distribution
#examples
#aux_mean(100, 0.5)
#aux_mean(42, 0.1)
aux_mean <- function(trials, prob) {
  trials * prob
}

#title Auxillary Variance
#description Computes the variance of the binomial distribution
#param trials Number of trials in the binomial distribution (numeric)
#param prob Probability of success in the binomial distribution (numeric)
#return Variance of binomial distribution
#examples
#aux_variance(100, 0.5)
#aux_variance(42, 0.1)
aux_variance <- function(trials, prob) {
  trials * prob * (1 - prob)
}

#title Auxillary Mode
#description Computes the mode of the binomial distribution
#param trials Number of trials in the binomial distribution (numeric)
#param prob Probability of success in the binomial distribution (numeric)
#return Mode of binomial distribution
#examples
#aux_mode(100, 0.5)
#aux_mode(42, 0.1)
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
#examples
#aux_skewness(100, 0.5)
#aux_skewness(42, 0.1)
aux_skewness <- function(trials, prob) {
  (1 - 2 * prob) / sqrt(trials * prob * (1 - prob))
}

#title Auxillary Kurtosis
#description Computes the kurtosis of the binomial distribution
#param trials Number of trials in the binomial distribution (numeric)
#param prob Probability of success in the binomial distribution (numeric)
#return Kurtosis of binomial distribution
#examples
#aux_kurtosis(100, 0.5)
#aux_kurtosis(42, 0.1)
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
  if (sum(k > n) > 0) {
    stop("successes cannot be greater than trials")
  }
  factorial(n) / (factorial(k) * factorial(n - k))
}

#' @title Binomial Probability
#' @description Calculates probability of the successes in the trials given the probability
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param success Number of successes in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Returns the probability of k successes in n trials given probability p
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  bin_choose(trials, success) * prob ^ success * (1 - prob) ^ (trials - success)
}

#' @title Binomial Distribution
#' @description Calculates a binomial distribution table
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Returns a dataframe of the binomial distribution
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
bin_distribution <- function(trials, prob) {
  successes <- 0:trials
  probs <- bin_probability(successes, trials, prob)
  bin_dist <- data.frame(success = successes,
                         probability = probs)
  class(bin_dist) <- c("bindis", "data.frame")
  bin_dist
}

#' @export
plot.bindis <- function(x) {
  ggplot(data = x, aes(x = success, y = probability)) +
    geom_col()
}

#' @title Binomial Cumulative Table
#' @description Calculates a binomial distribution table with cumulative distributions
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Returns a dataframe of the binomial distribution with cumulative distribution
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative <- function(trials, prob) {
  successes <- 0:trials
  probs <- bin_probability(successes, trials, prob)
  cum_prob <- cumsum(probs)
  bin_dist <- data.frame(success = successes,
                         probability = probs,
                         cumulative = cum_prob)
  class(bin_dist) <- c("bincum", "data.frame")
  bin_dist
}

#' @export
plot.bincum <- function(x) {
  ggplot(data = x, aes(x = success, y = cumulative)) +
    geom_line() +
    xlab("Successes") +
    ylab("Cumulative Probability")
}

#' @title Binomial Random Variable
#' @description Create a Binomial Random Variable
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return A Binomial Random Variable object with attributes trials and probability
#' @export
#' @examples
#' bin_variable(trials = 5, prob = 0.5)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bin_var <- list(trials = trials, prob = prob)
  class(bin_var) <- c("binvar", "list")
  bin_var
}

#' @export
print.binvar <- function(x) {
  trials <- x$trials
  prob <- x$prob
  cat('"Binomial variable"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", trials, "\n")
  cat("- prob of success :", prob)
}


#' @export
summary.binvar <- function(x) {
  trials <- x$trials
  prob <- x$prob
  summary_binvar <- list(trials = trials,
                         prob = prob,
                         mean = aux_mean(trials, prob),
                         variance = aux_variance(trials, prob),
                         mode = aux_mode(trials, prob),
                         skewness = aux_skewness(trials, prob),
                         kurtosis = aux_kurtosis(trials, prob))
  class(summary_binvar) <- c("summary.binvar", "list")
  summary_binvar
}

#' @export
print.summary.binvar <- function(x) {
  cat('"Summary Binomial"\n\n')
  cat("Parameters\n")
  cat("- number of trials:", x$trials, "\n")
  cat("- prob of success :", x$prob, "\n\n")
  cat("Measures\n")
  cat("- mean    :", x$mean, "\n")
  cat("- variance:", x$variance, "\n")
  cat("- mode    :", x$mode, "\n")
  cat("- skewness:", x$skewness, "\n")
  cat("- kurtosis:", x$kurtosis)
}

#' @title Binomial Mean
#' @description Computes the expected value of the binomial distribution
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Expected value of binomial distribution
#' @export
#' @examples 
#' bin_mean(trials = 5, prob = 0.5)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title Binomial Variance
#' @description Computes the variance of the binomial distribution
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Variance of binomial distribution
#' @export
#' @examples 
#' bin_variance(trials = 5, prob = 0.5)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title Binomial Mode
#' @description Computes the mode of the binomial distribution
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Mode of binomial distribution
#' @export
#' @examples 
#' bin_mode(trials = 5, prob = 0.5)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title Binomial Skewness
#' @description Computes the skewness of the binomial distribution
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Skewness of binomial distribution
#' @export
#' @examples 
#' bin_skewness(trials = 5, prob = 0.5)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}

#' @title Binomial Kurtosis
#' @description Computes the kurtosis of the binomial distribution
#' @param trials Number of trials in the binomial distribution (numeric)
#' @param prob Probability of success in the binomial distribution (numeric)
#' @return Kurtosis of binomial distribution
#' @export
#' @examples 
#' bin_kurtosis(trials = 5, prob = 0.5)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}
