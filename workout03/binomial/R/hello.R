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

