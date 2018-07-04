
#install.packages('ggmap') 
#install.packages('sp')
#install.packages("tmap")
#install.packages("tmaptools")
#install.packages("sf")
#install.packages("leaflet")
#install.packages('Rcpp')
library("tmap")
library("tmaptools")
library("sf")
library("leaflet")

library(ggmap)
library(sp)
library(Rcpp)

data(crime)
#it gives the All Column Names
names(crime)
str(crime)
#plotiing the Latitude->lat on X-axis and Longitude->long on Y-axis
plot(crime$lon,crime$lat,xlab="longitude",ylab="latitude")

#plotting on Google Maps
HoustonMap<-qmap("houston", zoom = 14) 
HoustonMap+geom_point(aes(x = lon, y = lat), data = crime)

HoustonMap+geom_point(aes(x = lon, y = lat, colour = offense),data = crime)+ggtitle("Map of Crime in Houston")
