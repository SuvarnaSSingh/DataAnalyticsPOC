setwd("C:/SINGH/Suvarna/PracticeR")
wineData<-read.csv("Wine.csv")
wineData
class(wineData)
wineData[is.na(wineData)]<-0
wineData
install.packages("skmeans",dependencies=TRUE)
library(skmeans)
?skmeans
skmeans
# as skmeans data in rows whereas we have customers data in columns hence 
# transposing it . Also we just need customer data  so removing other 
#columns 
wineData.transposed<-t(wineData[,8:107])
wineData.transposed
wineData.clusters<-skmeans(wineData.transposed,5,method = "genetic")
wineData.clusters
wineData.clusters$cluster
wineData.clusters$membership
wineData.clusters$m
wineData.clusters$value
wineData.clusters$call
wineData.clusters$prototypes
wineData.clusters$cluster[1]
wineData.clusters$cluster[which(row.names(wineData.transposed)=="Wright")]
wineData.clusters$cluster[which(row.names(wineData.transposed)=="Barnes")]
R.version()
R.version
# to achieve same as top offers which we did in excel 
# to get result same as excel where we have offerers in row and cluster in column 
aggregate(wineData.transposed,by=list(wineData.clusters$cluster),sum)
#Did -1 to remove the first column as then we need to combine columns from winedata and clustercount to be same as excel which we have seen earlier 

winedata.clusterCounts<-t(aggregate(wineData.transposed,by=list(wineData.clusters$cluster),sum)[,-1])
winedata.clusterCounts
wineData.desc.counts<-cbind(wineData[,1:7],winedata.clusterCounts)
wineData.desc.counts
# to sort based on column no 8  i.e based on cluster 1 then same way can do  for cluster 2 , 3 ,4 ,5  - sign is given for descending sorting 
wineData.desc.counts[order(-wineData.desc.counts[,8]),]
write.csv(wineData.desc.counts[order(-wineData.desc.counts[,8]),],"Cluster1.csv")
write.csv(wineData.desc.counts[order(-wineData.desc.counts[,9]),],"Cluster2.csv")
write.csv(wineData.desc.counts[order(-wineData.desc.counts[,10]),],"Cluster3.csv")
write.csv(wineData.desc.counts[order(-wineData.desc.counts[,11]),],"Cluster4.csv")
write.csv(wineData.desc.counts[order(-wineData.desc.counts[,12]),],"Cluster5.csv")

install.packages("cluster" ,dependencies=TRUE)
library(cluster)
plot(silhouette(wineData.clusters))
# pam function is very smilar to k median clustering 
wineData.cluster.pam<- pam(wineData.transposed,5)
wineData.cluster.pam

clusplot(wineData.cluster.pam)

