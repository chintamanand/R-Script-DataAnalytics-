#Basic Learning
install.packages("package_ name")
library("package_name")

x<-"hello world"
x
y<- TRUE
y
z<-2.1e3
z
c<-3+2i
c

cat(x)

mode(x)
mode(y)
print(class(y))
mode(z)

is.numeric(z)
print(is.logical(y))
is.complex(c)
is.character(x)

length(x)
length(y)
length(c)

#Only single line Comments are allowed in R
#for Multiple Line
if(FALSE){
 "This how we can make a multiple line 
   as it consider it as a program flow "
}

#any value that ended with the 'L',then value will be stored as Integer.

str2<-charToRaw("DataAnalytics")
str2

#class can be userdefined
class(str2)
class(str2)<-"newClass"
class(str2)

#vector
data2<-c("apple1","pine2","pine2","orange")
data3<-c("pen","pencil","eraser")

#factor
data<-c("apple","pine","pine","orange")
factdata<-factor(data)
factdata
class(factdata)
is.character(factdata)
print(nlevels(factdata))

#array
a1<-array(c("green","blue"),dim = c(3,3,3))
a1
class(a1)
mode(a1)
typeof(a1)
a2<-array(c(1,2,3,4,5),dim=4)
a2
a3<-array(c("green","blue"),dim = 5)
a3

#list
l1<-list(c(1:5),"anand",165L)
l1
typeof(l1)
class(l1)
mode(l1)

#matrices
M = matrix( c('a','a','b','c','b','a'), nrow = 3, ncol = 3, byrow = TRUE)
print(M)

#dataframe:-method-1
bmi<-data.frame(
  gender=c("male","female","male"),
  height=c(192.5,182,126),
  age=c(20,20,19)
)
print(bmi)

#method-2
gender=c("male","female","male")
height=c(192.5,182,126)
age=c(20,20,19)
f<-data.frame(gender,height,age)
print(f)
length(f)
mode(f)

#variable
var.1=c(1,2,3,4,5)
var.2<-c("Hi","Bye")
print(var.1)
cat("The value present in the variable will be:",var.1,"\n")
cat("The value present in the variable will be:",var.2,"\n")
#it will print all the avaible variables
print(ls())
