#' @title Function \code{eply}
#' @description Apply a function over a data frame of unevaluated expressions.
#' Parallel execution is available using the \code{.split} and \code{.tasks} arguments.
#' @export
#' @details \code{.fun} is a function, and \code{.expr} is a data frame. 
#' In \code{.expr}, each row stands for a single call to \code{.fun}, and each
#' column stamds for an argument. Each element is a character encoding an 
#' unevaluated expression. When \code{\link{eply}} is called, the expressions 
#' in each row of \code{.expr} are evaluated, and the results are given to 
#' \code{.fun} as function arguments. The column names of \code{.expr} must
#' contain the argument names of \code{.fun}.
#' If \code{.tasks > 1} and \code{.split} is used, \code{parallel::mclapply}
#' will be used to distribute the work over multiple parallel tasks, where tasks
#' are split up according to the columns of \code{.expr} named in \code{.split}.
#' @return a list or vector of return values of \code{.fun}.
#' @param .fun function to evaluate.
#' @param .expr data frame with function calls as rows and function arguments
#' as columns. The elements are characters that encode unevaluated expressions.
#' These expressions evaluate to function arguments of \code{.fun}. The argument
#' names of \code{.fun} must be contained in the column names of \code{.expr}.
#' @param .split character vector of columns of \code{.expr}
#'  to split over when executing parallel jobs.
#' @param .tasks number of parallel units of execution. Splits of \code{.expr}
#' according to the variables in \code{.split} are distributed over \code{.tasks}
#' parallel units of execution using \code{parallel::mclapply}. 
eply = function(.fun, .expr, .split = NULL, .tasks = 1){
  if(.tasks < 1 | !is.numeric(.tasks)) 
    stop("Argument .tasks must be a number at least 1.")
  if(!all(.split %in% colnames(.expr)))
    stop("Argument .split must be a subset of colnames(.expr).") 
  serial = is.null(.split) | .tasks <= 1
  windows_warning = "Parallel execution not supported on Windows. Executing serially instead."
  using_windows = Sys.info()[['sysname']] == "Windows"
  if(!serial & using_windows) print(windows_warning); serial = TRUE
  if(serial) 
    eply_serial(.fun = .fun, .expr = .expr) %>%
    return
  index = subset(.expr, select = .split, drop = FALSE) %>% 
    apply(1, paste, collapse = "")
  index = ordered(index, levels = unique(index))
  split(x = .expr, f = index, drop = FALSE) %>%
    mclapply(FUN = eply_serial, mc.cores = .tasks, .fun = .fun) %>%
    unlist %>%
    unname
}
