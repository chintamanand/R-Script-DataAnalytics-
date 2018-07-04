
#to Depict th Indian Population
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

set.seed(100)
State_count = length(india$NAME_1)
score_1 = sample(100:1000, State_count, replace = T)
score_2 = runif(State_count, 1,1000)
score = score_1 + score_2
State_data = data.frame(id=india$ID_1, NAME_1=india$NAME_1, score)
State_data

#we need to COnvert the Shape File into the DataFrames
fortify_shape = fortify(india, region = "ID_1")
class(fortify_shape)

#merge the Shapefile and data created(Population Data)
Merged_data = merge(fortify_shape, State_data, by="id", all.x=TRUE)
Map_plot = Merged_data[order(Merged_data$order), ]

ggplot() +
  geom_polygon(data = Map_plot,
               aes(x = long, y = lat, group = group, fill = score),
               color = "black", size = 0.5) +
  coord_map()
