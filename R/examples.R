#' @title \code{example.expr}
#' @description Return example \code{.expr} argument for \code{\link{eply}}.
#' @seealso \code{\link{eply}}
#' @export
#' @return Example \code{.expr} argument to \code{\link{eply}}.
#' @examples
#' #' Get an example .expr argument to eply().
#' #' See the examples of the eply() function for usage.
#' example.expr()
example.expr <- function() {
  expand.grid(
    x = c(
      "subset(mtcars, cyl == 4, mpg, T)",
      "subset(mtcars, cyl == 4, wt, T)"
    ),
    y = letters[1:2],
    rep = LETTERS[1:2]
  )
}

#' @title \code{example.fun}
#' @description Example \code{.fun} argument to \code{\link{eply}}.
#' @seealso \code{\link{eply}}
#' @export
#' @return Example \code{.fun} argument to \code{\link{eply}}.
#' @param x numeric argument
#' @param y nonzero numeric argument
#' @examples
#' #' Get an example .fun argument to eply().
#' #' See the examples of the eply() function for usage.
#' example.fun
#' example.fun(x = c(4, 2), y = c(2, 2))
example.fun <- function(x, y) {
  mean(x / y)
}

#' @title \code{example.with}
#' @description Return example \code{.with} argument of \code{\link{eply}}.
#' @seealso \code{\link{eply}}
#' @export
#' @return example \code{.with} argument of \code{\link{eply}}
#' @examples
#' #' Get an example .with argument to eply() and evals().
#' #' See the examples of the eply() and evals() functions for usage.
#' example.with()
example.with <- function() {
  list(a = 1, b = 2)
}
