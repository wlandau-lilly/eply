#' @title Function \code{help_eply}
#' @description Prints links for tutorials, troubleshooting, bug reports, etc.
#' @seealso \code{\link{eply}}
#' @export
help_eply = function(){
  cat(
    "The package vignette has a full tutorial, and it is available at the following webpages.",
    "    https://CRAN.R-project.org/package=eply/vignettes/eply.html",
    "    https://cran.r-project.org/web/packages/eply/vignettes/eply.html",
    "The vignette of the development version has a full tutorial at the webpage below.",
    "    http://will-landau.com/eply/articles/eply.html",
    "For troubleshooting, navigate to the link below.",
    "    https://github.com/wlandau/eply/blob/master/TROUBLESHOOTING.md",
    "To submit bug reports, usage questions, feature requests, etc., navigate to the link below.",
    "    https://github.com/wlandau/eply/issues",
  sep = "\n")
}
