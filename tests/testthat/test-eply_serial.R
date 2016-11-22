context("eply_serial")

test_that("Function eply_serial works as expected.", {
  f = example.fun
  e = example.expr()
  w = example.with()
  expect_silent(o <- eply_serial(f, e, w))
  expect_true(all(is.finite(o)))
  expect_equal(length(o), dim(e)[1])

  d = data.frame(
    x = c("1+1", "6+7"),
    y = c(2, 3)
  )
  f = function(x, y) x^y
  
  expect_silent(o <- eply_serial(f, d, w))
  expect_true(all(is.finite(o)))
  expect_equal(length(o), dim(d)[1])
  expect_equal(o, c(4, 2197))
})
