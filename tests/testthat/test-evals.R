context("evals")

test_that("evals() works.", {
  expect_equal(evals(), NULL)
  a1 = list("x", "y")
  a2 = unlist(a1)
  o = w = list(x = 1, y = 2)
  expect_equal(evals(a1, w, T), unlist(o))
  expect_equal(evals(a2, w, T), unlist(o))
  expect_equal(evals(a1, w, F), o)
  expect_equal(evals(a2, w, F), o)
  x = c("1+1", "2+2", "3+3")
  expect_equal(evals(x), c("1+1" = 2, "2+2" = 4, "3+3" = 6))
})
