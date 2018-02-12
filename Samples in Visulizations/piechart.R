

require(grDevices)
#pie chart
x<-c(15,65,25,25)
label1<-c("pencils","pens","erasers","sharpners")
png(file = "sales of stationary items")
pie(x,labels = label1,main = "sales of stationary items")
#dev.off()


# Simple Pie Chart
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")
