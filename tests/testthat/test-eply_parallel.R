context("eply_parallel")

test_that("eply_parallel doesn't mangle order", {
  f = example.fun
  e = example.expr()
  e$mysplit = rep(1:3, length.out = nrow(e))
  w = example.with()
  os = Sys.info()[['sysname']]
  h = ifelse(os == "Windows", expect_error, I)
  for(i in 1:20){
    expect_equal(eply_parallel(f, e, w, .split = "mysplit"), 
                 eply_serial(f, e, w))
    h(expect_equal(eply_parallel(f, e, w, .split = "mysplit", .tasks = 2), 
                   eply_serial(f, e, w)))
    set.seed(i)
    e$mysplit = sample(1:2, size = nrow(e), replace = T)
  }
})
