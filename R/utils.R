# vectorized eval-parse
veval = Vectorize(FUN = function(x, .with = environment()){
   eval(parse(text = as.character(x)), envir = .with)
}, vectorize.arg = "x", SIMPLIFY = FALSE, USE.NAMES = TRUE)

# serial version of eply
eply_serial = function(.fun, .expr, .with = environment()){
  subset(.expr, select = formalArgs(.fun)) %>%
  apply(1, function(x){
    .args = veval(x, .with = .with)
    do.call(.fun, .args)
  }) %>%
  unname
}

# parallel version of eply
eply_parallel = function(.fun, .expr, .with = environment(), .split = NULL, .tasks = 1){
  rownames(.expr) = 1:nrow(.expr)
  index = subset(.expr, select = .split, drop = FALSE) %>% 
    apply(1, paste, collapse = "")
  index = ordered(index, levels = unique(index))
  .expr_list = split(x = .expr, f = index, drop = FALSE) 
  true_order = .expr_list %>%
    lapply(FUN = rownames) %>%
    unlist %>%
    as.integer
  out = mclapply(X = .expr_list, FUN = eply_serial, mc.cores = .tasks, 
    .fun = .fun, .with = .with) %>%
    unlist %>%
    unname
  out[order(true_order)]
}

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
