require(ggplot2)
data("diamonds")
head(diamonds)

# Word of caution!! Eg two lines below shows  how not to combine all in one as output does not make much senense 

# it will not show any data 
ggplot(data=diamonds,aes(x=carat,y=price,color=color,shape=cut ,size=depth))

# to get data 
ggplot(data=diamonds,aes(x=carat,y=price,color=color,shape=cut ,size=depth))+geom_point()


## ADDing THEME 
require(ggthemes)
g<-ggplot(diamonds,aes(x=carat,y=price,color=color))+geom_point()
g
## wall street journal
g+theme_wsj()

## THe Economists 
g+theme_economist



# Edward Tufte
g+theme_tufte()

# Excel Theme 

g+theme_excel()+scale_color_excel()

## ggvis package 

require(ggvis)
data("cocaine")
head(cocaine)
tail(cocaine)

ggplot(cocaine,aes(x=weight,y=price))+geom_point()

# pipes--> dplyr 
## This is a D3.js chart 
### dplyr is for data manipulation 
##%>% means anything on left hand side is input to right hand side 

cocaine %>% ggvis(x=~weight,y=~price) %>% layer_points()

## fill command 

cocaine %>% ggvis(x=~weight,y=~price,fill =~potency) %>% layer_points()

#Stroke command 

cocaine %>% ggvis(x = ~weight,y = ~price, stroke =~potency) %>% layer_points()

# fill and stroke 

cocaine %>% ggvis(x = ~weight,y = ~price, fill:='green',stroke =~potency) %>% layer_points()

# Smoothing Curve


cocaine %>% ggvis(x = ~weight, y = ~price, fill = ~potency) %>% layer_points() %>% layer_smooths()

#Add a user input using slider 

cocaine %>% ggvis(x=~weight,y=~price, fill=~potency,size := input_slider(10,100),opacity:=input_slider(0,1)) %>% layer_points()

#################RCHARTS ############
install.packages("devtools")
  require(devtools)
install_github("rCharts", "ramnathv")
require(rCharts)
head(iris)

names(iris)

names(iris) = gsub("\\.","",names(iris))


# scatter plot 

data("diamonds")
head(diamonds)
rPlot(data= diamonds ,price~carat|color,color="color",type="point")

# bar chart 
rPlot(data= diamonds ,price~cut|color,color="color",type="bar")


## MAPS .....!

map1=Leaflet$new()

map1$setView(c(51.505,-.09),zoom = 13)
map1

map2=Leaflet$new()
map2$setView(c(13.043,77.64),zoom=14)
map2$marker(c(13.043,77.642), bindPopup = "<p>This is where Rohit lives ..<p>")
map2$marker(c(13.05,77.621), bindPopup = "<p>This is where Rohit works ..<p>")
map2


## SHINY 















