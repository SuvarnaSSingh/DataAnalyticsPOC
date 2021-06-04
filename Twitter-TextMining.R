# # logistic regression:
#   
# install.packages("ROCR",dependencies = TRUE)
# 
# #For text mining:
#   
# install.packages("twitteR")
# install.packages("bit")
# install.packages("ROAuth")
# install.packages("tm",dependencies = TRUE)
# install.packages("wordcloud")
# install.packages("RCurl")
# library(ROCR)
# library(twitteR)
# library(bit)
# library(ROAuth)
# library(tm)
# library(wordcloud)
# library(RCurl)
# # Go to twitter .com
# requestURL<-"https://api.twitter.com/oauth/request_token"
# accessURL<-"https://api.twitter.com/oauth/access_token"
# authorizationURL<-"https://api.twitter.com/oauth/authorize"
# consumerKey<-"iaTYOmr5QXFHot2hSmVXUltWz"
# consumerSecret<-"BUhftZSjJWJLMREqsnfyliIXcQdHtzOxCYoexFdFFIyFgsEeYz"
# download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")
# 
# # create authorization object 
# twitCred<-OAuthFactory$new(consumerKey=consumerKey,consumerSecret=consumerSecret,requestURL=requestURL,accessURL=accessURL,authURL=authorizationURL)
# 
# 
# twitCred$handshake(cainfo=system.file("CurlSSL","cacert.pem",package = "RCurl"))



#####

install.packages("twitteR",dependencies = TRUE)
install.packages("bit",dependencies = TRUE)
install.packages("ROAuth",dependencies = TRUE)
install.packages("tm",dependencies = TRUE)
install.packages("wordcloud",dependencies = TRUE)

library(twitteR)
library(bit)
library(ROAuth)
library(tm)
library(wordcloud)
library(RCurl)
#go to apps.twitter.com
reqURL<-"https://api.twitter.com/oauth/request_token"
accessURL<-"https://api.twitter.com/oauth/access_token"
authURL<-"https://api.twitter.com/oauth/authorize"

consumerKey<-"iaTYOmr5QXFHot2hSmVXUltWz"
consumerSecret<-"BUhftZSjJWJLMREqsnfyliIXcQdHtzOxCYoexFdFFIyFgsEeYz"

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

twitCred<-OAuthFactory$new(consumerKey=consumerKey,
                           consumerSecret=consumerSecret,
                           requestURL=reqURL,
                           accessURL=accessURL,
                           authURL=authURL)

twitCred$handshake(cainfo=system.file("CurlSSL","cacert.pem",package="RCurl"))
9857601

accessToken<-"140639687-vVHUYWDZmgxTCs3KsvQWQ3aNxbIdJCCZHPY9tWRk"
acessTokenSecret<-"i0ZpaJGdzZgVTOZVPOjjVDkA1AsQi4O4fk9L3DPFXI2ht"


setup_twitter_oauth(consumerKey,consumerSecret,
                    accessToken,acessTokenSecret)
1
# to get tweets from timeline of partiucular 
#<-userTimeline("sachin_rt",n=200)

# to get tweets for particular 
rdmTweets<-searchTwitter("#unitedairlines",n=500)


rdmTweets
class(rdmTweets)
getwd()
setwd("c:/R")
write.csv(twListToDF(rdmTweets),"filetweets_srt.csv")

rdmTweets[[1]]$text
rdmTweets[[1]]$created
for(i in 1:15){
  print(rdmTweets[[i]]$text)
}
# Cnverting tweets to dataframes 
dfTweets<-do.call("rbind",lapply(rdmTweets,as.data.frame))
class(dfTweets)
##Corpus means  collection of texts 
#tweets to be converted to texts as data mining can not be done on data frames or lists 
myCorpus<-Corpus(VectorSource(dfTweets$text))
class(myCorpus)
inspect(myCorpus)
inspect(myCorpus[20:31])
for(i in 1 :length(myCorpus))
{
  print(myCorpus[[i]]$content)
}

myCorpus<-tm_map(myCorpus,tolower)

# remove special characters 
removeSpecial<-function(x)gsub("[^[:alnum:]]"," ",x)
myCorpus<-tm_map(myCorpus,removeSpecial)
inspect(myCorpus[2])

myCorpus<-tm_map(myCorpus,tolower)# converts to lower case 

inspect(myCorpus[20:31])
myCorpus<-tm_map(myCorpus,removePunctuation) #  removes punctuaction

myCorpus<-tm_map(myCorpus,removeNumbers)

removeURL<-function(x)gsub("http[[:alnum:]]*"," ",x)

myCorpus<-tm_map(myCorpus,removeURL)

mystopWords<-c(stopwords("english"))

## if we want to stop/filter specifc additional words for eg, sachin tendulkar says aila many times ans we want to remove it 

mystopWords<-c(stopwords("english"),"aila","anjali")

# when you want certail words to be excluded from stop words  means to be included in for mining 
#mystopWords<-setdiff(mystopWords,c("r","data","sensible"))
myCorpus<-tm_map(myCorpus,removeWords,mystopWords)
#myCorpus<-tm_map(myCorpus,PlainTextDocument)
#myCorpus<-tm_map(myCorpus,PlainTextDocument)

#To fix it  add below line of code after this :

myCorpus <- Corpus(VectorSource(myCorpus))

#and then create term document matrix .It will resolve the issue.
myTDM<-TermDocumentMatrix(myCorpus,control=list(wordlengths=c(1,Inf)))


#myTDM<-TermDocumentMatrix(myCorpus,control = list(wordlengths=c(1,Inf)))

class(myTDM)
checkMatrix<-as.data.frame(as.matrix(myTDM))
write.csv(checkMatrix,"checkMatrix.csv")

##  looking at a portion of term document matrix 
idx<-which(dimnames(myTDM)$Terms == "a")# Check the documentation for TDM
idx
inspect(myTDM[idx+(0:5),101:110])
findMostFreqTerms(myTDM,lowfreq =5)
termFrequnecy<-rowSums(as.matrix(myTDM))
termFrequnecy<-subset(termFrequnecy,termFrequnecy>=10)
barplot(termFrequnecy)

## this line is for Sachin's tweet
#findAssocs(myTDM,'india',0.35)

## this line is for tweets's for united airlines 
# we commented sachin's line earlier as we used common code for sachin and united airlines tweet
findAssocs(myTDM,'video',0.25)

# Drawing  a wordcloud 
 m<-as.matrix(myTDM)
wordFreq<-sort(rowSums(m),decreasing = TRUE)
set.seed(375)
greylevels<-grey((wordFreq+10)/(max(wordFreq)+10))
wordcloud(words=names(wordFreq),freq = wordFreq,min.freq = 3,random.order = FALSE,colors = rainbow(50))

# Sentiment Analysis 

setwd("C:/R")
pos<-readLines("positive_words.txt")
neg<-readLines("negative_words.txt")
pos.matches<-match(names(wordFreq),pos)
neg.matches<-match(names(wordFreq),neg)

# get the position of the matched term, we just want  a TRUE or a False 

pos.matches<-!is.na(pos.matches)
neg.matches<-!is.na(neg.matches)

# final score 

score<-sum(pos.matches)-sum(neg.matches)
score
#stemming means update and updating updates are same words and should not be considered separately in
# text mining this requires 3 to 4 packages and professor has  given a chapter on it read it and practice 



