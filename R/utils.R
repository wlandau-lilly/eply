# serial version of eply
eply_serial = function(.fun, .expr, .with = sys.frame(sys.nframe())){
  subset(.expr, select = formalArgs(.fun)) %>%
  apply(1, function(x){
    .args = eval_text(x, .with = .with)
    do.call(.fun, .args)
  }) %>%
  unname
}

# evaluate expressions in a character vector
eval_text = Vectorize(FUN = function(x, .with = sys.frame(sys.nframe())){
   eval(parse(text = x), envir = .with)
}, vectorize.arg = "x", SIMPLIFY = FALSE)

# TRUE if serial eply and FALSE if parallel via mclapply
is_serial = function(.expr, .split = NULL, .tasks = 1,
  .os = Sys.info()[['sysname']]){

  # Sanitize individual arguments.
  if(.tasks < 1 | !is.numeric(.tasks))
    stop(".tasks must be a number at least 1.")
  if(!all(.split %in% colnames(.expr)))
    stop(".split must be a subset of colnames(.expr).")

  # Resolve conflicts.
  if(.tasks > 1 & !length(.split)){
    warning(".tasks > 1, but .split is empty. Executing serially.")
    .tasks = 1
  } else if(.tasks <= 1 & length(.split) > 0){
    warning(".split is nonempty, but .tasks is 1. Executing serially.")
  }

  # Disable parallelism on Windows.
  if(.tasks > 1 & .os == "Windows"){
    warning("Parallel execution not supported on Windows. Executing serially.")
    .tasks = 1
  }

  .tasks <= 1
}
