height<-c(123,124,125,127)
weight<-c(125,126,127,128)
plot(height,weight,xlab="height1",ylab="weight")

x<-sort(rnorm(50))
y<-c(1:50)
plot(x,y,xlab="x-axis1",ylab="y-axis1",type="h",main="simplegraph",sub="subname")

points(x,cex=0.5,col="dark red")

head(iris)
boxplot(iris$Sepal.Length ~ iris$Species)

head(iris)
barplot(iris$Sepal.Length)
png("barplotting for sepallength.png",width=400,height=400,res=72)
z<-data.frame(y1=rnorm(100,1,0.3),y2=rnorm(100,0,0.4))
ch<-kmeans(z,2,iter.max= 15,nstart =1)
plot(z,col=ch$cluster)


