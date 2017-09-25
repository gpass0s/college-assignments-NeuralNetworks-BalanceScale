# MLP learning functions evaluation by Guilherme Passos - Classification
# Federal University of Minas Gerais

###############################

# In this assignment was performed a training process using a MLP (MultiLayer Perceptron) with three 
# different learning functions. The three learning functions used were Std_Backpropagation (Backpropagation), 
# Rprop (Resilient propagation) and BackpropChunck. My main goal here was to compare the accuracy 
# of those learning functions to classify the balance scale weight&distance database. This data set was taken 
# from UCI Machine Learning Repository and it was generated to model psychological experimental 
# results. Each example is classified as having the balance scale tip to the right, tip to the left, or be balanced. The attributes are the left weight, the left distance, the right weight, and the right distance. The correct way to find the class is the greater of (left-distance * left-weight) and (right-distance * right-weight). If they are equal, it is balanced.

# Attribute Information:
  
#  Class Name: 3 (L, B, R)
#  Left-Weight: 5 (1, 2, 3, 4, 5)
#  Left-Distance: 5 (1, 2, 3, 4, 5)
#  Right-Weight: 5 (1, 2, 3, 4, 5)
#  Right-Distance: 5 (1, 2, 3, 4, 5)
#  For more information about the learning functions we'll use click here: 
# (http://www.ra.cs.uni-tuebingen.de/SNNS/UserManual/node52.html).

#Biblotecas importantes
library(splitstackshape)
library(RSNNS)
library(ggplot2)


#Carregando os dados
myDataSet <-as.data.frame(read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/balance-scale/balance-scale.data"))

#Determinação da colunas de entrada do conjunto de dados (X)
myDataSet_Values <- myDataSet[,2:5]

#Codificação das classes do problema (Y)
myDataSet_Targets <- decodeClassLabels(myDataSet[[1]], valTrue=1, valFalse=0)

#Separando os conjuntos de treinamento e teste do modelo
myDataSet <- splitForTrainingAndTest(myDataSet_Values, myDataSet_Targets, ratio=0.15)

#Modelo 
model <- mlp(x=myDataSet$inputsTrain, y=myDataSet$targetsTrain, size=5, learnFunc="Std_Backpropagation", learnFuncParams=c(0.1), maxit=100, inputsTest=myDataSet$inputsTest, targetsTest=myDataSet$targetsTest)

#Resumo do Modelo
summary(model)
model

par(mfrow=c(2,2))
plotIterativeError(model)

#Resultado do treinamento
predictions <- predict(model,myDataSet$inputsTest)
#Matriz de 
cm <- confusionMatrix(myDataSet$targetsTrain, encodeClassLabels(fitted.values(model),
                                                                method="402040", l=0.4, h=0.6))
#Acuaracia do modelo
acuracia_Std_Backpropagation <- sum(diag(cm))/ sum(cm)


#-------------------------------------------------------------------------------

#Modelo 
model <- mlp(x=myDataSet$inputsTrain, y=myDataSet$targetsTrain, size=5, learnFunc="Rprop", learnFuncParams=c(0.1), maxit=100, inputsTest=myDataSet$inputsTest, targetsTest=myDataSet$targetsTest)

#Resumo do Modelo
summary(model)
model

par(mfrow=c(2,2))
plotIterativeError(model)

#Resultado do treinamento
predictions <- predict(model,myDataSet$inputsTest)
#Matriz de 
cm <- confusionMatrix(myDataSet$targetsTrain, encodeClassLabels(fitted.values(model),
                                                                method="402040", l=0.4, h=0.6))
#Acuaracia do modelo
acuracia_Rprop <- sum(diag(cm))/ sum(cm)


#-------------------------------------------------------------------------------

#Modelo 
model <- mlp(x=myDataSet$inputsTrain, y=myDataSet$targetsTrain, size=5, learnFunc="BackpropChunk", learnFuncParams=c(0.1), maxit=100, inputsTest=myDataSet$inputsTest, targetsTest=myDataSet$targetsTest)

#Resumo do Modelo
summary(model)
model

par(mfrow=c(2,2))
plotIterativeError(model)

#Resultado do treinamento
predictions <- predict(model,myDataSet$inputsTest)
#Matriz de 
cm <- confusionMatrix(myDataSet$targetsTrain, encodeClassLabels(fitted.values(model),
                                                                method="402040", l=0.4, h=0.6))
#Acuaracia do modelo
acuracia_BackpropChunk <- sum(diag(cm))/ sum(cm)

acuracia_Std_Backpropagation

acuracia_Rprop

acuracia_BackpropChunk

