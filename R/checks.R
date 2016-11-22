# check if arguments are good
check_arguments = function(.fun, .expr, .with, .split, .tasks){
  if(!is.function(.fun))
    stop(".fun must be a function.")
  if(is.null(dim(.expr)))
    stop(".expr must be a data frame.")
  if(length(dim(.expr)) != 2)
    stop(".expr must be a data frame.")
  if(any(dim(.expr) < 1))
    stop(".expr must have elements")
  if(!all(formalArgs(.fun) %in% colnames(.expr)))
    stop("All arguments of .fun must have column names in .expr.")
  if(!is.list(.with) & !is.data.frame(.with) & !is.environment(.with))
    stop(".with must be a list, data frame, or environment.")
  if(!all(.split %in% colnames(.expr)))
    stop("all members of .split must be column names in .expr.")
  if(length(.tasks) != 1)
    stop(".tasks must be a scalar.")
  if(!is.numeric(.tasks))
    stop(".tasks must be a number.")
  if(.tasks < 1)
    stop(".tasks must be at least 1.")
}

# TRUE if serial eply and FALSE if parallel via mclapply
is_serial = function(.split = NULL, .tasks = 1,
                     .os = Sys.info()[['sysname']]){
  
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
