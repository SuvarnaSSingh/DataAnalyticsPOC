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

## HISTOGRAM  ### shows values on X axis and its frequencies on Y axis  

hist(diamonds$carat)
hist(diamonds$carat,main = "Histogram of Carat Frequencies",xlab = "carat")

## scatter plots ## generally used in regression where we want to find relation between two variables 

plot(diamonds$carat,diamonds$price)

## in the below fucntion  first argement is depedant on the first one so price is depedant on carat means it changes as per carat values 
plot(price~carat,data=diamonds,main="Price V/s Carat")


##It is used to  show spread of values /data
## BOX Plot 
## in box plot center box shows 50% of the data and line in box is mean line 
# two horizontal lines are top and bottom whiskers 
## and outliars are above or  below whiskers 
boxplot(diamonds$carat)

##  you can use summary fucntion either on sigle variable or on entire data set 
summary(diamonds$carat)


### To load ggplot2
require(ggplot2)
## we use + geom in ggplot to add layers 
ggplot()+geom_point()+geom_histogram()
aes(x,y)
## histogram
ggplot(data=diamonds)+geom_histogram(aes(x=carat))

##binwindth = maximum-minimum/30
ggplot(data=diamonds)+geom_histogram(aes(x=carat),binwidth = 0.5)

ggplot(data=diamonds)+geom_histogram(aes(x=carat),binwidth = 0.1)

# density plot 
ggplot(data=diamonds)+geom_density(aes(x=carat))


ggplot(data=diamonds)+geom_density(aes(x=carat),fill="grey50")

## scatter plots
# it is like work horse of stastical modelling 

ggplot(data=diamonds,aes(x=carat,y=price))


## we will add geom_point layer to actually get data  to blank screen
ggplot(data=diamonds,aes(x=carat,y=price))+geom_point()


## to avoid more typing we can store previous layers of ggplot in variables and can  use them 

g=ggplot(data=diamonds,aes(x=carat,y=price))

g+geom_point()
## To add color  based on price diamond color 
head(diamonds)
g+geom_point(aes(color=color))

## Share 
g+geom_point(aes(color=color,shape=cut ))


# box plot violin ploat

ggplot(data = diamonds,aes(y=carat))+geom_boxplot()

# above gives errror as x variable is not given.
ggplot(data = diamonds,aes(y=carat ,x=1))+geom_boxplot()

head(diamonds)

# to cut the data in different box plots by giving x= cut 
ggplot(data = diamonds,aes(y=carat ,x=cut))+geom_boxplot()

## ordering the boxplot based on median values of carat~size

median_diamonds=aggregate(carat~cut,diamonds,median,na.rm= TRUE)
head(median_diamonds)
median_diamonds=median_diamonds[order(median_diamonds$carat),]
head(median_diamonds)



a<-as.character(median_diamonds$cut)
ggplot(data=diamonds,aes(y=carat,x=cut))+geom_boxplot()+scale_x_discrete(limit=a)

##VIOLIN PLOTS 

ggplot(data=diamonds,aes(y=carat,x=cut))+geom_violin()
g=ggplot(data=diamonds,aes(y=carat,x=cut))

g+geom_point()+geom_violin()
 g+geom_violin()+geom_point()
g+geom_jitter()+geom_violin()
g+geom_violin()+geom_jitter()
























