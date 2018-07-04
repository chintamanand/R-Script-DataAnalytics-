

library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(stringr)
library(dplyr)
library(tmap)
library(maptools)
library(sp)
#install.packages("dismo")
library(dismo)

data(World)
qtm(World)
sessionInfo()

#Work from here
mumbaimap<-qmap("mumbai",zoom=16)

#it also Gives the Same Mumbai(satellite View) using DIfferent Function from "dismo" Package
gmap("washington",type="satellite",exp=3)

#geocoding-->Given the Address code them in Longitude and Latitude
geocode("West Point, NY")

geocode('1600 Pennsylvania Avenue Northwest, Washington, DC 20500')

#to plot ur friend on map
mySquad1<-data.frame(
  Names=c("Kiran","Nihkil","karan","gowthi","Ranga","KG","Dhinakar","Abhiroop","Amruth"),
  Location=c("Boston, MA","Chicago, IL","Atlanta, GA","Portland, OR","Albuquerque, NM",
             "Dallas, TX","St Louis, MO","Miami, FL","San Francisco, CA"),stringsAsFactors=FALSE)

mySquad1

for(i in 1:9){
  temp1<-geocode(mySquad1$Location[i])
  mySquad1$lon[i]<-temp1$lon
  mySquad1$lat[i]<-temp1$lat 
}
mySquad1

