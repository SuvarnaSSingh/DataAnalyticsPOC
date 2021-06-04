install.packages("tidyverse")
library(tidyverse)
testdata<-read_csv("C:/R/data/Nutrition__Physical_Activity__and_Obesity_-_Women__Infant__and_Child.csv")



head(testdata)
str(testdata)

testdata<-testdata %>% gather(key="Age.monthgs",value="LocationID")

summary(testdata)
