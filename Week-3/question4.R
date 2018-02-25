library(rpart)
df<-read.csv("C:/Users/mahe/Desktop/latest Lab3/lab3/spam.csv")
spam=data.frame(df)

summary(spam)

x=0.8*nrow(spam)
y=0.2*nrow(spam)
#z<-c(1:20)

fit<-rpart(make~ x+y , method = "class",data = spam)
print(summary(fit))
par(mfrow = c(1,2), xpd = NA)
plot(fit)
text(fit, use.n = TRUE, cex=0.65)

require(caTools)
set.seed(101) 
sample = sample.split(data$anycolumn, SplitRatio = .75)
train = subset(data, sample == TRUE)
test  = subset(data, sample == FALSE)

