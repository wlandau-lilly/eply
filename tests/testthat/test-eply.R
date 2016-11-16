context("eply")

test_that("Eply works as expected.", {
  f = example.fun
  e = example.expr()
  expect_silent(o <- eply(f, e))
  expect_true(all(is.finite(o)))
  expect_equal(length(o), dim(e)[1])

  d = data.frame(
    x = c("1+1", "6+7"),
    y = c(2, 3)
  )
  f = function(x, y) x^y
  
  expect_silent(o <- eply(f, d))
  expect_true(all(is.finite(o)))
  expect_equal(length(o), dim(d)[1])
  expect_equal(unname(o), c(4, 2197))
})
