#' @title Function \code{strings}
#' @description Turns unquoted symbols into character strings.
#' @seealso \code{\link{eply}}
#' @export 
#' @return a character vector
#' @param ... unquoted symbols to turn into character strings.
strings = function(...){
  args = structure(as.list(match.call()[-1]), class = "uneval")
  keys = names(args)
  out = as.character(args)
  names(out) = keys
  out
}
