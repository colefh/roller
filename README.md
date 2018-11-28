---
output:
  github_document:
    html_preview: false
---




## Overview

`"roller"` is an [R](http://www.r-project.org/) package 
that allows us to simulate rolling a die/device.

* `device()` creates a dice object (of class `"device"`)
* `roll()` rolls a device object, yielding a `rolls` object.
* `plot()` method for a `"rolls"` object to plot frequencies of each side rolled.
* `summary()` method for a `"rolls"` object gives a frequency table of the sides rolled.
* `"["` extract method for a `"rolls"` object extracts the element at the nth roll.
* `"[<-"` method allows us to change certain rolls outcomes.
* `"+"` method adds rolls to an already-rolled rolls object.


## Motivation

This package has been created to satisfy a homework problem, and also to learn the tools necessary to create a fully functional R package.


## Installation

Install the development version from GitHub via the package `"devtools"`:


```r
# development version from GitHub:
#install.packages("devtools") 
# install "roller" (without vignettes)
#devtools::install_github("stat133-f18/hw-stat133-colefh/workout3/roller")
# install "roller" (with vignettes)
devtools::install_github("colefh/roller", build_vignettes = TRUE)
#> Skipping install of 'roller' from a github remote, the SHA1 (ac5d1c6d) has not changed since last install.
#>   Use `force = TRUE` to force installation
```


## Usage


```r
#install.packages("roller")
library(roller)
# default die
device1 <- device(sides = 1:6, prob = rep(1/6,6))
device1
#> object "device"
#> 
#> "1", p = 0.166666666666667 
#> "2", p = 0.166666666666667 
#> "3", p = 0.166666666666667 
#> "4", p = 0.166666666666667 
#> "5", p = 0.166666666666667 
#> "6", p = 0.166666666666667

# 1 roll of device1
roll(device1, times = 1)
#> object "rolls"
#> 
#> $rolls
#> [1] 4

# 10 rolls of device1
roll10 <- roll(device1, times = 10)
roll10
#> object "rolls"
#> 
#> $rolls
#>  [1] 2 6 5 2 1 5 6 1 1 6

# summary
summary(roll10)
#> summary "rolls"
#> 
#>   side count prop
#> 1    1     3  0.3
#> 2    2     2  0.2
#> 3    3     0  0.0
#> 4    4     0  0.0
#> 5    5     2  0.2
#> 6    6     3  0.3

# 100 rolls
roll100 <- roll(device1, times = 100)

# summary
summary(roll100)
#> summary "rolls"
#> 
#>   side count prop
#> 1    1    12 0.12
#> 2    2    16 0.16
#> 3    3    21 0.21
#> 4    4    16 0.16
#> 5    5    18 0.18
#> 6    6    17 0.17

# plot
plot(roll100)
```

![plot of chunk unnamed-chunk-41](README-unnamed-chunk-41-1.png)

```r

# extract
roll100[100]
#> [1] 1

# change
roll100[100]<- 1
roll100[100]
#> [1] 1
roll100[100]<- 2
roll100[100]
#> [1] 2

# add (+)
roll200 <- roll100 + 100
roll200
#> object "rolls"
#> 
#> $rolls
#>   [1] 5 5 3 2 4 4 4 3 3 4 6 3 2 2 6 4 6 2 2 2 6 6 1 5 3 3 6 6 3 6 1 5 5 1 1
#>  [36] 5 2 6 4 4 3 3 4 1 3 5 3 3 6 3 2 2 1 5 2 5 5 6 6 5 6 6 4 3 5 3 6 4 2 1
#>  [71] 3 4 5 5 3 2 1 5 6 1 5 4 2 1 5 3 4 3 4 3 2 2 6 3 2 1 4 4 5 2 3 5 6 4 2
#> [106] 5 2 3 6 1 6 2 4 6 6 5 2 5 4 6 2 3 1 2 1 4 1 1 4 6 4 1 2 2 6 5 4 1 3 5
#> [141] 2 6 4 6 3 1 4 5 2 1 1 2 4 3 1 5 2 3 3 5 3 2 2 6 1 3 2 3 5 4 6 3 5 2 3
#> [176] 6 6 5 5 2 2 1 2 3 1 5 3 5 2 2 6 2 5 1 2 1 2 6 4 5

# summary
summary(roll200)
#> summary "rolls"
#> 
#>   side count  prop
#> 1    1    27 0.135
#> 2    2    41 0.205
#> 3    3    36 0.180
#> 4    4    28 0.140
#> 5    5    35 0.175
#> 6    6    33 0.165
```
