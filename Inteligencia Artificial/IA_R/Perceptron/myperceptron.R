# Implementacao de um Perceptron Simples
# Talles Medeiros
# 26/08/2017
rm(list = ls())

train_perceptron <- function(x, y, eta, niter) {
  
  # Initialize weight vector
  weight <- rep(runif(1, min = -0.5, max = 0.5), dim(x)[2] + 1)
  errors <- rep(0, niter)
  ypred <- rep(0, length(y))
  
  # ----------------------------------------------------
  # Ploting Decision Hiperplane
  seqi <- seq(-1, 6, 0.05)
  seqj <- seq(-1, 6, 0.05)
  zpred <- matrix(0, nrow=length(seqi), ncol=length(seqj))
  ci <- 0
  for(i in seqi) {
    cj <- 0
    ci <- ci + 1
    print(ci)
    for(j in seqj) {
      cj <- cj + 1
      zpred[ci,cj] <- sum(weight[2:length(weight)] * matrix(c(i,j), nrow = 1, ncol = 2, byrow = T) ) + weight[1]
    }
  }
  
  
  # Loop of number of epochs
  for (jj in 1:niter) {
    
    # Loop of number of data
    for (ii in 1:length(y)) {
      
      # Predicao da saida discreta (-1, 1) usando uma função de limiar
      z <- sum(weight[2:length(weight)] * as.numeric(x[ii, ])) + weight[1]
      if (z < 0) {
        ypred[ii] <- 0
      } else {
        ypred[ii] <- 1
      }
      
      # Updating weights - nothing if the correct output 
      weightdiff <- eta * (y[ii] - ypred[ii]) * c(1, as.numeric(x[ii, ]))
      weight <- weight + weightdiff
      
      # Updating error function
      if ((y[ii] - ypred[ii]) != 0.0) {
        errors[jj] <- errors[jj] + 1
      }
    }
    
    plot(x[,1], x[,2], col = "red")
    par(new=T)
    contour(seqi,seqj,zpred, nlevels = 0, cex = 1.5, lwd = 3, add = TRUE)
    
  }
  
  # Retorna Pesos Sinapticos
  return(weight)
}

# Prediction Trained Perceptron
perceptron <- function(x, pesos){
  
  weight <- pesos
  ypred  <- rep(0, nrow(x))
  
  for ( i in 1:nrow(x)) 
  {
    z <- sum(weight[2:length(weight)] * x[i, ]) + weight[1]
    if (z < 0){
      ypred[i] <- 0
    } else {
      ypred[i] <- 1
    }
  }
  
  # ----------------------------------------------------
  # Ploting Decision Hiperplane
  seqi <- seq(-1, 6, 0.05)
  seqj <- seq(-1, 6, 0.05)
  zpred <- matrix(0, nrow=length(seqi), ncol=length(seqj))
  ci <- 0
  for(i in seqi) {
    cj <- 0
    ci <- ci + 1
    print(ci)
    for(j in seqj) {
      cj <- cj + 1
      zpred[ci,cj] <- sum(weight[2:length(weight)] * matrix(c(i,j), nrow = 1, ncol = 2, byrow = T) ) + weight[1]
    }
  }
  
  plot(x[,1], x[,2], col = "red")
  par(new=T)
  contour(seqi,seqj,zpred, nlevels = 0, cex = 1.5, lwd = 3, add = TRUE)
  
  return(ypred)
}

#############################################################################
# Redes Neurais Artificiais - Algoritmo Perceptron
#############################################################################

library(ggplot2)
library(readr)
library(plot3D)
library(mvtnorm)

# Loading dataset AND
n1 <- 100
n2 <- 100
xc1 <- rmvnorm(n1, mean = c(1, 1), sigma = matrix( c(0.2, 0, 0, 0.2), nrow = 2, byrow = T))
xc2 <- rmvnorm(n2, mean = c(5, 4), sigma = matrix( c(0.2, 0, 0, 0.2), nrow = 2, byrow = T)) 
x <- rbind(xc1, xc2)
y <- c(rep(0, n1), rep(1, n2))


#etas <- c(0, 0.001, 0.003, 0.005, 0.007, 0.01, 0.03, 0.05, 0.1)
#for (i in 1:length(etas)) {
pesos <- train_perceptron(x, y, 0.05, 100) 
ypred <- perceptron(x,pesos)
#}



#e = sum(y - ypred)^2 / length(y)
#print(e)