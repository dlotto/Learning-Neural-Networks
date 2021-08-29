library(magrittr)
library(dplyr)
library(ggplot2)
library(purrr)

p <- Perceptron$new()

p$guess(c(1,0.5))

t <- Training$new(500,500,100)
t$show

p$train(t$points)

