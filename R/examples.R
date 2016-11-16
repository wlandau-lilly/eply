#' @title Function \code{example_omniply}
#' @description Copy a omniply example to the current working directory.
#' To see the names of all the examples, run \code{\link{list_examples_omniply}}.
#' @seealso \code{\link{list_examples_omniply}}
#' @export
#' @param example name of the example. To see all the available example names, 
#' run \code{\link{list_examples_omniply}}.
example_omniply = function(example = list_examples_omniply()){
  example <- match.arg(example)
  dir <- system.file(file.path("examples", example), package = "omniply", mustWork = TRUE)
  if(file.exists(example)) 
    stop("There is already a file or folder named ", example, ".", sep = "")
  file.copy(from = dir, to = getwd(), recursive = TRUE)
  invisible()
}

#' @title Function \code{list_examples_omniply}
#' @description Return the names of all the omniply examples.
#' @seealso \code{\link{example_omniply}}
#' @export
#' @return a names of all the omniply examples.
list_examples_omniply = function(){
  list.dirs(system.file("examples", package = "omniply", mustWork = TRUE), full.names = FALSE, recursive = FALSE)
}
