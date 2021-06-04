x<-c("a","b", NA,"C")
check<-complete.cases(x)

x<-x[check]
x


x<-list(a= 1:5)
x

lapply(x,mean)
