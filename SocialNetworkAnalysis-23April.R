## For this read the graph thory chapters sent by teacher 


install.packages("igraph",dependencies = TRUE)
library(igraph)
setwd("C:/R")
list.files()
advice_data_frame<-read.table("High-Tec-edgelist-Advice.txt")
friendship_data_frame<-read.table("High-Tec-edgelist-Friendship.txt")
reports_data_frame<-read.table("High-Tec-edgelist-ReportsTo.txt")


# head,tail,fix to look at the data 

attributes<-read.csv("High-Tec-Attributes.csv")

head(advice_data_frame)
# Giving column headings 
colnames(advice_data_frame)<-c("ego","alter","advice_tie")
colnames(friendship_data_frame)<-c("ego","alter","friendship_tie")
colnames(reports_data_frame)<-c("ego","alter","reports_to_tie")

head(advice_data_frame)

# Check the ego and alter are the same across data sets 

which(advice_data_frame$ego !=friendship_data_frame$ego)
which(advice_data_frame$alter !=friendship_data_frame$alter)
which(reports_data_frame$alter !=friendship_data_frame$alter)


# Combine into a single data frame 

hi_tech_full_data_frame<-data.frame(ego=advice_data_frame[,1],alter=advice_data_frame[,2],advice_tie=advice_data_frame[,3],friendship_tie=friendship_data_frame[,3],reports_to_tie=reports_data_frame[,3])

# data processing 


hi_tech_full_non_zero_edges<-subset(hi_tech_full_data_frame,advice_tie>0 |friendship_tie>0 |reports_to_tie>0)


nrow(hi_tech_full_non_zero_edges)

#graph object 

hi_tech_full<-graph.data.frame(hi_tech_full_non_zero_edges)

hi_tech_full
class(hi_tech_full)
summary(hi_tech_full)
get.edge.attribute(hi_tech_full,'advice_tie')

#add attributes

attributes
attributes<-cbind(1:length(attributes[,1]),attributes)
attributes
hi_tech_full<-graph.data.frame(d=hi_tech_full_non_zero_edges,vertices = attributes)

summary(hi_tech_full)

getwd()
#Visualize the network 
pdf("hi_tech_full_1.pdf")
plot(hi_tech_full)
dev.off()

# advice only 

hi_tech_advice_only<-delete.edges(hi_tech_full,E(hi_tech_full)[get.edge.attribute(hi_tech_full,name ="advice_tie")==0])

pdf("hi_tech_advice.pdf")
plot(hi_tech_advice_only)
dev.off()

#reports_to_only

hi_tech_report_only<-delete.edges(hi_tech_full,E(hi_tech_full)[get.edge.attribute(hi_tech_full,name ="reports_to_tie")==0])
pdf("hi_tech_reports.pdf")
plot(hi_tech_report_only)
dev.off()


#friendship_only

hi_tech_friendship_only<-delete.edges(hi_tech_full,E(hi_tech_full)[get.edge.attribute(hi_tech_full,name ="friendship_tie")==0])
pdf("hi_tech_friendship.pdf")
plot(hi_tech_friendship_only)
dev.off()

