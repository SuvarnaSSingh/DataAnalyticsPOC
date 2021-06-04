require(ggplot2)
data("diamonds")
head(diamonds)
str(diamonds)
ggplot(data = diamonds,aes(x=carat,y=price,color=color, shape=cut ,size=depth))+geom_point()


# Adding theme 
install.packages("ggthemes")
require(ggthemes)

g= ggplot(diamonds,aes(x=carat,y=price,color=color))+geom_point()
g

# wall street Journel theme 

g+theme_wsj()

# The economist

g+theme_economist()


# Edward Tufte

g+theme_tufte()


## Excel Theme 

g+theme_excel()

g+theme_excel()+scale_color_excel()

## ggvis
install.packages("ggvis")
require(ggvis)
data("cocaine")
head(cocaine)
ggplot(cocaine,aes(x=weight,y=price ))+geom_point()


## pipes --> dplr 
## input is on  the left side of the pipe
cocaine %>% ggvis(x= ~weight, y= ~price) %>% layer_points()


# fill command 
cocaine %>% ggvis(x= ~weight, y= ~price,fill=~potency) %>% layer_points()


# stroke command 


cocaine%>%ggvis(x=~weight,y=~price,fill:='green',stroke=~potency) %>% layer_points()

## smoothing curve 
cocaine %>% ggvis(x= ~weight,y= ~price,fill= ~potency) %>% layer_points() %>% layer_smooths()

##Add slider 

cocaine %>% ggvis(x= ~weight,y= ~price,fill= ~potency ,size:=input_slider(10,100),opacity:=input_slider(0,1)) %>% layer_points()

### RCHARTS 


install.packages("devtools")
require(devtools)
require(devtools)
install_github('rCharts', 'ramnathv')

R.Version()
### steps to handle the rCharts installation problem 
library(downloader)
download("https://github.com/ramnathv/rCharts/archive/master.tar.gz", "rCharts.tar.gz")
install.packages("rCharts.tar.gz", repos = NULL, type = "source")
require(rCharts)


head(iris)
names(iris)=gsub("\\.","",names(iris))
names(iris)


# Scatter plot of Price vs carat by color 

rPlot(data=diamonds,price ~carat | color,color="color",type ="point")

# bar plot 

## it should be regressed on categotrical variable and not number or char variable  asyou can do group by on categorial variables as you have defined categories ( i.e factor )
rPlot(data=diamonds,price ~ cut | color , color ="color" , type ="bar")
str(diamonds)
























