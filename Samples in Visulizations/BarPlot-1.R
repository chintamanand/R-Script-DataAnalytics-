
var.1<-c(2,5,1,6,7,2,3,4)
var.2<-c(1,5,2,1,4,2,3,1)

#barplot(var.1,xlab = "x-axis",ylab ="y-axis")
png(file = "barchart-1.png")

var.3<-cbind(var.1,var.2)

barplot(var.3,xlab = "x-axis",ylab ="y-axis")

