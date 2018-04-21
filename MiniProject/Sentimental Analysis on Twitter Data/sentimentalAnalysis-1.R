# installing/loading the latest installr package:
#install.packages("installr"); library(installr) # install+load installr

#updateR()

#  Install Requried Packages
#install.packages("SnowballC")
#install.packages("tm")
#install.packages("twitteR")
#install.packages("syuzhet")

# Load Requried Packages
library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")

# Authonitical keys
consumer_key <- 'yVGUxYZG1Ynm0nobBA0yWkQrQ'
consumer_secret <- 'LM77745elA46zvyEVEgl8rguywXBeEUQKTJr2szniRYWTZXoZl'
access_token <- '2454630512-6jDtAQyUzdO8dZUoQodmlsOgWlhHcYJDbNxuDj0'
access_secret <- 'OaU3ivvIe6smoRvHDVaRsqsEUsFPenIsAU6NPSpd9HmGe'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

tweets <- userTimeline("GameOfThrones", n=200)

n.tweet <- length(tweets)
tweets.df <- twListToDF(tweets) 

head(tweets.df)

head(tweets.df$text)
#Tis contains a lot of URLs, hashtags and other twitter handles. 
#We will remove all these using the gsub function
tweets.df2 <- gsub("http.*","",tweets.df$text)

tweets.df2 <- gsub("https.*","",tweets.df2)

tweets.df2 <- gsub("#.*","",tweets.df2)

tweets.df2 <- gsub("@.*","",tweets.df2)

#after removing the http,httpss,#@
head(tweets.df2)

install.packages("rcpp")
#syuzhet library will divide the  emotion into 10 different emotions - 
#anger, anticipation, disgust, fear, joy, sadness, surprise, trust,
#negative and positive.
word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)

emotion.df2 <- cbind(tweets.df2, emotion.df) 

head(emotion.df2)
