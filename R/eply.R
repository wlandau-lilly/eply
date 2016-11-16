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

#' @title Function \code{eply}
#' @description Apply a function over a data frame of unevaluated expressions.
#' @export
#' @details \code{.fun} is a function, and \code{.expr} is a data frame. 
#' In \code{.expr}, each row stands for a single call to \code{.fun}, and each
#' column stamds for an argument. Each element is a character encoding an 
#' unevaluated expression. When \code{\link{eply}} is called, the expressions 
#' in each row of \code{.expr} are evaluated, and the results are given to 
#' \code{.fun} as function arguments. The column names of \code{.expr} must
#' contain the argument names of \code{.fun}.
#' @return a list or vector of return values of \code{.fun}.
#' @param .fun function to evaluate.
#' @param .expr data frame with function calls as rows and function arguments
#' as columns. The elements are characters that encode unevaluated expressions.
#' These expressions evaluate to function arguments of \code{.fun}. The argument
#' names of \code{.fun} must be contained in the column names of \code{.expr}.
eply = function(.fun = NULL, .expr = NULL){
  apply(subset(.expr, select = formalArgs(.fun)), 1, function(x){
    .args = eval_text(x)
    do.call(.fun, .args) # evaluate function on arguments    
  })
}
