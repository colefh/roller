#' @title device
#' @description Creates an object of class \code{"device"}
#' @param sides vector of coin sides (k >= 2 elements)
#' @param prob vector of side probabilities
#' @return an object of class \code{"device"}
#' @seealso \code{\link{roll}}
#' @export
#' @examples
#' # default
#' device1 <- device()
#'
#' # another
#'weird_die <- device(sides = c("i", "ii", "iii", "iv"),
#'prob = rep(1/4,4))
#'
#' # loaded die
#' loaded_die <- device(sides = 1:6, rep = c(0.075,0.1,0.125,0.15,0.2,0.35))
#'

device <- function(sides = c(1,2), prob = c(0.5,0.5)) {
  check_sides(sides)
  check_prob(prob)
  check_lengths(sides, prob)
  dev <- list(sides = sides, prob = prob)
  class(dev) <- "device"
  return(dev)
}

# private function to check the sides vector
#' @export
check_sides <- function(sides) {
  if (length(sides) < 1) {
    stop("Sides must be a vector with one or more elements")
  }
  if (any(duplicated(sides))) {
    stop("Sides must not have any duplicated elements")
  }
  TRUE
}

#private function to check the prob vector
#' @export
check_prob <- function(prob) {
  if (!is.numeric(prob)) {
    stop("Prob must be a numeric vector")
  }
  if (length(prob) < 1) {
    stop("Prob must have one or more elements")
  }
  if (any(is.na(prob))) {
    stop("Prob cannot contain missing values")
  }
  if (any(prob < 0) | any(prob > 1)) {
    stop("Prob must contain only valid probabilities")
  }
  if (sum(prob) != 1) {
    stop("The elements of prob must sum to 1")
  }
  TRUE
}

#private function to check that the lengths of sides and prob are the same
#' @export
check_lengths <- function(sides, prob) {
  if (length(sides) != length(prob)) {
    stop("Sides and prob must have the same length")
  }
  TRUE
}

#private function to print class and display of device in a table
#' @export
print.device <- function(x, ...) {
  cat('object "device"\n\n')
  for (i in 1:length(x$sides)) {
    cat(sprintf('"%s", p = %s', x$sides[i], x$prob[i]), "\n")
  }
  invisible(x)
}

#private function to test if an input is a device
#' @rdname device
#' @param x an R object
#' @export
is.device <- function(x) {
  is(x, 'device')
}
