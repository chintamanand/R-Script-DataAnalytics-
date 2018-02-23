#data
x1<- c(7,7,3,1)
x2<- c(7,4,4,4)
y <- c(1,1,2,2) #label
df<- cbind(x1,x2) #train dataset
testDF<- c(3,7) #test dataset
pred<- knn(train = df, test = testDF, cl = y, k=3)
pred 
#shows the label of test data

