install.packages("igraph",dependencies = TRUE)
library(igraph)
setwd("C:/R")

list.files()

reports_data_frame<-read.table("High-Tec-edgelist-ReportsTo.txt")
advice_data_frame<-read.table("High-Tec-edgelist-Advice.txt")
friendship_data_frame<-read.table("High-Tec-edgelist-Friendship.txt")

hightechattribute<-read.csv("High-Tec-Attributes.csv")
head(advice_data_frame)
colnames(advice_data_frame)<-c("ego","alter","advice_tie")
colnames(reports_data_frame)<-c("ego","alter","reports_to_tie")
colnames(friendship_data_frame)<-c("ego","alter","friendship_tie")
head(advice_data_frame)
head(reports_data_frame)
head(friendship_data_frame)

which(advice_data_frame$ego !=reports_data_frame$ego)

# combine into single data frame 


hi_tech_full_data_frame<-data.frame(ego=advice_data_frame[,1],alter=advice_data_frame[,2],advice_tie=advice_data_frame[,3],friendship_tie=friendship_data_frame[,3],reports_to_tie=reports_data_frame[,3])

# data processing 


hi_tech_full_no_zero_edges<-subset(hi_tech_full_data_frame,advice_tie>0|friendship_tie>0|reports_to_tie>0)

nrow(hi_tech_full_data_frame)
nrow(hi_tech_full_no_zero_edges)

# graph object 

hi_tech_ful<-graph.data.frame(hi_tech_full_no_zero_edges)

hi_tech_ful

class(hi_tech_ful)
str(hi_tech_ful)
summary(hi_tech_ful)
get.edge.attribute(hi_tech_ful,'advice_tie')

## add attributes 
hightechattribute

hightechattribute<-cbind(1:length(hightechattribute[,1]),hightechattribute)

hightechattribute
hi_tech_ful<-graph.data.frame(d=hi_tech_full_no_zero_edges,vertices = hightechattribute)

summary(hi_tech_ful)

# visualize the netwrok 
getwd()
pdf("hi_tech_full1_June16.pdf")
plot(hi_tech_ful)
dev.off()


# advice only 
hi_tech_advice_only <-delete.edges(hi_tech_ful,E(hi_tech_ful)[get.edge.attribute(hi_tech_ful,name = "advice_tie")==0])


pdf("hi_tech_advice_June16.pdf")
plot(hi_tech_advice_only)
dev.off()



hi_tech_reports_only <-delete.edges(hi_tech_ful,E(hi_tech_ful)[get.edge.attribute(hi_tech_ful,name = "reports_to_tie")==0])


pdf("hi_tech_report_June16.pdf")
plot(hi_tech_reports_only)
dev.off()


hi_tech_frindship_only <-delete.edges(hi_tech_ful,E(hi_tech_ful)[get.edge.attribute(hi_tech_ful,name = "friendship_tie")==0])


pdf("hi_tech_friendship_June16.pdf")
plot(hi_tech_frindship_only)
dev.off()

























