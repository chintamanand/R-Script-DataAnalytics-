#navie Bayes Classifier
library(e1071)

attach(iris)
data<-head(iris)
relation<-naiveBayes(iris$Sepal.Length ~.,data=iris)
print(summary(relation))

#predication using the new data
predict1<-predict(relation,iris$Species)
print(summary(predict1))

