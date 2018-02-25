#multiple linear regression 
df<-read.csv("C:/Users/mahe/Desktop/latest Lab3/lab3/spam.csv")
spam=data.frame(df)
summary(spam)
predict1<-lm(dollar ~ money + bang,data = spam,x=T)
summary(predict1)

#testData<-data.frame(2.5)
#predict(predict,testData)
