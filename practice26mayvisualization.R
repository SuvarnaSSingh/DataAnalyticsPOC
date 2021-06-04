install_github("rCharts", "ramnathv")
require(rCharts)

install.packages("graphics")
require(graphics)

install.packages("reshape2")
require(reshape2)
install_github("hadley/bigvis")
require(bigvis)

install.packages("shiny")
require(shiny)
require(ggplot2)
data("diamonds")
head(diamonds)
str(diamonds)

input<-read.csv("C:/R/TennisAnalysis/Data/AusOpen-men-2013 -updated.csv")
str(input)


# histogram
# we use histogram when  we have one single contineous variable 
# freqnecy on y axix and value on X 

hist(diamonds$carat,main="histogram of Carat Frequency",xlab = "Carat")

# scatterplot 
# we use scatter plot when we try to find realationship between two variables 
plot(diamonds$carat,diamonds$price)
plot(price~carat,data = diamonds,main="Price VS Carat")

## Box plot 

## like histogram trying to study one variable 
# shows spread of values 

boxplot(diamonds$carat)

## GGPLOT 

ggplot(data=diamonds)+geom_histogram(aes(x=carat))


ggplot(data=diamonds)+geom_histogram(aes(x=carat),binwidth = 0.3)

# density plot 
ggplot(data = diamonds)+geom_density(aes(x=carat))


ggplot(data = diamonds)+geom_density(aes(x=carat) ,fill="grey50")
 
## scatter plot 
ggplot(data=diamonds,aes(x=carat,y=price))+geom_point()

g=ggplot(data=diamonds,aes(x=carat,y=price))

g+geom_point()

# add color 
g+geom_point(aes(color=color))
# add share 

g+geom_point(aes(color=color,shape=cut))


# boxplot and violin plot 



ggplot(data=diamonds,aes(x=1,y=carat))+geom_boxplot()
ggplot(data=diamonds,aes(x=cut,y=carat))+geom_boxplot()

## shiny 










































