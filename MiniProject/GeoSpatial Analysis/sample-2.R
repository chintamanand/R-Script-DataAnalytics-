
#install.packages("mapdata")
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)

#ggplot2 provides the map_data() function.
usa <- map_data("usa")

dim(usa)

#geom_polygon() draws with no line color, but with a black fill
#geom_polygon() drawn lines between points and “closes them up” 
#i.e. draws a line from the last point back to the first point
gg1 <- ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = "violet", color = "blue") + 
  coord_fixed(1.3)
gg1
#ggplot() + geom_polygon(data = usa, aes(x=long, y = lat, group = group),fill=NA) +coord_fixed(1.3)


labs <- data.frame(
  long = c(-122.064873, -122.306417),
  lat = c(36.951968, 47.644855),
  names = c("SWFSC-FED", "NWFSC"),
  stringsAsFactors = FALSE
)  

gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 5) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 4)

ggplot() + 
  geom_polygon(data = usa, aes(x=long, y = lat), fill = "violet", color = "blue") + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 5) +
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 4) +
  coord_fixed(1.3)
