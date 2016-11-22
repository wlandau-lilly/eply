#' @title Function \code{seval}
#' @description evaluate a character vector of quoted expressions 
#' and return a SIMPLIFIED list of results
#' @seealso \code{\link{veval}}, \code{\link{eply}}, \code{\link{help_eply}}
#' @export
#' @return results of evaluating \code{x} elementwise
#' @param x character vector of quoted expressions
#' @param .with list, data frame, or environment with the
#' data accessible to \code{x}
seval = Vectorize(FUN = function(x, .with = environment()){
   eval(parse(text = as.character(x)), envir = .with)
}, vectorize.arg = "x", SIMPLIFY = TRUE, USE.NAMES = TRUE)

#' @title Function \code{veval}
#' @description evaluate a character vector of 
#' quoted expressions and return a list of results
#' @seealso \code{\link{seval}} \code{\link{eply}}, \code{\link{help_eply}}
#' @export
#' @return results of evaluating \code{x} elementwise
#' @param x character vector of quoted expressions
#' @param .with list, data frame, or environment with the
#' data accessible to \code{x}
veval = Vectorize(FUN = function(x, .with = environment()){
   eval(parse(text = as.character(x)), envir = .with)
}, vectorize.arg = "x", SIMPLIFY = FALSE, USE.NAMES = TRUE)
