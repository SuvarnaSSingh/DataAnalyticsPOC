z<-rnorm(10,2,0.5)
z
z[c(1,4,9)]
set.seed(2)
z<-rnorm(10,2,0.5)
z
z[1:5]
z[z>1.9]
z[z<2]
which(z<2)## it will give index of numbers which satisfy this condition 
z[which(z<2)]
matx<-matrix(1:12,nrow = 3,ncol = 4,dimnames=list(c("A","B","C"),c("X","Y","Z","W")),byrow = TRUE)
matx[3,2]
matx[,2]
matx[2,]
matx[3,c(1,3,4)]
matx[,1]-matx[,3]
matx[,1]+matx[,3]
## SUBSETS 

setwd("C:/R")
cricData<-read.csv("RPractice.csv")
cricData
str(cricData)
cricDataAus<-subset(cricData,Country=="Australia")
cricDataAus
#cricDataHighPrice<-Crickers Price >=1000000


cricDataHighPrice<-subset.data.frame(cricData,Price>=1000000)
cricDataHighPrice

# cricDataIndiaHighprice  Price >5000000 and country India 
cricDataIndiaHighPrice<-subset(cricData,Price>=500000&Country=="India")
cricDataIndiaHighPrice
clength<-length(cricDataIndiaHighPrice)
clength
# Player with the lowest price 
cricDataLowestPrice<-subset(cricData,Price ==min(Price))
cricDataLowestPrice
# Player with the Highest price 
cricDatahighestPrice<-subset(cricData,Price==max(Price))
cricDatahighestPrice

# Second Lowest Price 

cricDataSecondLowestPrice<-subset(cricData,Price ==sort(Price,TRUE)[2])
cricDataSecondLowestPrice
# Second Highest Price 
cricDataSecondHighestPrice<-subset(cricData,Price ==sort(Price,FALSE)[2])
cricDataSecondHighestPrice

# cricDataIndiaHighprice  Price >5000000 and country India  and display only Price and Country
cricDataIndiaHighPrice<-subset(cricData,Price>=500000&Country=="India" ,select = c(Price,Country))
cricDataIndiaHighPrice


##LOOPS 

#3^2, 4^2 , 5 ^2 
x<-c(3,4,5)

for(n in x){
  print(n^2)}

## accumumaltive sum 1,3,6,10 .15....55
s<-0
x1<-1:10
for(i in 1:10){
 s[i]<-sum(x1[1:i])
}
  print(s)
  
##WHILE 
  i<-1
  while(i<=10){
    i<-i+4
  }
  i
  # infinite loop  , break 
  
  
  i<-1
  while(1)
  {
  i<-i+4
  if(i>20)break
  }
  i
  
  
  
  
  








