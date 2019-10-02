getwd()
dir()

#Pre procesamiento de datos

#Tratar con los valores perdidos
#Reemplazamos los valores NA con los promedios de su respectiva columna para limpiar la data

dataset = read.csv('dataset.csv', sep=',', header=TRUE)

dataset$age = ifelse(is.na(dataset$age), ave(dataset$age, FUN = function(x) mean(x, na.rm=TRUE)), dataset$age)
dataset$salary = ifelse(is.na(dataset$salary), ave(dataset$salary, FUN = function(x) mean(x, na.rm = TRUE)), dataset$salary)

#Nos deshacemos de los decimales
dataset$age = as.numeric(format(round(dataset$age, 0)))

#Tratar con datos categoricos
#Transformamos los valores categoricos en codigos numericos
dataset$nation = factor(dataset$nation, levels=c('India', 'Russia', 'Germany'), labels=c(1,2,3))
dataset$purchased_item = factor(dataset$purchased_item, levels=c('No', 'Yes'), labels=c(0,1))

#Dividiendo el dataset en conjunto de entrenamiento y pruebas 
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$purchased_item, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Escalando las caracteristicas
training_set[,3:4] = scale(training_set[,3:4])
test_set[,3:4] = scale(test_set[,3:4])
