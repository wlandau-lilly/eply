context("eply")

test_that("Function eply parses input correctly.", {
  f = example.fun
  e = example.expr()
  w = example.with()
  expect_error(eply(.fun = f))
  expect_error(eply(.expr = e))
  expect_error(eply(.with = w))
  expect_error(eply(f, e))
  expect_error(eply(f, e, .tasks = 0))
  expect_error(eply(f, e, .split = "bla"))
})

test_that("Function eply uses .with correctly.", {
  f = function(x) return(x)
  d = data.frame(x = letters[1:2])
  expect_error(eply(f, d))
  expect_error(eply(f, d, .with = list(b = 2)))
  a = b = 1
  k = list(a = 3, b = 4)
  o = 3:4
  names(o) = rownames(d)
  expect_equal(eply(f, d, .with = k), o)
  e = new.env()
  e$a = 5
  e$b = 6
  o = 5:6
  names(o) = rownames(d)
  expect_equal(eply(f, d, .with = e), o)
})

test_that("Function eply gives correct answers.", {
  f = example.fun
  e = example.expr()
  w = example.with()
  expect_silent(o <- eply(f, e, w))
  expect_true(all(is.finite(o)))
  expect_equal(length(o), dim(e)[1])

  d = data.frame(
    x = c("1+1", "6+7"),
    y = c(2, 3)
  )
  f = function(x, y) x^y
  
  expect_silent(o <- eply(f, d, w))
  expect_true(all(is.finite(o)))
  expect_equal(length(o), dim(d)[1])
  o2 = c(4, 2197)
  names(o2) = rownames(d)
  expect_equal(o, o2)
})
