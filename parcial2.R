setwd('D:/Users/DOMINIC/Desktop/UPC VIII/Administracion de informacion/Semana 2')
dir()

boxplot(c(1,2,3,3),c(2,5))
hist(c(1,1,3))

pie(c(1,2,3))

pie(summary(factor(c('hola', 'chau', 'chau'))))


#Graficos de 2 variables

#boxplots

#Para mostrar un boxplot de la variable 1 para cada valor posible de la variable 2, la variable 
#1 debe ser num´erica y la variable 2 ser cualitativa:

#boxplot(variable1 numerica ~ variable2 cualitativa)

#Grafico de dos dimensiones
plot(1,2)


#cumulative boxplot
#Un diagrama de “Cumulative boxplot”permite estudiar dos variables cualitativas
# plot(factor(variable cualitativa1), factor(variable cualitativa2))

#Graficos de 3 variables
#Boxplots Aqu´ı mostramos un boxplot para la variable 1 para cada combinaci´on de las variables 2 y
#3:
# boxplot(variable numerica1 ~ (variable cualitativa2 + variable cualitativa3))

#Consejo: El n´umero de cajas puede llegar a ser r´apidamente importante; 
#el conjunto suele ser m´as legible horizontalmente, y colocando las etiquetas de los ejes en la horizontal:

#boxplot(variable numerica1 ~ (variable cualitativa2 + variable cualitativa3), horizontal = TRUE, las = 2)

#Ejercicio

#1. El dataframe esta guardado en el archivo ogm.csv. Cargue este archivo, ¿Cuales son las
#variables que disponemos? ¿Son cuantitativas o cualitativas?
  
table = read.table('ogm.csv', sep=',', header=TRUE)
table

#2. Represente gr´aficamente el numero de ratas de cada uno de los 4 grupos (grupo de 0 %,
#11 %, 22 % y 33 % de OGM respectivamente). ¿Podemos explicar por qu´e el n´umero de
#ratas es m´as importante en el grupo del 0 %?

plot(factor(table$ogm))

#3. Represente gr´aficamente la distribuci´on de ratas macho y hembra en los 4 grupos.

plot(factor(table$ogm), factor(table$sexo))
  

#4. Represente gr´aficamente el tama˜no del h´ıgado seg´un la cantidad de OGM presente en la
#dieta de las ratas.

plot(factor(table$ogm), table$higado)

#5. Cree las variables g0, g11, g22 y g33 que contienen las filas de la tabla correspondiente a
#las ratas alimentadas con 0 %, 11 %, 22 % y 33 % de OGM, respectivamente.

g0 = table[table$ogm == 0,]
g1 = table[table$ogm == 11,]
g2 = table[table$ogm == 22,]
g3 = table[table$ogm == 33,]
g0
g1
g2
g3

#6. En esta especie de rata, se considera que el peso del h´ıgado es anormal si supera los 17
#gramos. Agregue una nueva columna a la tabla que indique para cada rata si el peso del
#h´ıgado es anormal o no.

table$anormal = table$higado>17
table

#7. Represente gr´aficamente la distribuci´on normal / anormal del h´ıgado dentro de cada uno
#de los 4 grupos.

plot(factor(table$ogm), factor(table$anormal))

#8. Compare el peso promedio en el h´ıgado de las ratas en el grupo sin OGM con el de las
#ratas en el grupo del 11 % de OGM, luego el 22 % y el 33 %.

p1 = mean(table$higado[table$ogm==0])
p2 = mean(table$higado[table$ogm==11])
p3 = mean(table$higado[table$ogm==22])
p4 = mean(table$higado[table$ogm==33])

p1
p2
p3
p4


