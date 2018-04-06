# check arguments to eply
checks_eply <- function(.fun, .expr, .with) {
  if (!is.function(.fun)) {
    stop(".fun must be a function.")
  }
  if (is.null(dim(.expr))) {
    stop(".expr must be nonempty.")
  }
  if (length(dim(.expr)) != 2) {
    stop(".expr must be 2-dimensional (for example, a data frame or matrix).")
  }
  if (any(dim(.expr) < 1)) {
    stop(".expr must have elements")
  }
  if (!all(formalArgs(.fun) %in% colnames(.expr))) {
    stop("All arguments of .fun must have column names in .expr.")
  }
  if (!is.list(.with) && !is.data.frame(.with) && !is.environment(.with)) {
    stop(".with must be a list, data frame, or environment.")
  }
}

checks_evals <- function(.with, .simplify) {
  if (!is.list(.with) && !is.data.frame(.with) && !is.environment(.with)) {
    stop(".with must be a list, data frame, or environment.")
  }
  if (!is.logical(.simplify)) {
    stop(".simplify must be TRUE or FALSE")
  }
  if (length(.simplify) != 1) {
    stop(".simplify must be a scalar.")
  }
}
