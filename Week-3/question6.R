#question 6 using clustering algorithm
#library(ggplot2)
df<-read.table("C:/Users/mahe/Desktop/latest Lab3/lab3/3D_spatial_network.txt")
spatial<-data.frame(df)
summary(spatial)

#ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()
set.seed(20)
spatialCluster <- kmeans(spatial[, 1:6], 4, nstart = 20)
spatialCluster

#attach(iris)
#plot(Sepal.Length ~ Sepal.Width,data = subset(iris,Species== "setsosa"))
