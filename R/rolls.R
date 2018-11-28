library(roxygen2)
#' @title Roll a device
#' @description Creates an object of class \code{"roll"}
#' @param device object of class \code{"device"}
#' @param times number of rolls
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{rolls}{vector of rolls}
#' @return \item{sides}{vector of device \code{"sides"}}
#' @return \item{prob}{vector of device \code{"prob"}}
#' @return \item{total}{total number of rolls}
#' @export
#' @examples
#' fair_die <- device()
#'
#' # roll a fair dice:
#' roll(fair_die, times = 50)
#'
roll <- function(device, times = 1) {
  if (!is(device, 'device')) {
    stop("Device is not of class 'device'")
  }
  check_times(times)
  sides <- device$sides
  prob <- device$prob
  roll_s <- sample(sides, times, prob, replace = TRUE)
  total <- times
  rv <- list(rolls = roll_s, sides = sides, prob = prob, total = total)
  class(rv) <- "rolls"
  return(rv)
}

#a private function to test times
#' @export
check_times <- function(times) {
  if (times < 1 | times %% 1 != 0) {
    stop("Times must be a positive integer greater than or equal to 1")
  }
  TRUE
}

#private function to display the class of the object and the generated rolls
#' @export
print.rolls <- function(x, ...) {
  cat('object "rolls"\n\n')
  cat('$rolls\n')
  print(x$rolls)
  invisible(x)
}


#' @title Summary for rolls (summary.rolls)
#' @description returns an object "summary.rolls" which is a list of a data frame
#' describing the sides, count and proportion or the rolled device
#' @param rolled a rolls object
#' @return a summary.rolls object containing data frame of side, count, and prop
#' @export
summary.rolls <- function(rolled) {
  side <- rolled$sides
  counter <- rep(0,length(rolled$sides))
  names(counter) <- side
  for (r in rolled$rolls) {
    counter[r] = counter[r] + 1
  }
  prop <- counter / rolled$total
  rv_list <- list(freqs = data.frame("side" = side, "count" = counter,
                                     "prop" = prop))
  names(rv_list$freqs) <- c("side", "count", "prop")
  row.names(rv_list$freqs) <- seq(1, length(rv_list$freqs$side),1)
  class(rv_list) <- "summary.rolls"
  return(rv_list)
}

#private function to display the class of the summary.rolls object
#' @export
print.summary.rolls <- function(x, ...) {
  cat('summary "rolls"\n\n')
  print(x$freqs)
  invisible(x)
}


#' @title Plot for rolls
#' @description plots the frequencies of a rolls object
#' @param rolled a "rolls" object
#' @return a plot of sides and their frequencies
#' @export

plot.rolls <- function(rolled) {
  summary_r <- summary(rolled)$freqs
  barplot(summary_r$prop, names.arg = summary_r$side,
          xlab = "sides of device", ylab = "relative frequencies",
          main = paste("Relative Frequencies in a series of",
                       rolled$total, "rolls"))
}

#' @title Extraction for rolls
#' @description extracts objects from a "rolls" object
#' @param rolled a rolls objectsumm
#' @param n an index
#' @return the item at nth index
#' @export
"[.rolls" <- function(rolled, n) {
  return(rolled$rolls[n])
}

#' @title Replacement for rolls
#' @description replaces a value of a given roll
#' @param rolled a rolls object
#' @param index an index of roll to replace
#' @param value an item to replace it with
#' @return the updated rolled object
#' @export
"[<-.rolls" <- function(rolled, index, value) {
  rolled$rolls[index] <- value
  return(rolled)
}

#' @title Adding  rolls
#' @description adds more rolls
#' @param rolled a rolls object
#' @param n a number of rolls to add
#' @return the updated rolls object
#' @export
"+.rolls" <- function(rolled, n) {
  rolled$rolls <- c(rolled$rolls, sample(rolled$sides, n,
                                         rolled$prob, replace = TRUE))
  rolled$total <- rolled$total + n
  return(rolled)
}
