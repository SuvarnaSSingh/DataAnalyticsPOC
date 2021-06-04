install.packages("ggplot2")
require(ggplot2)

install.packages("lubridate")
require(lubridate)

install.packages("scales")
require(scales)

install.packages("ggthemes")
require(ggthemes)

install.packages("ggvis")
require(ggvis)

install.packages("devtools")
require(devtools)

install_github("rCharts", "ramnathv")
require(rCharts)

install.packages("graphics")
require(graphics)

install.packages("reshape2")
require(reshape2)

# check about work done my hadley in data science on google 
install_github("hadley/bigvis")
require(bigvis)

install.packages("shiny")
require(shiny)

require(ggplot2)

data("diamonds")
head(diamonds)
str(diamonds)
# Histogram
hist(diamonds$carat)
hist(diamonds$carat, main="Histogram of carat frequencies",xlab="Carat")

# scattered Ploat 

plot(diamonds$carat,diamonds$price)

plot(price~carat,data=diamonds,main="Price V/s Carat")


boxplot(diamonds$carat)


summary(diamonds$carat)


require(ggplot2)
data("diamonds")


ggplot()+ geom_point()+geom_histogram()

ggplot(data=diamonds)+geom_histogram(aes(x=carat))

ggplot(data=diamonds)+geom_histogram(aes(x=carat),binwidth = 0.1)

#Density Plot


ggplot(data=diamonds)+geom_density(aes(x=carat))


ggplot(data=diamonds)+geom_density(aes(x=carat),fill="grey50")


# scatter plots

ggplot(data=diamonds,aes(x=carat,y=price))

ggplot(data=diamonds,aes(x=carat,y=price))+geom_point()

g= ggplot(data=diamonds,aes(x=carat,y=price))


g+geom_point()
