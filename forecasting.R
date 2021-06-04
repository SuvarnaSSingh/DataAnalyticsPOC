install.packages("forecast",dependencies = TRUE)
library(forecast)


setwd("C:/R")
list.files()
demand<-read.csv("demandData-csv.csv")
demand

# for yearly data frequnecy 12 for quarterly it will be 3 
demand.ts<-ts(demand,frequency = 12,start = c(2014,1))
demand.ts
plot(demand.ts)
demand.forecast<-forecast(demand.ts)
demand.forecast
demand.forecast$method

detach("package:igraph",unload = TRUE)

decompose.demand<-decompose(demand.ts)
plot(decompose.demand)

# use data Airpassanger  data to practice and to understand the forecasting 
 
#arima() is used for advance forecasting read and practice 
