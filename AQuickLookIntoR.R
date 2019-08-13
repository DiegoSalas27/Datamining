#closing Rstudio
q()

#comments. You just use hashtag

#variables
#R manipulates just data tables because it is used for statistic calculus. This tables are stored
#in variables. There are 2 ways of assigning a value to a variable. Values can be overwritten.
age = 8
age <- 9
#response: [1] 8 given that 8 is a matrix it is a single value so it is stored as a single square.

#vectors: it is a one dimensional matrix. Each cell in the vector should contain the same data type.
ages = c(11,13,30)

 #it is possible to concatenate vectors:
pesogrupotest = c(75.0, 69.2, 75.4, 87.3)
pesogrupointervencion = c(70.5, 64.2, 76.4, 81.6)
peso = c(pesogrupotest, pesogrupointervencion)
peso

#you can access an element from a vector like this:

peso[2]

#accessing the numbers above 70
peso[peso>70]

#length of a vector
length(peso)
length(peso[peso>70])

#creating a sequence of integer numbers
seq(1, 10)
seq(1, 10, 0.5)

#matrices are 2 dimensional arrays (rows and columns)
mimatriz = matrix(c(1.5, 2.1, 3.2, 1.6, 1.4, 1.5), nr = 3, nc = 2) 
mimatriz

#accessing an element from an array
mimatriz[1,1]

#accessing a whole column or row
mimatriz[,1]
mimatriz[1,]

#lists: one dimensional matrix with different types of data.
milista = list(1, "hi")
milista

#dataframes: a dataframe is a table in which there is a particular type of attribute for each column
#and each row has a different subject. You can create dataframes or read them from a file:
t = read.table("data1.csv", sep=",", header=TRUE)

#accessing dataframes values by index:
t[2, 2]
t[1,"altura"]
t[1,]
t[,"altura"]

#direct access for X.altura column
t$altura
t[t$altura>1.70,]

#storing a dataframe
write.table(t, "data2.csv", sep=",", row.names = FALSE)

#calculating IMC for each individual
t$peso/(t$altura^2)

#getting information about functions with the help method
help(c)

summary(matriz) #muestra un resum ́en de la matriz length(vector) regresa el nu ́mero de celdas del vector ncol(tabla) regresa el nu ́mero de columnas de la tabla nrow(tabla) regresa el nu ́mero de filas de la tabla
q() #cierra R
min(vector) #regresa el valor mas pequen ̃o de un vector
max(vector) #regresa el valor mas grande de un vector
sort(vector) #regresa una copia del vector despu ́es de ordenarla
mean(vector) #regresa la media de los valores del vector
median(vector) #regresa la mediana de los valores del vector
var(vector) #regresa la varianza de los valores del vector
sd(vector) #regresa la desviacio ́n est ́andar de los valores del vector
sqrt(numero) #regresa la ra ́ız cuadrada de un nu ́mero
sum(vector) #regresa la suma de todos los valores del vector
round(flotante) #redondea un nu ́mero flotante
rank(vector) #regresa un vector con los rangos (es decir, 1 para el valor mas pequen ̃o, 2 para el segundo, etc)
quantile(vector) #muestra el vector por cuantiles

#NA values propagate. We can't calculate the mean
mean(t$peso)

#we can ask R to not take into account NA values
mean(t$peso, na.rm = TRUE)


