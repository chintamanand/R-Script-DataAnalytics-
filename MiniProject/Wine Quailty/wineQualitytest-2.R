
#library(xlsx)

library("e1071")
library("outliers")
library("ggpubr")
setwd("F:/4thyear/Wine Quality")
data1<-read.csv(file="winequality-white.csv", header=TRUE, sep=";")
data2<-read.csv(file="winequality-red.csv",header=TRUE,sep=";")

summary(data1)
summary(data2)

a<-hist(x=data1$fixed.acidity,xlab="Fixed Acidity",col = "blue",border = "red")
b<-hist(x=data2$fixed.acidity,xlab = "Fixed Acidity",col="blue",border="red")

plot(data1$fixed.acidity,data1$alcohol ,main="Scatter Plot for data1 Acidity and  data1 Alcohol",xlab="data1",ylab="data2",xlim = c(6,8),ylim =c(10,12))

#Correlation between the Acidity and Alcohol Content 
# Correlation is find out the Association between the Variables.
#The valeus of Correlation Co-efficient lies in -1 to +1
#-1 -->indicates Negative Correlation
#+1 -->Indicates Positive COrrelation
#0 -->inidicates NO relationship between variables

res<-cor.test(data1$fixed.acidity  , data1$alcohol  , method="pearson")
print(res)
#result-1
#cor 
#-0.115031

res<-cor.test(data1$volatile.acidity , data1$alcohol  , method="pearson")
print(res)
#result-2
#cor
#0.06771794

res<-cor.test(data1$citric.acid , data1$alcohol  , method="pearson")
print(res)
#result-3
#cor
#-0.07572873 

res<-cor.test(data1$residual.sugar , data1$alcohol  , method="pearson")
print(res)
#result-4
#cor
#-0.4506312

res<-cor.test(data1$chlorides , data1$alcohol  , method="pearson")
print(res)
#result-5
#cor
#-0.3601887 

# Plot the chart.
boxplot(data1$alcohol~data1$volatile.acidity , data = data1, xlab = "volatile Acidity ",ylab = "alcohol", main = "BoxPlot for Predicated Data")

#Detect the Outliner
#the values which lies outside the 1.5*IQR(Inter Quartile Range - is the difference between 75th and 25th quartiles)
outlier_values <- boxplot.stats(data1$volatile.acidity)$out
#In this Graph it shows Many Outliers
boxplot(data1$volatile.acidity , main="Acidity ", boxwex=0.1)
mtext(paste("With Outliers: ", paste(outlier_values, collapse=", ")), cex=0.6)



outlierKD <- function(dt, var) {
  var_name <- eval(substitute(var),eval(dt))
  tot <- sum(!is.na(var_name))
  na1 <- sum(is.na(var_name))
  m1 <- mean(var_name, na.rm = T)
  par(mfrow=c(2, 2), oma=c(0,0,3,0))
  boxplot(var_name, main="With outliers")
  hist(var_name, main="With outliers", xlab=NA, ylab=NA)
  outlier <- boxplot.stats(var_name)$out
  mo <- mean(outlier)
  var_name <- ifelse(var_name %in% outlier, NA, var_name)
  boxplot(var_name, main="Without outliers")
  hist(var_name, main="Without outliers", xlab=NA, ylab=NA)
  title("Outlier Check", outer=TRUE)
  na2 <- sum(is.na(var_name))
  message("Outliers identified: ", na2 - na1, " from ", tot, " observations")
  message("Proportion (%) of outliers: ", (na2 - na1) / tot*100)
  message("Mean of the outliers: ", mo)
  m2 <- mean(var_name, na.rm = T)
  message("Mean without removing outliers: ", m1)
  message("Mean if we remove outliers: ", m2)
  response <- readline(prompt="Do you want to remove outliers and to replace with NA? [yes/no]: ")
  if(response == "y" | response == "yes"){
    dt[as.character(substitute(var))] <- invisible(var_name)
    assign(as.character(as.list(match.call())$dt), dt, envir = .GlobalEnv)
    message("Outliers successfully removed", "\n")
    return(invisible(dt))
  } else{
    message("Nothing changed", "\n")
    return(invisible(var_name))
  }
}
#function Call
outlierKD(data1, data1$volatile.acidity )
#give Answer Yes to Remove the Outliers

#---
#After Removing Outliers
outlier_values <- boxplot.stats(data1$volatile.acidity )$out
#In this Graph it shows Many Outliers
boxplot(data1$volatile.acidity , main="Acidity ", boxwex=0.1)
mtext(paste("Without Outliers: ", paste(outlier_values, collapse=", ")), cex=0.6)

#Apply linear Regression 
relation<-lm(data1$alcohol~data1$volatile.acidity )
print(relation)

#visulize the Relation
plot(data1$volatile.acidity ,data1$alcohol,col = "black",main = "Relationship between volatile Acidity  and alcohol Content",
     abline(lm(data1$alcohol~data1$volatile.acidity )),cex=1.2,pch = 19,xlab = "Acidity Level",ylab = "Alcohol Content")

a1<-data.frame(data1$volatile.acidity )
exp1<-predict.lm(relation,newdata = a1)
print(summary(exp1))

#for(i in 0:1000){
# exp1[i]=exp1[i]-1
#}

#this Predicated results for new data
hist(exp1)

#actual VAlues
hist(data2$alcohol)

res1<-data.frame(data2$alcohol[1:1000],exp1[1:1000])
write.csv(res1,"output4.csv")
#output4.csv file -->volatile.acidity





#---------------------------------------------------------------------------------------------------------------------------------------------------
#Applying Multi-Linear Regression
relation1<-lm(data1$alcohol~(data1$fixed.acidity+data1$citric.acid+data1$residual.sugar+data1$pH+data1$volatile.acidity+data1$chlorides))
print(relation1)

a2<-coef(relation1)
a2

#new data to predict the values
#data[numer of tuples,column Number]
acidity1<-data2[1:1000,1]
vacid1<-data2[1:1000,2]
citric1<-data2[1:1000,3]
rsugar1<-data2[1:1000,4]
cholride1<-data2[1:1000,5]
ph1<-data2[1:1000,9]


i=1
alcohol1=0;

for(i in 0:1000){
  alcohol1[i]=acidity1*a2[2]+citric1*a2[3]+rsugar1*a2[4]+ph1*a2[5]+vacid1*a2[6]+cholride1*a2[7]
}

alcohol1

# write the Result on CSV File
res3<-data.frame(data2$alcohol[1:1000],alcohol1)
write.csv(res3,"output2.csv")
