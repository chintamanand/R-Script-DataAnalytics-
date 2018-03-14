#Tweet Analysis
install.packages("RColorBrewer")

install.packages("tm")
install.packages("wordcloud")
install.packages('base64enc')
install.packages('ROAuth')
install.packages('plyr')
install.packages('stringr')
install.packages('twitteR')
library(RColorBrewer)
library(wordcloud)
library(tm)
library(twitteR)
library(ROAuth)
library(plyr)
library(stringr)
library(base64enc)
install.packages("SnowballC")
library(SnowballC)
library(tm)

#Curl Certification

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

# Set constant requestURL
requestURL <- "https://api.twitter.com/oauth/request_token"
# Set constant accessURL
accessURL <- "https://api.twitter.com/oauth/access_token"
# Set constant authURL
authURL <- "https://api.twitter.com/oauth/authorize"

consumerKey <- "yVGUxYZG1Ynm0nobBA0yWkQrQ"
consumerSecret <- "LM77745elA46zvyEVEgl8rguywXBeEUQKTJr2szniRYWTZXoZl"
accessToken <- "2454630512-6jDtAQyUzdO8dZUoQodmlsOgWlhHcYJDbNxuDj0"
accessTokenSecret <- "OaU3ivvIe6smoRvHDVaRsqsEUsFPenIsAU6NPSpd9HmGe"

setup_twitter_oauth(consumerKey,
                    consumerSecret,
                    accessToken,
                    accessTokenSecret)

accessToken <- "2454630512-6jDtAQyUzdO8dZUoQodmlsOgWlhHcYJDbNxuDj0"
#Specify the Twitter Account name ,Number of Tweets Depends on the Twitter API.
# Specify the Language.
#Objectname <- searchTwitter("https://twitter.com/instagram", n=20, lang=NULL)

insta <- searchTwitter("#instagramlogo" ,n=200,lang = "en")
length (insta)

#Extract Tweet From PM MODI
tweet=userTimeline("@PMOIndia",n=100)

#Gives First 15 Tweets About the PMOINDIA
homeTimeline (n=15)
mentions (n=15)

insta_text <- sapply(insta, function(x) x$getText())

#a way to store the Documents in R
insta_text_corpus <- Corpus(VectorSource(insta_text))
insta_text_corpus <- tm_map(insta_text_corpus, content_transformer(tolower))
#Data Cleaning
insta_text_corpus <- tm_map(insta_text_corpus, removePunctuation)

insta_text_corpus <- tm_map(insta_text_corpus, removeWords, c("RT", "are","that","is"))

#Remove URL
removeURL <- function(x) gsub("http[[:alnum:]]*", "", x)
insta_text_corpus <- tm_map(insta_text_corpus, content_transformer(removeURL))
#Term Document Matrix
insta_2 <- TermDocumentMatrix(insta_text_corpus)
insta_2 <- as.matrix(insta_2)
insta_2 <- sort(rowSums(insta_2),decreasing=TRUE)

insta_2 <- data.frame(word = names(insta_2),freq=insta_2)
head(insta_2, 10)
barplot(insta_2[1:10,]$freq, las = 2, names.arg = insta_2[1:10,]$word,col ="yellow", main ="Most frequent words",
        ylab = "Word frequencies")

set.seed(1234)
wordcloud(insta_text_corpus,min.freq=1,max.words=80,scale=c(2.2,1), colors=brewer.pal(8, "Dark2"),random.color=T, random.order=F)
