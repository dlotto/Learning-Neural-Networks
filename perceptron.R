

Perceptron <- R6::R6Class(
  "Perceptron",
  public = list(
    #'@field weights array
    weights = NULL,
    
    #' @description Constructor
    #' @param l An integer; Number of weights
    initialize = function(l=2){
      self$weights <- vector("numeric",l)
      # Initialize the weights randomly
      for(i in 1:length(self$weights)){
        self$weights[i] <- runif(n=1, min=-1, max=1)
      }
    },
    
    #' @description Tuning all the weights
    #' @param points_df 
    train = function(points_df){
      # browser()
      points_df %>% 
        dplyr::mutate(g = purrr::map2_dbl(x,y,private$guess))
      
    }

  ),
  
  active = list(),
  
  private = list(
    
    #' @description 
    #' Will make a guess by using the dot product summation of the inputs and weights 
    #' and passing that sum to the sign function.
    guess = function(x0,x1){
      inputs <- c(x0,x1)
      g.sum = sum(inputs*self$weights)
      output = private$sign_fn(g.sum)
      
      return(output)
    },
    
    #' Activation function
    sign_fn = function(n){
      if(n >= 0){1}else{-1}
    }
  )
  
)
