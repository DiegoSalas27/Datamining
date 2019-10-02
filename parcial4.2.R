getwd()
setwd("D:/Users/DOMINIC/Desktop/UPC VIII/Administracion de informacion/Semana 4")
dir()

#Tratar valores perdidos

dataset = read.csv("dataset.csv", sep=',', header=TRUE)
dataset

dataset$age = ifelse(dataset$age > 35, mean(dataset$age), dataset$age)
dataset$age = ifelse(is.na(dataset$age), mean(dataset$age, na.rm = T), dataset$age)
dataset$salary = ifelse(is.na(dataset$salary), mean(dataset$salary, na.rm = T), dataset$salary)
dataset

#Nos deshacemos de los decimales
dataset$age = as.numeric(format(round(dataset$age, 0)))

#Tratar datos categoricos
#Transformamos los categoricos a numericos
dataset$nation = factor(dataset$nation, levels=c('India', 'Russia', 'Germany'), labels=c(1,2,3))
dataset$purchased_item = factor(dataset$purchased_item, levels=c('No', 'Yes'), labels=c(0,1))
dataset

#Dividimos el dataset en un conjunto de entrenamiento y pruebas
library(caTools)
set.seed(123)
split = sample.split(dataset$purchased_item, SplitRatio = 0.8)
training_set = subset(datasaet, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Escalando caracteristicas opcional
training_set[,3:4] = scale(training_set[,3:4])
test_set[,3:4] = scale(test_set[,3:4])

#Normalizacion lineal
lineal = function(x) {
  return((x - min(x, na.rm=T)/ (max(x, na.rm = T) - min(x, na.rm = T))))
}

#Normalizacion por desviacion estandar
dev = function(x) {
  return((x - mean(x, na.rm = T))/sd(x, na.rm = T))  
}

dataset$age = lineal(dataset$age)
dataset$age = dev(dataset$age)

dataset$salary = dev(dataset$salary)

#Evaluar la distancia (obtenemos los atributos que queremos hallar distacia your choice)
tableDistance1 = data.frame(Age = dataset$age, salary = dataset$salary)

#Distancia euclediana
euclidean = as.matrix(dist(tableDistance1, method = "euclidean"))
View(euclidean)

#Distancia minkowski
minkowski = as.matrix(dist(tableDistance1, method = "minkowski"))
View(minkowski)

#Distancia manhattan
manhattan = as.matrix(dist(tableDistance1,method = "manhattan"))
View(manhatta)

plot(tableDistance1)
plot(factor(dataset$age), dataset$salary)
