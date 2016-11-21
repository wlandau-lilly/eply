context("quotes")

test_that("Function quotes() is correct.", {
  expect_equal(quotes(), "\"\"")
  expect_equal(quotes(strings(x, y)), c("\"x\"", "\"y\""))
})
