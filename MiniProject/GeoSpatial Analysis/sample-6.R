
# TO Work on ShapeFiles in R
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
#to work with shap files
library(raster)        

data(crime) 

india<-getData('GADM', country='IND', level=1)  
plot(india) 

names(india)
#gives The State Names
unique(india$NAME_1)

SouthStates<-subset(india,NAME_1=="Andhra Pradesh" | NAME_1=="Tamil Nadu" | NAME_1=="Karnataka"  | NAME_1=="Kerala")
plot(SouthStates)

#to give only the Subset of "Andhra Pradesh"
andhra<-subset(india,NAME_1=="Andhra Pradesh")
plot(andhra)

mySquad1<-data.frame(
  Names=c("murder","theft","suicide","Robbery","Protest","burglary","theft","auto theft","Protest","Protest","suicide","murder","theft","theft","Protest"),
  Location=c("Hyderabad, Telangana","srinagar Jammu and Kashmir","pune, Maharashtra","chennai, Tamil Nadu","Manipal, Karnataka"," Jaipur ,Rajasthan"," Shimla , Himachal Pradesh "," Kakinada, Andhra Pradesh"," Leh , Jammu and Kashmir", " Jammu , Jammu and Kashmir"," Chandigarh, Punjab"," Mumbai, Maharashtra "," Rajahmundry,Andhra Pradesh"," Kochi , Kerala","Coimbatore,Tamil Nadu"),stringsAsFactors=FALSE)

mySquad1

for(i in 1:9){
  temp1<-geocode(mySquad1$Location[i])
  mySquad1$lon[i]<-temp1$lon
  mySquad1$lat[i]<-temp1$lat 
}
mySquad1

map1<-plot(india)    
map1+points(mySquad1$lon,mySquad1$lat,col="red",pch=16) 
