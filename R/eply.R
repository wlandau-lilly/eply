#' @export
eval_text = Vectorize(function(x){
  eval(parse(text = x))
}, "x", SIMPLIFY = FALSE)

#' @export
eply = function(.fun = NULL, .expr = NULL){
  apply(subset(.expr, select = formalArgs(.fun)), 1, function(x){
    .args = eval_text(x)
    with(.fun, .args) # evaluate function on arguments    
  })
}
