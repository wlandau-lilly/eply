context("meval")

test_that("meval() works.", {
if(F){
  expect_equal(meval(), NULL)
  a1 = list("x", "y")
  a2 = unlist(a1)
  o = w = list(x = 1, y = 2)
  expect_equal(meval(a1, w), unname(unlist(o)))
  expect_equal(meval(a2, w), unname(unlist(o)))
  o = w = list(x = 1, y = list(z = 1, v = 2))
  expect_equal(meval(a1, w), unname(o))
  expect_equal(meval(a2, w), unname(o))
  x = c("1+1", "2+2", "3+3")
  expect_equal(meval(x, .tasks = 2), c(2, 4, 6)) 
  x = c("1+1", "1+slkdfjlkj")
  expect_error(meval(x, .tasks = 1))
  expect_warning(meval(x, .tasks = 2))
}
})
