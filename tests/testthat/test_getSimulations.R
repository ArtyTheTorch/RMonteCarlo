context("Monte Carlo Simulations")
# a: Lower bounds
# b: Upper bounds
# c: Peak such that a <= c <= b
test_that("getSimulations returns a list", {
  lowerBounds <- 5
  upperBounds <- 20
  peakGuess <- 15
  numberOfSimulsations <- 1000
  expect_is(class(getSimulations(lowerBounds,upperBounds,peakGuess,numberOfSimulsations)),"character")
})