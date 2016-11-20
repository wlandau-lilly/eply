# library(testthat); library(eply)
context("help_eply")

test_that("Function help_eply() runs correctly", {
  expect_output(help_eply())
})
