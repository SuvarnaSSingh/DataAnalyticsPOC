install.packages("twitteR",dependencies = TRUE)
install.packages("bit",dependencies = TRUE)
install.packages("ROAuth",dependencies = TRUE)
install.packages("tm",dependencies = TRUE)
install.packages("wordcloud",dependencies = TRUE)
install.packages("httr",dependencies = TRUE)

library(twitteR)
library(bit)
library(ROAuth)
library(tm)
library(wordcloud)
library(RCurl)
library(httr)

#install.packages('base64enc')
#library(base64enc)



#devtools::install_version("httr", version="0.6.0", repos="http://cran.us.r-project.org")

# go to apps.twitter.com
reqURL<-"https://api.twitter.com/oauth/request_token"
accessURL<-"https://api.twitter.com/oauth/access_token"
authorizationURL<-"https://api.twitter.com/oauth/authorize"
consumerKey<-"XrUpaJZoZyaTDdVaGJs3pK9wz"
consumerSecret<-"G9D7ynHONDsUGk3auEcsn7AKSpmsx3LNDtPWGGjbGMJYDyrpi5"
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")
#twitCred<-OAuthFactory$new(consumerKey=consumerKey,consumerSecret=consumerSecret,requestURL=reqURL,accessURL=accessURL,authURL=authorizationURL)

twitCred<-OAuthFactory$new(consumerKey=consumerKey,
                           consumerSecret=consumerSecret,
                           requestURL=reqURL,
                           accessURL=accessURL,
                           authURL=authorizationURL)
#twitCred$handshake(cainfo=system.file("CurlSSL","cacert.pem",package ="RCurl"))
twitCred$handshake(cainfo=system.file("CurlSSL","cacert.pem",package="RCurl"))
8954238

accessToken<-"140639687-VUBqqHlbdUaDYWA2c3Q6TaFZuAMheZkkpK3hwWUG"
accessTokenSecret<-"5w8suRjTGnsvptvV35cTBuuXNT8g6WUavHcTyN6Qloo7W"

setup_twitter_oauth(consumerKey,consumerSecret,
                    accessToken,accessTokenSecret)
1
rdmTweets<-userTimeline("sachin_rt",n=200)
rdmTweets

setwd("C:/R")
write.csv(twListToDF(rdmTweets),"filetweets_srt13June.csv")
getwd()

rdmTweets[[1]]$text
rdmTweets[[1]]$created



for(i in 1 :15)
{
  print(
    rdmTweets[[i]]$text)
}

##converting tweets to data frame 

dfTweet<-do.call("rbind",lapply(rdmTweets,as.data.frame))
class(dfTweet)
dfTweet

mycorpus<-Corpus(VectorSource(dfTweet$text))

class(mycorpus)
inspect(mycorpus[20:31])
for(i in 1:length(mycorpus))
{
  print(mycorpus[[i]]$content)
}
## remove special characters 
removeSpecialcharacters<-function(x)gsub("[^[:alnum:]]"," ",x)


mycorpus<-tm_map(mycorpus,removeSpecialcharacters)## removes special characters

mycorpus<-tm_map(mycorpus,tolower)## converts to lowercase

inspect(mycorpus[20:31])

mycorpus<-tm_map(mycorpus,removePunctuation)## remove punctuations


mycorpus<-tm_map(mycorpus,removeNumbers)## remove numbers

removeURL<-function(x) gsub("http[[:alnum:]]*"," ",x)


mycorpus<-tm_map(mycorpus,removeURL)

## we are taking stop words from english and also adding aila as sachin tendulkar uses aila often

mystopwords<-c(stopwords("english"),"aila","anjali")

## how to remove some words from stop word list 
#mystopwordstoexcludedfromList<-setdiff(mystopwords,c("r","sensible"))


mycorpus<-tm_map(mycorpus,removeWords,mystopwords)

mycorpus<-tm_map(mycorpus,PlainTextDocument)

#myTDM<-TermDocumentMatrix(mycorpus,control=list(wordlengths=c(1,Inf)))
mycorpus <- Corpus(VectorSource(mycorpus))

myTDM<-TermDocumentMatrix(mycorpus,control=list(wordlengths=c(1,Inf)))



class(myTDM)

checkMatrix<-as.data.frame(as.matrix(myTDM))
write.csv(checkMatrix,"checkMatrix13June.csv")
getwd()

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

m<-as.matrix(myTDM)
wordFreq<-sort(rowSums(m),decreasing = TRUE)
set.seed(375)
greylevels<-grey((wordFreq+10)/(max(wordFreq)+10))
wordcloud(words=names(wordFreq),freq = wordFreq,min.freq = 3,random.order = FALSE,colors = rainbow(50))


rdmTweets<-searchTwitter("#unitedAirlines",n=500)
rdmTweets[[1]]$text


## Sentiment Analysis 
setwd("C:/R")

pos<-readLines("positive_words.txt")
neg<-readLines("negative_words.txt")

pos.matches<-match(names(wordFreq),pos)
neg.matches<-match(names(wordFreq),neg)
