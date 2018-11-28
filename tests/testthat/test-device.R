library(testthat)
fair <- device()

#testing for a fair dice
expect_equal(check_prob(fair$prob), TRUE)
expect_equal(check_sides(fair$sides), TRUE)
expect_equal(check_lengths(fair$sides,fair$prob), TRUE)

#check_prob error tests:
expect_error(check_prob(c(1,2,3)))
expect_error(check_prob(c(0.5,0.4,0.2)))
expect_error(check_prob(c(-1,0,0,0,1,1)))
expect_error(check_prob(c()))
expect_error(check_prob(c("a","b")))

#check_sides error tests:
expect_error(check_sides(c(1,2,3,1)))
expect_error(check_prob(c()))

#check_length error tests:
expect_error(check_length(c(1,2), c(1,2,3)))

#is.device tests:
expect_equal(is.device(fair), TRUE)
expect_equal(is.device(c(1,2,3)), FALSE)

#testing the constructor:
expect_error(device( sides = c('a', 'b', 'c'),
                     prob = c(0.2, 0.8)))
expect_error(device( sides = c('a', 'b'),
                     prob = c(-1, 0.8)))
expect_error(device( sides = c('a', 'a'),
                     prob = c(0.2, 0.8)))



