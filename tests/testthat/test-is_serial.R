context("is_serial")

test_that("Function is_serial is correct.", {
  expect_true(is_serial())
  expect_true(is_serial(.split = character(0)))
  expect_true(is_serial(.tasks = 1))
  expect_true(is_serial(.split = NULL, .tasks = 1))
  
  expect_warning(o <- is_serial(.tasks = 2))
  expect_true(o)
  expect_warning(o <- is_serial(.tasks = 2, .split = NULL))
  expect_true(o)
  
  expect_warning(o <- is_serial(.split = "y"))
  expect_true(o)
  expect_warning(o <- is_serial(.split = "y", .tasks = 1))
  expect_true(o)  
  
  expect_warning(o <- is_serial(.split = "y", .tasks = 2, .os = "Windows"))
  expect_true(o)
  expect_false(is_serial(.split = "y", .tasks = 2, .os = "Linux"))
})
