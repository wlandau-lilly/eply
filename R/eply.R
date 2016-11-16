#' @export
eply = function(.function = NULL, .variables = NULL, .values = NULL){
  
  # formalArgs(.function) gets the args of .function

if(F){

  apply(.values, 1, function(x){
    
    "arguments" = lapply(x, function(y) eval(parse(text = y)))
    
# evaluate .function with argument list "arguments"  

  })
  

}


# get .values from .variables if needed. .values is a data frame
# of every possible value of every variable, where each variable is a 
# column. Each element of the .values data frame is a character string
# encoding an expression.

# apply(...) 

# apply function over its arguments. 
# Not all variables are arguments to the function, so I will need to
# automagically find arguments of function.

}
