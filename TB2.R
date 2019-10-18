setwd("C:/Users/operador/Downloads/ufcdata")
getwd()
dataset <- read.csv("data.csv", fileEncoding = "latin1")
View(dataset)

##Obtains specific rows

data = dataset[, c("R_fighter","B_fighter", "date", "Winner", "no_of_rounds", "B_current_win_streak", "R_current_win_streak")]

View(data)


# normalizacion lineal

normalize = function(data, index) {
  for(i in index) {
    data[,index] = ((data[,index] - min(data[, index])) / (max(data[,index]) - min(data[,index])))
  }
  return(data)
}

## normalizamos

K = 10
indices = c(5,6,7)
data = normalize(data, indices)

# visualizamos los 10 primeros

View(head(data,K))

nrow(data)
wa = seq(1, nrow(data))  
we = seq(1, 3)
we
sum(we)
data$wa = wa
View(data)

## Weighted average

weigthedAverage = function(data, weight, index, ite) {
  df = data
  wa = seq(1, nrow(df))  
  for(i in ite) {
     wa = (wa + (weight[index] * df[,index])) / sum(weight) 
  }
  return(wa) 
}

weigthedAverage(data, c(1,2,1), indices, 3)
