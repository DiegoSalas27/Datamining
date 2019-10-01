q() 
edad = 28
edad
peso = 64.5
name = 'Juan landa'
teacher = TRUE
student = FALSE
phone = '01 48'
getwd()
setwd('D:/Users/DOMINIC/Desktop/UPC VIII/Administracion de informacion/Semana 1')
ficheros <- dir()


#VECTORES

#vector es una matriz unidimensional. Todas las celdas del vector contienen datos del mismo tipo
edades = c(28,25,23, 24, 26, 23, 21, 22, 24, 29, 24, 26, 31, 28, 27, 
24, 23, 25, 27, 25, 24, 21, 24, 23, 25, 31, 28, 27, 24, 23)
edades

#podemos concatenar vectores
peso_grupo_test = c(75.0, 69.2, 75.4, 87.3)
peso_grupo_intervencion = c(70.4, 64.2, 76.4, 81.6)
peso = c(peso_grupo_test, peso_grupo_intervencion)
peso
peso[1]

peso[peso > 70] #Trae solo los pesos mayores a 70

length(peso)

length(peso[peso < 70])

#vector de enteros con funcion seq()
seq(1, 10)
seq(1, 10, by = 2)

#MATRICES

matriz = matrix(c(2,3,4,5,6,7), nr=3, nc=2)
matriz[1,1] #elemento en posicion (1,1)
matriz[,1] #elementos de la primera columna
matriz[1,] #elementos de la primera fila
matriz[[1]] #shorthand for specific value

#Listas: es una matriz unidimensional que puede contener datos de diferentes tipos
lista = list(1, 'hola', c(1,2,3))
lista

#Datatable es una tabla en la que cada columna corresponde a un atributo diferente y cada linea tiene un individuo diferente

table = read.table('talla_peso.csv', sep=',', header=TRUE)
table
names(table)

table[1, 2]
table[1, 'altura']
table[1, ]
table[, 2]
table$altura
table$nombre
table$peso

#Indexación: obtener una tabla con las personas cuya talla es mayor a 1.70
table[table$altura>1.70,]

#Guardar dataframe
write.table(table, 'tallita.csv', sep=',', row.names = FALSE)

table = read.table('tallita.csv', sep=',', header=TRUE)
table

table$IMC = table$peso / (table$altura ^ 2)
table

#Funciones en R
help(mean)
summary(table)
length(vector)
ncol(table)
nrow(table)
min(edades)
max(edades)
sort(edades)
mean(edades)
median(edades)
var(edades)
sd(edades)
sqrt(4)
sum(edades)
round(4.5)
rank(edades)
quantile(edades)
help(quantile)

#Ejercicios

###vectores
help(runif)
a <- runif(20)
a
#1
sum(a)
#2
mean(a)
sd(a)
#3
help(quantile)
quantile(a, probs=seq(0,1,0.10))
#4
a <= 0.25
#5
sum(a[a<=0.4])
#6
rnorm(20)
help(rnorm)
#7
sum(b) 
mean(b)
sd(b)
#8
a[a<b] #comparamos vectores indice por indice
length(a[a<b])
a
b
#9
c = c(1,2,3,4)
c[1] = 10
c

###Matrices
#1 y 2. Multiplicacion de matrices
a = matrix(c(1,2,3,4,5,6), nr=3, nc=2)
b = matrix(c(2,3,4,5), nr=2, nc=2)
a
b
a*b #casewise multiplication useful for vectorization
a %*% b #matrix multiplication

matmul = function(a,b) {
  result = tryCatch({
    y = a %*% b
    return(y)
  }, error=function(error_message) {
    message("No se puede calcular multiplicacion.")
    message("Debajo se muestra el error de R:")
    message(error_message)
    return(FALSE)
  })
}

matmul(a,b)

#3. Escriba una funci´on que toma 1 matriz A (cuadrada) y un entero n, y que devuelva la
#matriz A elevada a la potencia n.


matpow = function(a, n) {
  if(n == 1) {
    return(a)
  }
  return(a = a %*% matpow(a, n-1))
}

matpow(a,3)

#4. Escriba una funci´on sumCol que toma 1 matriz A, y que devuelva un vector cuyo elemento
#i sea la suma de elementos de la columna i de A.
sumCol = function(a) {
  v = c()
  count = 1
  for(j in a[1,]) {
    v[count] = sum(a[,count])
    count = count + 1
  }
  
  #for(i in 1:10) {
  #  print(i)
  #}
  
  return(v)
}

sumCol(a)



###Dataframes

#1. Cargue el dataset 1: d1 <- read.table("dataset1.txt", header = T)
table = read.table('dataset1.csv', sep=',', header=TRUE)
table
names(table)

#2.Obtenga las filas cuyo valor del atributo p1.palmitic es m´aximo.
table[table$p1.palmitic == max(table$p1.palmitic),]

#3. Obtenga el valor del atributo p1.palmitic para la data cuyo atributo l1.linoleic es m´ınima.
table[table$l1.linoleic == min(table$l1.linoleic),'p1.palmitic']

#4.Calcule el individuo promedio de este dataset, es decir, un individuo sint´etico (no existente) 
#  donde cada atributo sea el valor medio de este atributo en el dataset.

df <- data.frame('hi', 'bye')
names(df) <- c('hello', 'goodbye')

de <- data.frame('hola', 'ciao')
names(de) <- c('hello', 'goodbye')

df <- rbind(df, de)
df

individuo <- data.frame(mean(table[,1], na.rm = TRUE), mean(table[,2], na.rm = TRUE), mean(table[,3], na.rm = TRUE), 
                 mean(table[,4], na.rm = TRUE), mean(table[,5], na.rm = TRUE))
names(individuo) <- c('p1.palmitic', 'oleic', 'l1.linoleic', 'arachidic', 'eicosenoic')

individuo

#Anadimos al indiviuo en el dataset

table <- rbind(table, individuo)
table

#5. Cargue el dataset 2: d2 <- read.table("dataset2.txt", header = T)
table = read.table('dataset2.csv', sep=',', header=TRUE)

#6. ¿Que hace el comando levels(d2$eicosenoic)?
levels(table$eicosenoic)
help(levels)

#7. ¿Que hace el comando table(d2$eicosenoic)?
table(table$eicosenoic)

#8. ¿Que hace el comando is.na(d2$eicosenoic)?
is.na(table$eicosenoic)

#9. Reemplazar los NA con los valores medios de cada atributo
table$oleic = ifelse(is.na(table$oleic), ave(table$oleic, FUN = function(x) mean(table$oleic, na.rm = TRUE)), table$oleic)
