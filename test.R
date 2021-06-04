install.packages("dslabs")
install.packages("dplyr")
library(dslabs)
library(dplyr)
data(heights)
data(heights2)
options(digits = 3)   

   
   setwd ("C:/SINGH/SuvarnaWork/Data")
   tail(heights)
   
   avgheight <- mean(heights$height)
     
   ind1 <-(heights$height >avgheight)
   sum(ind1)
   ind2 <-(heights$sex=="Female")
  mean(ind2)
  sum(ind2)
  t<-heights[which.min(heights$height)]
  t$height
tt<-heights [match(t$height,heights$height),1]
tt

hmax<-heights[which.max(heights$height),2]
hmin<-heights[which.min(heights$height),2]


r1 <-heights$height <  hmax
sum(r1)
  r2<- heights$height > hmin
  sum(r2)
  results <- r1&  r2
  
  heights$height[results]
  
  heights2 <- mutate( heights,ht_cm=heights$height*2.54)
  heights2$ht_cm[18]
  mean(heights2$ht_cm)
  
  females<- filter(heights2,sex=="Female")
  
  mean(females$ht_cm)
  
