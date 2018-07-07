# Modelo de Trinamento de uma Rede Multi-Layer Perceptron
library(RSNNS)

# Carregando Dados de uma base de dados nativa do R, mas você deverá usar rotina para ler seu arquivo
data(iris)

# Embaralha os exemplos
iris <- iris[sample(1:nrow(iris),length(1:nrow(iris))),1:ncol(iris)]

# Determinas os atributose a classe
irisValues <- iris[,1:4]
irisTargets <- decodeClassLabels(iris[,5])

# Divide o conjunto de dados em treinamento e teste uma proporcao escolhida
iris <- splitForTrainingAndTest(irisValues, irisTargets, ratio=0.15)

# Normaliza o conjunto de dados para uma faixa de representacao igual para odos atributos
iris <- normTrainingAndTestSet(iris)

# Gera o modelo MLP (Multi-Layer Perceptron com SIZE neurônios) treinado.
model <- mlp(iris$inputsTrain, iris$targetsTrain, size=5, learnFuncParams=c(0.1), 
             maxit=50, inputsTest=iris$inputsTest, targetsTest=iris$targetsTest)

summary(model)
#model
weightMatrix(model)
extractNetInfo(model)

par(mfrow=c(2,2))
plotIterativeError(model)

# Caldulando as saidas prvistas pela rede MLP
predictions <- predict(model,iris$inputsTest)

plotRegressionError(predictions[,2], iris$targetsTest[,2])

# Monta a matrix de confusão entre a saída esperada e a saída calculada
m1 <- confusionMatrix(iris$targetsTrain,fitted.values(model))
m2 <- confusionMatrix(iris$targetsTest,predictions)

print(m2)