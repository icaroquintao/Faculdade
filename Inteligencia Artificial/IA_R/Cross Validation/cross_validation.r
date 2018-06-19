# -------------------------------------------------
# Universidade Federal de Ouro Preto
# Talles Henrique de Medeiros - Original 
# K-NN c/ Aprendizado de M�tricas para Mahalanobis Distance
# ------------------------------------------------


library(plot3D)
library(cluster)
library(HDMD)
library(mvtnorm)
library(class)
library(mlbench)
library(readr)

rm(list=ls())

# -------- Implementando a Funcao de Distancia Mahalanobis para KNN
# Mahalanobis - trabalha com grupo de dados, diminui a discrepancia dos atriutos - usa uma normaliza��o nos dados
# x - matriz de dados treinamento
# xtest - matriz de dados de teste
# cx - matriz de parametros de mahalanobis
mahalanobis_xy_knn <- function(xtest, x, cx) {
  
  Mdist <- matrix(0, nrow = nrow(xtest), ncol = nrow(x))
  for(i in 1:nrow(xtest)){
    Mdist[i,] <- mahalanobis(x = x, center = xtest[i, ], cov = cx, inverted = TRUE) # monta a matrix resultante
  }
  
  return(Mdist)
}


# --------------- Algoritmo KN com M�trica da Mahalanobis
knn_custom <- function(Xtrain, Xtest, Ytrain, k, M){
  
  # ------ Obtem as Distancias Dist(MxN) de todos Xtest(Mxd) para todos Xtrain(Nxd)
  # ------ Usando a M�trica Aprendida
  Dist <- mahalanobis_xy_knn(Xtest,Xtrain, M)
  #   Dist <- dist()
  #dados <- data.frame(Dist, Ytrain)
  
  Yhat <- matrix(0, nrow = nrow(Xtest), ncol = 1) 
  
  label_um <- 0
  label_dois <- 0
  # ---- Calcula o Label de Cada Xtest
  for(i in 1:length(Yhat)){
    # Agrupa Dist e Y num data frame
    dados <- data.frame(Dist[i,], Ytrain)
    # Ordena Data frame segundo a Distancia
    ind <- order(dados$Dist.i...)
    # Toma os K Labels mais Pr�ximos
    k_labels_proximos <- Y[ind[1:k]]
    # Verifica a maioria
    for(j in 1:k){
      if (k_labels_proximos[j] == 0) label_um <- label_um + 1
      else label_dois <- label_dois + 1
    }
    
    if(label_um > label_dois) Yhat[i] <- 0
    else if(label_um < label_dois) Yhat[i] <- 1
    
    label_um <- 0
    label_dois <- 0
  }
  
  return(Yhat)
}
#-----------------------





# -------- Definindo K Vizinhos Mais Pr�ximos
k <- 3


pima <- read_csv("b.data",col_names = FALSE)


yourData <- pima[sample(nrow(pima)),]


folds <- cut(seq(1,nrow(yourData)), breaks = 10,labels = FALSE)


saida_knn_euclid <- matrix(0,nrow = 1, ncol = 10)
acc_knn_euclid <- matrix(0, nrow = 1, ncol = 10)

soma <- 0

for(i in 1:10){
  
  
  testeIdx <- which(folds == i, arr.ind = TRUE)
  testeData <- yourData[testeIdx,]
  treinoData <- yourData[-testeIdx,]
  
  
  X <- as.matrix(treinoData[,1:8])
  Y <- as.matrix(treinoData[,9])

  
  Xtest <- as.matrix(testeData[,1:8])
  Ytest <- as.matrix(testeData[,9]) 
  
  saida_knn_euclid <- knn(X,Xtest,Y,k)
  acc_knn_euclid <- sum(Ytest == saida_knn_euclid[i])/nrow(Ytest) * 100
  
  soma <- soma + acc_knn_euclid
  
  #print(acc_knn_euclid)
}

mediaCV <- soma/10;
print(mediaCV)



