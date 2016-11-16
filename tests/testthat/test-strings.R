context("strings")

test_that("Function strings() is correct.", {
  expect_equal(character(0), strings())
  expect_equal("1", strings(1))
  expect_equal("list(\"foo\", f(c(\"bar\", \"baz\")))", strings(list("foo", f(c("bar", "baz")))))
})
