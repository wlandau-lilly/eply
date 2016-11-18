context("is_serial")

test_that("Function is_serial is correct.", {
  e = example.expr()
  expect_error(is_serial())
  expect_error(is_serial(e, .split = "bla"))
  expect_error(is_serial(e, .tasks = "bla"))
  expect_error(is_serial(e, .tasks = 0))
  
  expect_true(is_serial(.expr = e))
  expect_true(is_serial(.expr = e, .split = character(0)))
  expect_true(is_serial(.expr = e, .tasks = 1))
  expect_true(is_serial(.expr = e, .split = NULL, .tasks = 1))
  
  expect_warning(o <- is_serial(e, .tasks = 2))
  expect_true(o)
  expect_warning(o <- is_serial(e, .tasks = 2, .split = NULL))
  expect_true(o)
  
  expect_warning(o <- is_serial(e, .split = "y"))
  expect_true(o)
  expect_warning(o <- is_serial(e, .split = "y", .tasks = 1))
  expect_true(o)  
  
  expect_warning(o <- is_serial(e, .split = "y", .tasks = 2, .os = "Windows"))
  expect_true(o)
  expect_false(is_serial(e, .split = "y", .tasks = 2, .os = "Linux"))
})
