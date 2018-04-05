#' @title Function \code{evals}
#' @description Evaluate a character vector as a bunch of expressions.
#' @seealso \code{\link{eply}}, \code{\link{help_eply}}
#' @export
#' @return a list or vector of return values of \code{.fun}.
#' @param x character vector of expressions to evaluate
#' @param .with list, data frame, or environment with the
#' data accessible to the expressions in \code{x}
#' @param .simplify \code{TRUE} to simplify the result
#' and \code{FALSE} otherwise 
evals = function(x = NULL, .with = parent.frame(), .simplify = TRUE){
  if(!length(x)) return()
  checks_evals(.with = .with, .simplify = .simplify)
  force(.with)
  out = vevals(x, .with = .with)
  names(out) = x
  if(.simplify) out = simplify2array(out)
  out
}

# evals but with no names
vevals = Vectorize(FUN = function(x, .with){
   eval(parse(text = as.character(x)), envir = .with)
}, vectorize.args = "x", SIMPLIFY = FALSE, USE.NAMES = TRUE)
