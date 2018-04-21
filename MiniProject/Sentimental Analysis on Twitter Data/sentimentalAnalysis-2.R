#install.packages("Rcpp")
#install.packages("twitteR",dependencies=T)
#install.packages("sentiment")
library("twitteR")
library(plyr)
library(shiny)
library(tm)
library(xlsx)
library(RColorBrewer)
library(wordcloud)
library(ggplot2)
library(sentiment)

reqURL <- "https://api.twitter.com/oauth/request_token"

accessURL <- "http://api.twitter.com/oauth/access_token"

authURL <- "http://api.twitter.com/oauth/authorize"

# Authonitical keys
api_key <- 'yVGUxYZG1Ynm0nobBA0yWkQrQ'
api_secret <- 'LM77745elA46zvyEVEgl8rguywXBeEUQKTJr2szniRYWTZXoZl'
access_token <- '2454630512-6jDtAQyUzdO8dZUoQodmlsOgWlhHcYJDbNxuDj0'
access_token_secret <- 'OaU3ivvIe6smoRvHDVaRsqsEUsFPenIsAU6NPSpd9HmGe'

setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

setwd("F:/4thyear/7thsemester")
neg = scan("negative-words.txt", what="character", comment.char=";")
pos = scan("positive-words.txt", what="character", comment.char=";")

#function name score.sentiment with(,,)
score.sentiment = function(tweets, pos.words, neg.words)
  
{
  
  require(plyr)
  require(stringr)
  #laply function applies function to all and combine them into Array
  scores = laply(tweets, function(tweet, pos.words, neg.words) {
    
    #x<- tutorial
    #gsub("tu","to",x)
    
    #gsub("pattern to match","On match replaces them",string or string Vector(data),igonre.case=TRUE)
    tweet = gsub('https://','',tweet) # removes https://
    tweet = gsub('http://','',tweet) # removes http://
    tweet=gsub('[^[:graph:]]', ' ',tweet) ## removes graphic characters 
    #like emoticons 
    tweet = gsub('[[:punct:]]', '', tweet) # removes punctuation 
    tweet = gsub('[[:cntrl:]]', '', tweet) # removes control characters
    tweet = gsub('\\d+', '', tweet) # removes numbers
    tweet=str_replace_all(tweet,"[^[:graph:]]", " ") 
    
    tweet=gsub('@\\w+','',tweet)
    tweet=gsub('http\\w+','',tweet)
    tweet=gsub("^\\s+|\\s+$", "", tweet)
    
    # makes all letters lowercase
    tweet = tolower(tweet) 
    
    # splits the tweets by word in a list
    word.list = str_split(tweet, '\\s+') 
    
    words = unlist(word.list) # turns the list into vector
    
    pos.matches = match(words, pos.words) ## returns matching 
    #values for words from list 
    neg.matches = match(words, neg.words)
    
    #is.na function gives TRUE,if null or Missing values are present are else FALSE.
    pos.matches = !is.na(pos.matches) ## converts matching values to true of false
    neg.matches = !is.na(neg.matches)
    
    score = sum(pos.matches) - sum(neg.matches) # true and false are 
    #treated as 1 and 0 so they can be added
    
    return(score)
    
  }, pos.words, neg.words )
  
  scores.df = data.frame(score=scores, text=tweets)
  
  return(scores.df)
  
}

tweets = searchTwitter('GameofThrones',n=2500)
Tweets.text = laply(tweets,function(t)t$getText())
# gets text from Tweets
head(Tweets.text,5)

analysis = score.sentiment(Tweets.text, pos, neg) 
# calls sentiment function
head(analysis,5)

hist(analysis$score)

write.csv(analysis, "myResults.csv")

