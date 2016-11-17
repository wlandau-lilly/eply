#' @title Function \code{eval_text}
#' @description Evaluate expressions encoded as
#' elements of a character vector.
#' @seealso \code{\link{eply}}
#' @export
#' @return list of evaluated expressions
#' @param x character vector encoding unevaluated expressions
eval_text = Vectorize(FUN = function(x){
  eval(parse(text = x))
}, vectorize.arg = "x", SIMPLIFY = FALSE)

#' @title Function \code{eply_serial}
#' @description Serial version of \code{\link{eply}}.
#' @seealso \code{\link{eply}}
#' @export
#' @return a list or vector of return values of \code{.fun}.
#' @param .fun function to evaluate.
#' @param .expr data frame with function calls as rows and function arguments
#' as columns. 
eply_serial = function(.fun, .expr){
  subset(.expr, select = formalArgs(.fun)) %>%
  apply(1, function(x){
    .args = eval_text(x)
    do.call(.fun, .args)
  })
}

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
#' If \code{.tasks > 1} and \code{.split} is used, \code{\link{parallel::mclapply}}
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
#' parallel units of execution using \code{\link{parallel::mclapply}}. 
eply = function(.fun, .expr, .split = NULL, .tasks = 1){
  if(.tasks < 1 | !is.numeric(.tasks)) 
    stop("Argument .tasks must be a number at least 1.")
  if(!all(.split %in% colnames(.expr)))
    stop("Argument .split must be a subset of colnames(.expr).") 
  serial = is.null(.split) | .tasks <= 1
  if(!serial & Sys.info()[['sysname']] == "Windows"){
    warning("Parallel execution not supported on Windows. Executing serially instead.")
    serial = TRUE
  }
  if(serial) return(eply_serial(.fun = .fun, .expr = .expr))
  subset(.expr, select = .split, drop = FALSE) %>% 
    apply(1, paste, collapse = "") %>%
    split(x = .expr, drop = FALSE) %>%
    mclapply(FUN = eply_serial, mc.cores = .tasks, .fun = .fun) %>%
    unlist %>%
    unname
}
