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

pima <- read_csv("b.data",col_names = FALSE)

fracao_treino = 0.7

tam_amostra <- floor(fracao_treino*nrow(pima))

# semente
#set.seed(123)

#568 de 7..
treina_idx <- sample(seq_len(nrow(pima)), size = tam_amostra)


treino <- pima[treina_idx, ]
teste <- pima[-treina_idx, ]

X <- treino[ ,1:8]
Y <- treino[ ,9]

Xtest <- teste[ ,1:8]
Ytest <- teste[ ,9]

dados <-data.frame(X,Y)

# ----------------------------------------------------------------
#  - Programa Principal: Gerar Dados do Problema, Ajustar a Metrica e
#  - Aplicar a Metrica com o K-NN
#  - Metrica Usada: Metrica de Mahalanobis cuja Matriz de Parametros deve
#   ser otimizada
# ----------------------------------------------------------------

# ------------ Gera Dados de Treinamento e Teste



# ------------- Aprendizado da Metrica de Mahalanobis
dados <- data.frame(X,Y)
M_cov <- cov(X) # covariancia para avaliar a dispersao dos dados
M_ident <- diag(8) # cria matriz identidade 2x2


# -------- Definindo K Vizinhos Mais Pr�ximos
k <- 3

# ------ Aplicar o K-NN com a M�trica Mahalanobis com matriz identidade (euclidiana) - testar se o algoritimo � bom
#saida_knn_euclid <- knn_custom(X, Xtest, Y, k, M_ident)

saida_knn_euclid <- knn(X, Xtest, Y$X9, k)
acc_knn_euclid <- sum(Ytest$X9 == saida_knn_euclid)/length(Ytest$X9) * 100

# ------ Aplicar o K-NN com a M�trica Mahalanobis com matriz de Covariancia
#saida_knn_maha <- knn_custom(X, Xtest, Y, k, M_cov)
#acc_knn_maha <- sum(Ytest == saida_knn_maha)/length(Ytest) * 100


# -------------  Exibe Dados para Classifica��o

print(acc_knn_euclid)
