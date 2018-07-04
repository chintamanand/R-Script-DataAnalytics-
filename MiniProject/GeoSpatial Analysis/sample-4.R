
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(stringr)
library(dplyr)
geocode("West Point, NY")

mySquad<-data.frame(
  Names=c("Bill","Dave","Liz","Cody","Austin","Amber","Jimmy","Mike","Amanda"),
  Location=c("Boston, MA","Chicago, IL","Atlanta, GA","Portland, OR","Albuquerque, NM",
             "Dallas, TX","St Louis, MO","Miami, FL","San Francisco, CA"),stringsAsFactors=FALSE)

mySquad

for(i in 1:9){
  temp<-geocode(mySquad$Location[i]) #Geocode each location and store it in temp
  mySquad$lon[i]<-temp$lon           #Assign the lon
  mySquad$lat[i]<-temp$lat           #Assign the lat
}

mySquad

US<-qmap("United States",zoom=4,color="bw")

US+
  geom_point(aes(x = lon, y = lat),color="red",data = mySquad)+
  annotate('text', x=mySquad$lon, y=mySquad$lat+1, label = mySquad$Names, colour = I('red'), size = 4)+
  ggtitle("My Squad")
