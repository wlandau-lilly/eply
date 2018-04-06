#' The eply package provides ways to call
#' \code{eval(parse(text = ...))} in bulk.
#' The \code{\link{evals}()} function is a vectorized version of
#' \code{eval(parse(text = ...))}. \code{\link{eply}()} is like
#' \code{apply(MARGIN = 1)} except that the elements of each row
#' are \code{eval(parse(text = ...))}'ed before being supplied
#' to the function.
#' @docType package
#' @name eply-package
#' @author William Michael Landau \email{will.landau@@gmail.com}
#' @references <https://github.com/wlandau/eply>
#' @importFrom magrittr %>%
#' @importFrom methods formalArgs
#' @examples
#' # Get an example data frame of commands that evaluate to function arguments.
#' .expr <- example.expr()
#' .fun <- example.fun # Get an example collection of functions.
#' # Get an example list of supporting data. Could be an environment.
#' .with <- example.with()
#' # Row-by-row, evaluate the code in .expr and feed the results to the function.
#' eply(.fun = .fun, .expr = .expr, .with = .with)
#' evals(x = c("a + 1", "b + 2"), .with = .with)
NULL
