context("eply")

test_that("Function eply parses input correctly.", {
  f = example.fun
  e = example.expr()
  expect_error(eply(.fun = f))
  expect_error(eply(.expr = e))
  expect_error(eply(f, e, .tasks = 0))
  expect_error(eply(f, e, .split = "bla"))
})

test_that("Parallelism in function eply works.", {
  f = example.fun
  e = example.expr()
  expect_silent(o <- eply(f, e))
  os = Sys.info()[['sysname']]
  for(s in list("rep", c("y", "rep"))){
    if(os == "Windows"){
      expect_warning(o2 <- eply(f, e, .split = s, .tasks = 2))
    } else {
      expect_silent(o2 <- eply(f, e, .split = s, .tasks = 2))
    }
    expect_equal(o, o2)
  }
})
