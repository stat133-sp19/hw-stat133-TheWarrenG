% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{bin_probability}
\alias{bin_probability}
\title{Binomial Probability}
\usage{
bin_probability(success, trials, prob)
}
\arguments{
\item{success}{Number of successes in the binomial distribution (numeric)}

\item{trials}{Number of trials in the binomial distribution (numeric)}

\item{prob}{Probability of success in the binomial distribution (numeric)}
}
\value{
Returns the probability of k successes in n trials given probability p
}
\description{
Calculates probability of the successes in the trials given the probability
}
\examples{
bin_probability(success = 2, trials = 5, prob = 0.5)
bin_probability(success = 0:2, trials = 5, prob = 0.5)
bin_probability(success = 55, trials = 100, prob = 0.45)
}
