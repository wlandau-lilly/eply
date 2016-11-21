#' @title Function \code{eply}
#' @description Apply a function over a data frame of unevaluated expressions.
#' Parallel execution is available using the \code{.split} and \code{.tasks} arguments.
#' @seealso \code{\link{help_eply}}
#' @export
#' @details \code{.fun} is a function, and \code{.expr} is a data frame. 
#' In \code{.expr}, each row stands for a single call to \code{.fun}, and each
#' column stamds for an argument. Each element is a character encoding an 
#' unevaluated expression. \code{.with} is a list, data frame, or environment
#' containing the variables that these expressions need.
#' When \code{\link{eply}} is called, the expressions 
#' in each row of \code{.expr} are evaluated on \code{.with}, 
#' and the results are given to \code{.fun} as function arguments. 
#' The column names of \code{.expr} must
#' contain the argument names of \code{.fun}.
#' With \code{.tasks} and \code{.split}, Mac and Linux users can 
#' distribute the work over multple parallel tasks. See the vignette for an 
#' example (\code{vignette("eply")}).
#' @return a list or vector of return values of \code{.fun}.
#' @param .fun function to evaluate.
#' @param .expr data frame with function calls as rows and function arguments
#' as columns. The elements are characters that encode unevaluated expressions.
#' These expressions evaluate to function arguments of \code{.fun}. The argument
#' names of \code{.fun} must be contained in the column names of \code{.expr}.
#' @param .with list, data frame, or environment with the
#' data accessible to \code{.expr}
#' @param .split character vector of columns of \code{.expr}, specifies how
#' the work is distributed across parallel tasks. 
#' See the vignette for an example \code{vignette("eply")}.
#' @param .tasks number of parallel tasks for distributing the work.
#' See the vignette for an example \code{vignette("eply")}.
eply = function(.fun, .expr, .with = environment(), .split = NULL, .tasks = 1){
  if(is_serial(.expr = .expr, .split = .split, .tasks = .tasks)){ 
    eply_serial(.fun = .fun, .expr = .expr, .with = .with) 
  } else {
    index = subset(.expr, select = .split, drop = FALSE) %>% 
      apply(1, paste, collapse = "")
    index = ordered(index, levels = unique(index))
    split(x = .expr, f = index, drop = FALSE) %>%
      mclapply(FUN = eply_serial, mc.cores = .tasks, .fun = .fun, .with = .with) %>%
      unlist %>%
      unname
  }
}
