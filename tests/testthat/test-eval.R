context("eval")

test_that("Eval functions work.", {
  expect_equal(seval(), list())
  expect_equal(veval(), list())
  a = strings(x, y)
  o2 = w = list(x = 1, y = 2)
  o1 = unlist(o2)
  expect_equal(seval(a, w), o1)
  expect_equal(veval(a, w), o2)
})
