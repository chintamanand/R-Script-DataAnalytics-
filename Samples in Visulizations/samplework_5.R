# Visualization
plot(1,5)

#Sample Graph
height<-cbind(90,103,100,123,150,185)
weight<-cbind(65,50,55,60,75,85)
#histogram
plot(height,weight,type = "h" ,xlab = "height",ylab = "weight")
#line plot
plot(height,weight,type = "l" ,xlab = "height",ylab = "weight")
#stair steps
plot(height,weight,type = "s" ,xlab = "height",ylab = "weight")

bmi<-cbind(height,weight)
write.csv(bmi,file = "BMI.csv",row.names = FALSE)
