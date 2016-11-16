#' @title \code{example.expr}
#' @description Example \code{.expr} argument to \code{\link{eply}}.
#' @export
#' @return Example \code{.expr} argument to \code{\link{eply}}.
example.expr = function(){expand.grid(
  x = c(
    "subset(mtcars, cyl == 4, mpg, T)", 
    "subset(mtcars, cyl == 4, wt, T)"
  ),
  y = 1:2,
  rep = LETTERS[1:2]
)}

#' @title \code{example.fun}
#' @description Example \code{.fun} argument to \code{\link{eply}}.
#' @export
#' @return Example \code{.fun} argument to \code{\link{eply}}.
example.fun = function(x, y){
  mean(x/y)
}
