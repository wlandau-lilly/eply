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
  }) %>%
  unname
}

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

#' @title Function \code{is_serial}
#' @description Determine whether to execute \code{\link{eply}} serially.
#' @seealso \code{\link{eply}}
#' @export
#' @return \code{TRUE} if \code{\link{eply}} will run serially
#' and \code{FALSE} if parallelized.
#' @param .fun argument to \code{\link{eply}}
#' @param .expr argument to \code{\link{eply}}
#' @param .split argument to \code{\link{eply}}
#' @param .tasks argument to \code{\link{eply}}
#' @param os operating system
is_serial = function(.fun, .expr, .split = NULL, .tasks = 1,
  os = Sys.info()[['sysname']]){

  # Sanitize individual arguments.
  if(.tasks < 1 | !is.numeric(.tasks))
    stop(".tasks must be a number at least 1.")
  if(!all(.split %in% colnames(.expr)))
    stop(".split must be a subset of colnames(.expr).")

  # Resolve conflicts.
  if(.tasks > 1 & !length(.split)){
    warning(".tasks > 1 but .split is empty. Executing serially.")
    .tasks = 1
  } else if(.tasks <= 1 & length(.split) > 0){
    warning(".tasks == 1 but .split is nonempty. Executing serially.")
  }

  # Disable parallelism on Windows.
  if(.tasks > 1 & os == "Windows"){
    warning("Parallel execution not supported on Windows. Executing serially.")
    .tasks = 1
  }

  .tasks > 1
}
