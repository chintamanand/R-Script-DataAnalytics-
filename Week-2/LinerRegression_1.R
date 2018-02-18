#Linear Regression
height <- c(145,167,176,123,150)
weight <- c(51,63,64,40,55)

relation<-lm(height ~ weight)
print(summary(relation))

a1<-data.frame(weight=c(23,90,101,130,60))
result<-predict(relation,a1)
print(summary(result))

plot(height,weight,col = "blue",type="p",main = "Height & Weight Regression",cex = 1.3,pch = 16,xlab = "Height in cm",ylab = "Weight in Kg")

png("Height & Weight Regression.png",width=500,height=500,res=72)
dev.off()
