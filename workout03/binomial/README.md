
<!-- README.md is generated from README.Rmd. Please edit that file -->
    ## Warning: package 'ggplot2' was built under R version 3.4.4

Overview
--------

`"binomial"` allows the user to experiment with different calculations and visualizations of a binomial random variable.

-   `bin_var()` creates a binomial random variable object (of class `"bin_var"`)
-   `bin_distribution()` produces a `"bindis"` object that displays the density of the binomial random variable in table format.
-   `bin_cumulative()` produces a `"bincum"` object that displays the cumulative binomial distribution in table format.
-   `plot()` method for a `"bindis"` and `"bincum"` object.
-   `summary()` method for a `"bin_var"` object.
-   `bin_mean()`, `bin_variance()`, `bin_mode()`, `bin_skewness()`, `bin_kurtosis()` for specific statistics.
-   `bin_probability()` for density function of binomial random variable.
-   `bin_choose()` for the binomial coefficient.

Motivation
----------

This package has been developed as an exercise for creating a simple R package.

Usage
-----

``` r
library(binomial)
#binomial random variable
bin_var <- bin_variable(trials = 5, prob = 0.5)
print(bin_var)
#> "Binomial variable"
#> 
#> Parameters
#> - number of trials: 5 
#> - prob of success : 0.5
# show summary
summary(bin_var)
#> "Summary Binomial"
#> 
#> Parameters
#> - number of trials: 5 
#> - prob of success : 0.5 
#> 
#> Measures
#> - mean    : 2.5 
#> - variance: 1.25 
#> - mode    : 3 
#> - skewness: 0 
#> - kurtosis: -0.4
# summary statistics
bin_mean(trials = 5, prob = 0.5)
#> [1] 2.5
bin_variance(trials = 5, prob = 0.5)
#> [1] 1.25
bin_mode(trials = 5, prob = 0.5)
#> [1] 3
bin_skewness(trials = 5, prob = 0.5)
#> [1] 0
bin_kurtosis(trials = 5, prob = 0.5)
#> [1] -0.4
# density function
bin_probability(success = 2, trials = 5, prob = 0.5)
#> [1] 0.3125
# binomial coefficient
bin_choose(n = 5, k = 2)
#> [1] 10
# Tables of density and cumulative binomial distribution
bin_dis <- bin_distribution(trials = 5, prob = 0.5)
bin_dis
#>   success probability
#> 1       0     0.03125
#> 2       1     0.15625
#> 3       2     0.31250
#> 4       3     0.31250
#> 5       4     0.15625
#> 6       5     0.03125
bin_cum <- bin_cumulative(trials = 5, prob = 0.5)
bin_cum
#>   success probability cumulative
#> 1       0     0.03125    0.03125
#> 2       1     0.15625    0.18750
#> 3       2     0.31250    0.50000
#> 4       3     0.31250    0.81250
#> 5       4     0.15625    0.96875
#> 6       5     0.03125    1.00000
#Plots of density and cumulative binomial distribution
plot(bin_dis)
```

``` r
plot(bin_cum)
```

