#question 1

df <- read.csv("C:/Users/mahe/Desktop/latest Lab3/lab3/Wine_data.csv")
wine=data.frame(df)

#cor<-cor(wine,method ="pearson" )
cor1<-(which.max(cor(wine,method ="pearson" )))
print(floor(cor1))

#question 2
highest<-length(wine$quality>7)
print(highest)

#question 4
mean(wine$pH)
