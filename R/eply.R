#' @title Function \code{eply}
#' @description Apply a function over a data frame of quoted expressions.
#' Parallel execution is available using the \code{.split} and \code{.tasks} arguments.
#' @seealso \code{\link{evals}}, \code{\link{help_eply}}
#' @export
#' @details \code{.fun} is a function, and \code{.expr} is a data frame. 
#' In \code{.expr}, each row stands for a single call to \code{.fun}, and each
#' column stamds for an argument. Each element is a quoted expression that 
#' uses the data in \code{.with} during evaluation.
#' When \code{\link{eply}} is called on each row, the expressions 
#' are evaluated on \code{.with}, 
#' and the results are given to \code{.fun} as function arguments. 
#' The column names of \code{.expr} must
#' contain the argument names of \code{.fun}.
#' With \code{.tasks} and \code{.split}, Mac and Linux users can 
#' distribute the work over multple parallel tasks. See the vignette for an 
#' example (\code{vignette("eply")}).
#' @return a list or vector of return values of \code{.fun}.
#' @param .fun function to evaluate.
#' @param .expr data frame of quoted expressions. Column names must
#' contain the argument names of \code{.fun}.
#' @param .with list, data frame, or environment with the
#' data accessible to \code{.expr}
eply = function(.fun, .expr, .with = parent.frame()){
  checks_eply(.fun = .fun, .expr = .expr, .with = .with)
  force(.with)
  subset(.expr, select = formalArgs(.fun)) %>%
  apply(1, function(x){
    .args = vevals(x, .with = .with)
    do.call(.fun, .args)
  })
}
