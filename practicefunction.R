gt10<-function(x){
  use1<-x>10
  use1
  print(use1)
  x[use1]
}

gt10(seq(1:12))

#create a matrix
mat1<-matrix(c(10,20,30,40,50,60,10,30,50,70,90,110,10,40,70,100,130,160,10,50,90,130,170,210,10,60,110,160,210,260,10,70,130,190,250,310,10,80,150,220,290,360,10,90,170,250,330,410,10,100,190,280,370,460,10,110,210,310,410,510
),nrow=10,byrow=FALSE)
mat1
#add rownames and colnames
rownames(mat1)<-c("Day 1","Day 2","Day 3","Day 4","Day 5","Day 6","Day 7","Day 8","Day 9","Day 10")
colnames(mat1)<-c("R1","R2","R3","R4","R5","R6")

# Mean of each row 
mean(mat1[1,])

for(i in 1:nrow(mat1)){
  print(mean(mat1[i,]))
}
## Apply Function 
apply(mat1,1,mean)## 1 for row
apply(mat1,2,mean)# 2 for column 
apply(mat1,1,sum)  
apply(mat1,2,sum)

mat1.df<-data.frame(R1=c(10,20,30,40,50,60,10,30,50,70),R2=c(90,110,10,40,70,100,130,160,10,50),R3=c(90,130,170,210,10,60,110,160,210,260),R4=c(10,70,130,190,250,310,10,80,150,220),R5=c(290,360,10,90,170,250,330,410,10,100),R6=c(190,280,370,460,10,110,210,310,410,510))
mat1.df
mat1.df$Day<-as.factor(1:10)
mat1.df
mat1.df<-mat1.df[,c(7,1:6)]
mat1.df
apply(mat1.df,1,mean)
apply(mat1.df[,2:7],1,mean)
apply(mat1.df[1:10,-1],2,mean)
apply(mat1.df[,c(2,4,5)],1,mean)
# na.rm= TRUE 

mat1.df[6,7]<-NA
mat1.df
apply(mat1.df[,c(2:7)],1,mean)
apply(mat1.df[,c(2:7)],1,mean,na.rm=TRUE)


# create a function prop

Prop<-function(x)
{
x/max(x)
}

apply(mat1,2,Prop)
apply(mat1,1,Prop)

# lappy 
Diet.list<-list(Diet1=c(2,5,4,5,3,5,4,4,4,5),Diet2=c(8,5,6,5,7,7,6,8,8,3),Diet3=c(3,4,
                                                                                2,5,2,6,5,6,2,4),Diet4=c(2,23,2,5,2,4,3,5,7))
Diet.list
lapply(Diet.list,mean)

Diet.df<-data.frame(Diet1=c(2,5,4,5,3,5,4,4,4,5),Diet2=c(8,5,6,5,7,7,6,8,8,3),Diet3=c(3,4,
                                                                                      2,5,2,6,5,6,2,4),Diet4=c(2,2,3,2,5,2,4,3,5,7))
fix(Diet.df)
lapply(Diet.df,mean)
apply(Diet.df,2,mean)


# split functuon 
mtcars
cyl<-split(mtcars,mtcars$cyl)
cyl

lapply(cyl,function(x)mean(x$mpg))
unlist(lapply(cyl,function(x)mean(x$mpg)))

# tapply 

PatientID<-seq(30)
PatientID
Age<-c(32,45,44,34,23,26,37,45,12,23,44,35,57,65,76,43,42,34,36,37,23,21,28,24,29,13,18,32,25,28)
Age
Treatment<-c("a","c","c","b","b","b","c","b","c","a","a","a","a","a","b","b","b","b","c","c","c","a","b","c","b","a","a","c","a","c")
Treatment
mean(Age)
tapply(Age,Treatment,mean)
Med.df<-data.frame(PatientID,Age,Treatment)
Med.df
tapply(Med.df$Age,Med.df$Treatment,mean)
# In list we have to give name to each list so that we can access it using $ 
Med.list<-list(PatientID=PatientID,Age=Age,Treatment=Treatment)
Med.list
tapply(Med.list$Age,Med.list$Treatment,mean)

aggregate(Age~Treatment,Med.df,mean)










