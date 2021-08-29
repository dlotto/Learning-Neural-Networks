
#' @importFrom magrittr %>%
Training <- R6::R6Class(
  "Training",
  public = list(
    #'@field points dataframe
    points = NULL,
    
    #' @description Constructor class
    initialize = function(width, height, amount){
      x = sample(width,amount)
      y = sample(height,amount)
      points <- data.frame(x,y)
      
      # This is a diagonal line that will define the (1,-1) spaces
      # Label is the defined "correct" answer.
      self$points <- points %>% 
        dplyr::mutate(label = dplyr::if_else(x > y, 1, -1)) %>% 
        dplyr::mutate(label = as.factor(label))
    }
    
  ),
  
  active = list(
    #' @description Draw an ellipse
    show = function(){
      ggplot2::ggplot(self$points, ggplot2::aes(x=x, y=y, color=label)) +
        ggplot2::geom_point()
    }
  ),
  
  private = list()
  
)
