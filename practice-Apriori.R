install.packages('arules')
install.packages('arulesViz')
library(arules)
library(arulesViz)
data("Groceries")
Groceries
class(Groceries)
Groceries@data
Groceries@itemInfo
Groceries@itemsetInfo
itemFrequencyPlot(Groceries,topN=20,type="absolute")
                  
for (i in 1:20){
 print(paste(Groceries@itemInfo[Groceries@data[,i],"labels"],collapse = ","))
}

itemset<-apriori(Groceries@data,parameter =list(minlen=2, maxlen=3,support= 0.03,target="frequent itemsets"))
inspect(head(sort(itemset,by="support"),10))
myRules <-apriori(Groceries@data)