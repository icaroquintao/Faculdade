library(plot3D)
library(cluster)
library(HDMD)
library(mvtnorm)
library(class)
library(FNN)
library(knnGarden)
library(SDMTools)

# carregar base de dados 
library(readr)
iono <- read_csv("C:/Users/DeivysonBruno/Desktop/aula/17.2/IA/ionosphere/ionosphere.data.txt", 
                 col_names = FALSE,col_types = cols())

x <- iono[,1:34]
y <- iono[,35]
n<-10
erro <- rep(0,n)
k <- 3
K_fold_Max <-10
Y<-y
tam <- length(t(y))
for(i in 1:tam){
  if(Y[i,1]=="g"){
    Y[i,1] <- 0
  }else{
    Y[i,1] <- 1
  }
}

Y<- sapply(Y, as.numeric)


p=0.7
# gerar indices para selecionar as linhas da matriz
train_idx <- sample(x=nrow(iono),size=p*nrow(iono), replace= FALSE)
teste_idx <- c(1:nrow(iono))[1-train_idx]

# gerar as matrizes com os dados de treinamento e teste
#dados de treino
iono_train_x <- iono[train_idx,1:34]
iono_train_y <- iono[train_idx,35]

#dados de teste
iono_teste_x <- iono[teste_idx,1:34]
iono_teste_y <- iono[teste_idx,35]

tam <- length(t(iono_train_y))
for(i in 1:tam){
  if(iono_train_y[i,1]=="g"){
    iono_train_y[i,1] <- 1
  }else{
    iono_train_y[i,1] <- 2
  }
}

tam <- length(t(iono_teste_y))

for(i in 1:tam){
  if(iono_teste_y[i,1]=="g"){
    iono_teste_y[i,1] <- 1
  }else{
    iono_teste_y[i,1] <- 2
  }
}

iono_train_x <- sapply(iono_train_x, as.numeric)
iono_teste_x <- sapply(iono_teste_x, as.numeric)
iono_train_y <- sapply(iono_train_y, as.numeric)
iono_teste_y <- sapply(iono_teste_y, as.numeric)





# funçoes
mahalanobis_xy_knn <- function(xtest, x, cx) {
  
  Mdist <- matrix(0, nrow = nrow(xtest), ncol = nrow(x))
  for(i in 1:nrow(xtest)){
    Mdist[i,] <- mahalanobis(x = x, center = xtest[i, ], cov = cx, inverted = TRUE)
  }
  
  return(Mdist)
  # matriz que calcula as distancias. 
}


# --------------- Algoritmo KN com MÃ©trica da Mahalanobis
knn_custom <- function(Xtrain, Xtest, Ytrain, k, M){
  
  # ------ Obtem as Distancias Dist(MxN) de todos Xtest(Mxd) para todos Xtrain(Nxd)
  # ------ Usando a MÃ©trica Aprendida
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
    # Toma os K Labels mais PrÃ³ximos
    k_labels_proximos <- iono_train_y[ind[1:k]]
    # Verifica a maioria
    for(j in 1:k){
      if (k_labels_proximos[j] == 1) label_um <- label_um + 1
      else label_dois <- label_dois + 1
    }
    
    if(label_um > label_dois) Yhat[i] <- 0
    else if(label_um < label_dois) Yhat[i] <- 1
    
    label_um <- 0
    label_dois <- 0
  }
  
  return(Yhat)
}


# distancia manhatan 


# ------------- Aprendizado da Metrica de Mahalanobis
dados <- data.frame(x,y)
M_cov <- cov(x)
M_ident <- diag(34)






# ------ Aplicar o K-NN com a MÃ©trica Mahalanobis com matriz identidade (euclidiana)
saida_knn_euclid <- knn_custom(iono_train_x,iono_teste_x,iono_train_y, k, M_ident)
#knnMCN(iono_train_x,iono_train_y,iono_teste_x,k,ShowObs = FALSE)

erroEuclid <- (1/nrow(iono_teste_y)*sum(iono_teste_y!=saida_knn_euclid))
acc_knn_euclid <- sum(iono_teste_y == saida_knn_euclid)/length(iono_teste_y) * 100


  # ------ Aplicar o K-NN com a MÃ©trica Mahalanobis com matriz de Covariancia
saida_knn_maha <- knn_custom(iono_train_x, iono_teste_x,iono_train_y, k, M_cov)
erroMahala <- (1/nrow(iono_teste_y)*sum(iono_teste_y!=saida_knn_maha))
acc_knn_maha <- sum(iono_teste_y == saida_knn_maha)/length(iono_teste_y) * 100

#-------- knn manhatan 

s<-knnVCN(TrnX=iono_train_x,OrigTrnG=iono_train_y,TstX=iono_teste_x,ShowObs=FALSE,K=k,method="manhattan",p = 2)
erroManhat<- (1/nrow(iono_teste_y)*sum(iono_teste_y!=s))

mat<-(confusion.matrix(s$TstXIBelong,iono_teste_y,threshold = 0.5))
mat

