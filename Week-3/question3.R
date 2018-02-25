df<-read.csv("C:/Users/mahe/Desktop/latest Lab3/lab3/Titanic.csv")
Titanic=data.frame(df)

#question 1
mean(Titanic$Age[which(Titanic$PClass=="3rd")],y=NULL,na.rm = TRUE)
var(Titanic$Age,y=NULL,na.rm = TRUE)

#question 2
length(intersect(Titanic$Sex=="male",which(Titanic$Age=="NA" & Titanic$PClass== "1st")))

#question 3


