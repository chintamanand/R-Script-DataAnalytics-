library("ggplot")
head(iris)
#iris -sample data
height<-c(145,167,176,123,150)
weight<-c(51,63,64,40,55)
bmi<-cbind(height,weight)

hist(bmi,breaks = 5,main = "Histogram with Breaks")

hist(bmi,main = "Without breaks")

boxplot(iris$Sepal.Length ~ iris$Species)
box()
