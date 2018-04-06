#' @title Function \code{quotes}
#' @description Put quotes around each element of a character vector.
#' @seealso \code{\link{unquote}}, \code{\link{strings}},
#' \code{\link{eply}}, \code{\link{help_eply}}
#' @export
#' @return character vector with quotes around it
#' @param x character vector or object to be coerced to character.
#' @param single Add single quotes if \code{TRUE} and double quotes otherwise.
#' @examples
#' quotes(letters[1:3])
#' quotes(letters[1:3], single = TRUE)
#' quotes(letters[1:3], single = FALSE)
quotes <- function(x = NULL, single = FALSE) {
  stopifnot(is.logical(single))
  if (single) {
    paste0("'", x, "'")
  } else {
    paste0("\"", x, "\"")
  }
}

#' @title Function \code{unquote}
#' @description Remove leading and trailing escaped quotes from character strings.
#' @seealso \code{\link{quotes}}, \code{\link{strings}},
#' \code{\link{eply}}, \code{\link{help_eply}}
#' @export
#' @return character vector without leading or trailing escaped quotes around it
#' @param x character vector
#' @param deep remove all outer quotes if \code{TRUE}
#' and only the outermost set otherwise. Single and double
#' quotes are treated interchangeably, and matching is not checked.
#' @examples
#' unquote(c("x", "'y'", "\"why\"", "'''z'''"))
#' unquote(c("x", "'y'", "\"why\"", "'''z'''"), deep = FALSE)
#' unquote(c("x", "'y'", "\"why\"", "'''z'''"), deep = TRUE)
unquote <- function(x = NULL, deep = FALSE) {
  if (deep) {
    gsub("^[\"']*|[\"']*$", "", x)
  } else {
    gsub("^[\"']|[\"']$", "", x)
  }
}

#' @title Function \code{strings}
#' @description Turn valid expressions into character strings.
#' @seealso \code{\link{quotes}}, \code{\link{unquote}},
#' \code{\link{eply}}, \code{\link{help_eply}}
#' @export
#' @return a character vector
#' @param ... unquoted symbols to turn into character strings.
#' @examples
#' strings(a, b, bee)
strings <- function(...) {
  args <- structure(as.list(match.call()[-1]), class = "uneval")
  keys <- names(args)
  out <- as.character(args)
  names(out) <- keys
  out
}
