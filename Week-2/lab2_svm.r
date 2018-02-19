library("e1071")
head(iris,10)

x<-subset(iris,select = -Species)
print(x)
y<-c(iris$Species)
print(y)

svm = svm(x,y)
print(summary(svm))

pred = predict(svm,subset(iris,select= -Species))
print(table(pred,Species))

