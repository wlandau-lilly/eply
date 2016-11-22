context("eply_parallel")

test_that("eply_parallel doesn't mangle order", {
  f = example.fun
  e = example.expr()
  w = example.with()
  os = Sys.info()[['sysname']]
  h = ifelse(os == "Windows", expect_warning, I)
  for(i in 1:20){
    set.seed(i)
    e$mysplit = sample(1:2, size = nrow(e), replace = T)
    h(expect_equal(eply_parallel(f, e, w, .split = "mysplit"), eply_serial(f, e, w)))
  }
})
