setwd('D:/Users/DOMINIC/Desktop/UPC VIII/Administracion de informacion/Semana 3')
dir()
#Ejercicio

table = read.table('herbicide.csv', sep=',', header=TRUE)

#1. Calcule la tasa de plantas sobrevivientes para cada experimento y agr´eguela a una nueva
#columna en la tabla (columna 6).

table$tasa = ((table$nb_plantas_sobrevivientes * 100)/table$nb_plantas)/100
table

#2. ¿Cu´antos experimentos dieron menos del 5 % de las plantas sobrevivientes?

gg = table$tasa[table$tasa < 0.05] # returns a vector

gg2 = table[table$tasa<0.05,] # returns a matrix

length(gg)
nrow(gg2)

#3. Sea un control que corresponde a la ausencia de herbicida. Extraiga las filas de la tabla que
# corresponden a este control y col´oquelas en una nueva variable que llamaremos ¸control”.

control = table[table$herbicida=='ninguno',]

#4. Calcule la media y la desviaci´on est´andar del porcentaje de plantas que han sobrevivido
# en el control.

mean(control$tasa)
sd(control$tasa)

#5. De la misma manera, calcule el porcentaje promedio de plantas que han sobrevivido
# para cada uno de los tres herbicidas. ¿Qu´e herbicida crees que es el m´as efectivo a nivel
# mundial?

herb1 = mean(table$tasa[table$herbicida=='herbicida1'])
herb2 = mean(table$tasa[table$herbicida=='herbicida2'])
herb3 = mean(table$tasa[table$herbicida=='herbicida3'])

herb1
herb2
herb3

#6. ¿Qu´e planta es la que tiene la mejor resistencia a los herbicidas, en general?

trigo = table[table$planta == 'trigo',]
trigo = trigo[trigo$herbicida != 'ninguno',]
agropiro = table[table$planta == 'agropiro',]
agropiro = agropiro[agropiro$herbicida != 'ninguno',]
enredadera = table[table$planta == 'enredadera',]
enredadera = enredadera[enredadera$herbicida != 'ninguno',]

trigi = mean(trigo$tasa)
agri = mean(agropiro$tasa)
enredi = mean(enredadera$tasa)

trigi 
agri 
enredi

#7. ¿Cu´ales son las variables en este estudio? ¿De qu´e tipo son: num´erico, cualitativo ordenado, cualitativo no ordenado?
#Cualitativo y numerico

#8. Dibuje un histograma que represente la tasa de plantas sobrevivientes.
hist(table$tasa)

count = length(omg$tasa[omg$tasa >= 0.4 & omg$tasa <= 0.6])
countv = omg[which(omg$tasa >= 0.4 & omg$tasa <= 0.6),]
countv
count

#9. Haga un gr´afico que muestre la tasa de supervivencia seg´un la especie de planta. En
#general, ¿qu´e especie es mejor en los tres herbicidas?

plot(factor(table$planta), table$tasa)

#10. Dibuje un gr´afico de la tasa de sobrevivientes por herbicida. En general, ¿qu´e herbicida
# parece m´as efectivo?
nocontrol = table[table$herbicida != 'ninguno',]
plot(factor(nocontrol$herbicida), nocontrol$tasa)
  
#11. Haga un gr´afico la tasa de sobrevivientes por herbicida y especies de plantas. Comente
# sobre la efectividad de cada herbicida en cada tipo de planta.

boxplot(nocontrol$tasa ~ (nocontrol$herbicida + nocontrol$planta))

