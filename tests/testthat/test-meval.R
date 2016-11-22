context("meval")

test_that("meval() works.", {
  expect_equal(meval(), NULL)
  a1 = list("x", "y")
  a2 = unlist(a1)
  o = w = list(x = 1, y = 2)
  expect_equal(meval(a1, w), unname(unlist(o)))
  expect_equal(meval(a2, w), unname(unlist(o)))
  o = w = list(x = 1, y = list(z = 1, v = 2))
  expect_equal(meval(a1, w), unname(o))
  expect_equal(meval(a2, w), unname(o))
})
