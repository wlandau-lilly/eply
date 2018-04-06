#' @title Function \code{help_eply}
#' @description Prints links for tutorials, troubleshooting, bug reports, etc.
#' @seealso \code{\link{eply}}, \code{\link{evals}}
#' @export
#' @examples
#' help_eply()
help_eply <- function() {
  message(
    "The eply package has a tutorial at ",
    "https://CRAN.R-project.org/package=eply/vignettes/eply.html.",
    "For troubleshooting, please visit ",
    "https://github.com/wlandau/eply/blob/master/TROUBLESHOOTING.md.",
    "To submit bug reports, questions, feature requests, please see",
    "https://github.com/wlandau/eply/issues."
  )
}
