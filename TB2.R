setwd("D:/Users/DOMINIC/Desktop/UPC VIII/Administracion de informacion/Semana 10/ufcdata")
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

  

## Weighted average

weigthedAverage = function(data, weight, index) {
  df = data
  wa = rep(0, nrow(data))
  for(i in 1:3) {
    wa = wa + (weight[i] * df[,index[i]]) / sum(weight)
  }
  df$wa = wa
  return(df) 
}

weight = c(1,2,1)

View(weigthedAverage(data, weight, indices))


## Maximin

maximin = function(data, index) {
  df = data
  mn = rep(0, nrow(data))
  for(i in 1:nrow(data)) {
    mn[i] = df[,index[1]][i]
    for(j in 2:3) {
      if(mn[i] > df[,index[j]][i]) {
        mn[i] = df[,index[j]][i]
      }
    }
  }
  df$minVal = mn
  return(df)
}

View(maximin(data, indices))


## Minimax

minimax = function(data, index) {
  df = data
  mn = rep(0, nrow(data))
  for(i in 1:nrow(data)) {
    mn[i] = df[,index[1]][i]
    for(j in 2:3) {
      if(mn[i] < df[,index[j]][i]) {
        mn[i] = df[,index[j]][i]
      }
    }
  }
  df$maxVal = mn
  return(df)
}

View(minimax(data, indices))


## Leximin

leximin = function(data, indices) {
  df = data
  lex = t(data.frame(rep(0, nrow(data)), rep(0, nrow(data)), rep(0, nrow(data))))
  a = c(1,2,3)
  for(i in 1:nrow(data)) {
    for(j in 1:3) {
      a[j] = df[,indices[j]][i]
    }
    a = sort(a, decreasing = FALSE)
    for(j in 1:3) {
      lex[j,i] = a[j]
    }
  }
  for(j in 1:3) {
    str=sprintf("hi%d",j)  
    df[str] = lex[j,]
  }
  return(df)
}

View(leximin(data, indices))




