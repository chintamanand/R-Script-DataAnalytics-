x <- data.frame(y1=rnorm(100, sd = 0.3),y2=rnorm(100, sd = 0.4))
ch<- kmeans(x, 2)
# 2 clusters
plot(x, col = ch$cluster)
points(ch$centers, col = 1:2, pch = 8, cex = 2)
#using ggplot
#ggplot(x, aes(y1,y2, color = ch$cluster)) + geom_point()
  #another example
  #ch<- kmeans(x, 5, nstart = 25)
  #plot(x, col = ch$cluster)
  #points(ch$centers, col = 1:5, pch = 8)