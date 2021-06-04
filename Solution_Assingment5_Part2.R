install.packages("aplore3")
library(aplore3)
data("glow500")
glow500

trainingDataGLOW<-glow500
trainingDataGLOW
nrow(trainingDataGLOW)

# took row 500 as test data and modified columns age and priorfrac
testingDataGLOw<-glow500[500,]
testingDataGLOw
testingDataGLOw$age<-65
testingDataGLOw$priorfrac<-"Yes"
testingDataGLOw$fracture<-"No"
testingDataGLOw
class(trainingDataGLOW)
summary(trainingDataGLOW)

glow500.lm<-glm(fracture ~.,family = binomial(link="logit"),data =trainingDataGLOW)

glow500.predict<-predict(glow500.lm,testingDataGLOw,type="response")
glow500.predict
testingDataGLOw
install.packages("ROCR",dependencies = TRUE)
library(ROCR)

# create a prediction object for ROCR package
pred.glow500.lm<-prediction(glow500.predict,testingDataGLOw$fracture)

# Performance object 
perf.lm<-performance(pred.glow500.lm,"tpr","fpr")
perf.lm1<-performance(pred.glow500.lm,"prec","acc")


# Perf.lm@7 value 

# Plot the ROC 
plot(perf.lm,xlim=c(0,1),ylim=c(0,1))



