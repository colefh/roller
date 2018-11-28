context("Testing the Rolls constructor and all functions.")

fair_die <- device()
set.seed(123)
fair50 <- roll(fair_die, times = 50)

#testing the roll object:
expect_equal(fair50$sides, c(1,2))
expect_equal(fair50$prob, c(0.5,0.5))
expect_equal(fair50$total, 50)
expect_equal(length(fair50$rolls), 50)

#test for check_times:
expect_equal(check_times(50), TRUE)
expect_equal(check_times(101), TRUE)
expect_error(check_times(0))
expect_error(check_times(-1))
expect_error(check_times(1.1))

fair_die <- device(sides = 1:6, prob = rep(1/6, 6))
set.seed(123)
fair_50rolls <- roll(fair_die, times = 50)

expect_equal(names(fair_50rolls), c("rolls","sides","prob","total"))
expect_equal(length(fair_50rolls$rolls), 50)
expect_equal(fair_50rolls$sides, 1:6)
expect_equal(fair_50rolls$total, 50)

#errors in the roll call:
expect_error(roll(c(1,2), 10))
expect_error(roll(fair_die, 0))


set.seed(123)
fair_50rolls <- roll(fair_die, times = 50)
fair50_sum <- summary(fair_50rolls)
#testing summary:
expect_equal(class(fair50_sum), "summary.rolls")
expect_equal(names(fair50_sum), "freqs")
expect_equal(length(fair50_sum), 1)
expect_equal(sum(fair50_sum$freqs$prop), 1)
expect_equal(sum(fair50_sum$freqs$count), fair_50rolls$total)

set.seed(123)
fair_dev <- device(sides = letters[1:8], prob = rep(1/8, 8))
fair500 <- roll(fair_dev, times = 500)
#testing the extract function:
expect_equal(fair500[500], "h")

#testing the replace function:
fair500[500] <- "a"
expect_equal(fair500[500], "a")
expect_equal(length(fair500$rolls), 500)
expect_equal(length(fair500), 4)

#testing the add function:
fair600 <- fair500 + 100
expect_equal(length(fair600$rolls), 600)
expect_equal(fair600$total, 600)
expect_equal(fair600$sides, fair500$sides)
expect_equal(fair600$prob, fair500$prob)

