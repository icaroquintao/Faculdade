# Load Libraries
library(plot3D)
library(cluster)
#library(HDMD)
#library(mvtnorm)
library(class)
library(mlbench)
library(readr)
library(RSNNS)

# clear any garbage that may exist
rm(list=ls())


#-----------  CONSTANTS -------------#

#max number of iteractions
max_iteration_allowed <- 500

#number of neurons wanted
number_of_neurons <- 500

# eta value
eta <- 0.01

#split the data in n folds
# fatoracao - 3,5,11,67
number_of_folds <- 67


#-----------  LOAD DATA -------------#


#load data from file
#11055
phishing_data <- read_csv("phishing.data", col_names = FALSE)


#-----------  CREATE FOLDS ---------#

# create folds used to train the data
folds <- cut(seq(1,nrow(phishing_data)), breaks = number_of_folds,labels = FALSE)


#-----------  SAMPLE DATA -------------#

# sample the data 
phishing_data <- phishing_data[sample(1:nrow(phishing_data),length(1:nrow(phishing_data))),1:ncol(phishing_data)]



acuracia <- matrix(0,nrow =1, ncol = number_of_folds)

matrix_avg_data <- matrix(0,nrow = (nrow(phishing_data) / number_of_folds), ncol = 2)

matrix_binaty_data <- matrix(0,nrow = (nrow(phishing_data) / number_of_folds), ncol = 2)


soma <- 0

#-----------  ITERATE THROUGHT FOLDS -------------#

#loop throught folds
for (i in 1:number_of_folds){
  
  #select fold
  testeIdx <- which(folds == i, arr.ind = TRUE)
  
  #separate test data
  testeData <- phishing_data[testeIdx,]
  
  # from training data
  treinoData <- phishing_data[-testeIdx,]
  
  
  X <- as.matrix(treinoData[,1:30])
  Y <- decodeClassLabels(as.matrix(treinoData[,31]))
  
  
  Xtest <- as.matrix(testeData[,1:30])
  
  #data is separed in two col -1 and 1, necessary latter(confusion matrix)
  Ytest <- decodeClassLabels(as.matrix(testeData[,31]), valTrue = 1, valFalse = -1)
  
  Ytest2 <- as.matrix(testeData[,31])
  
  # Gera o modelo MLP (Multi-Layer Perceptron com SIZE neurônios) treinado.
  model <- mlp(
                X, 
                Y, 
                size             = number_of_neurons, 
                learnFuncParams  = c(eta),
                maxit            = max_iteration_allowed, 
                inputsTest       = Xtest, 
                targetsTest      = Ytest
                )
  
  predictions <- predict(model,Xtest)
  
  for (k in 1:nrow(matrix_avg_data)){
    matrix_avg_data[k,1] = matrix_avg_data[k,1] + predictions[k,1]
    matrix_avg_data[k,2] = matrix_avg_data[k,2] + predictions[k,2]
  }
  
  
  saida <- as.matrix( rep(0, nrow(predictions)))
  
  for (i in 1 : nrow(predictions)){
      
    if ((predictions[i,1])  > (predictions[i,2])){
        saida[i] = 1
      }
      else{
        saida[i] = -1
      }
  }

  acuracia <- sum(Ytest2 == saida[i])/nrow(Ytest2) * 100
    
  soma <- soma + acuracia
  
}


for (k in 1:nrow(matrix_avg_data)){
  matrix_avg_data[k,1] = matrix_avg_data[k,1] / number_of_folds
  matrix_avg_data[k,2] = matrix_avg_data[k,2] / number_of_folds
}


#confusionMatrix(iris$targetsTrain,fitted.values(model))
mat_conf <- confusionMatrix(Ytest,matrix_avg_data)

#sensibilidade
S <- mat_conf[2,2]/(mat_conf[2,2] + mat_conf[2,1])
#especificidade
E <- mat_conf[1,1]/(mat_conf[1,1] + mat_conf[1,2])


media <- soma/number_of_folds

cat("\nMedia : \t\t", media)

cat("\n\nSensibilidade : \t", S)
cat("\nEspecificidade : \t", E)

cat("\n\n\tMatriz de Confusao\n\n")

print(mat_conf)