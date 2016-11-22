context("meval")

test_that("meval() works.", {
  expect_equal(meval(), NULL)
  a1 = list("x", "y")
  a2 = unlist(a1)
  o = w = list(x = 1, y = 2)
  expect_equal(meval(a1, w), unlist(o))
  expect_equal(meval(a2, w), unlist(o))

  x = c("1+1", "2+2", "3+3")
  os = Sys.info()[['sysname']]
  h = ifelse(os == "Windows", expect_warning, I)
  h(expect_equal(meval(x, .tasks = 2), c("1+1" = 2, "2+2" = 4, "3+3" = 6)))
  h(expect_equal(meval(x, .tasks = 2), meval(x)))
})
  