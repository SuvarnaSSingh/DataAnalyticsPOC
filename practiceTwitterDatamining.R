install.packages("twitteR")
install.packages("RCurl",dependencies = TRUE)
require(twitteR)
require(RCurl)

data("mtcars")

mtcars$mpg

str(mtcars)
table(mtcars$cyl)

data("iris")
head(iris)
plot(x=iris$Petal.Length,y=iris$Petal.Width)

model1<-lm(formula = Petal.Width~Petal.Length, data=iris)
model1

summary(model1)

lines(x=iris$Petal.Length,y=model1$fitted.values,col="red",lwd=3)

read.table.ffdf
