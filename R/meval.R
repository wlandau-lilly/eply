#' @title Function \code{meval}
#' @description evaluate a character vector of quoted expressions 
#' and return a collection of results
#' @seealso \code{\link{veval}}, \code{\link{eply}}, \code{\link{help_eply}}
#' @export
#' @return results of evaluating \code{x} elementwise
#' (array or vector if \code{.simplify} is \code{TRUE} 
#' and a list otherwise)
#' @param x character vector of quoted expressions
#' @param .with list, data frame, or environment with the
#' data accessible to \code{x}
#' @param .tasks number of parallel tasks
meval = function(x = NULL, .with = environment(), .tasks = 1){
  if(!length(x)) return()
  .expr = data.frame(
    x = as.character(unlist(x)),
    y = rep(1:.tasks, length.out = length(x)))
  .split = NULL
  if(.tasks > 1) .split = "y"
  eply(.fun = function(x) x, .expr = .expr, .with = .with, 
    .tasks = .tasks, .split = .split)
}
