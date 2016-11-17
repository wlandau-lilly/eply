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
  }) %>%
  unname
}
