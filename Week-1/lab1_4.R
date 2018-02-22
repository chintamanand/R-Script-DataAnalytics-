#takes Input
n1<-as.integer(readline("Nos you want to enter? "))

a <- vector(mode="numeric", length=n1)

for (i in 1:n1)
{
 
 a[i]<-as.integer(readline("Enter the number "))

}


n2<-as.integer(readline("Nos you want to enter? "))

b <- vector(mode="numeric", length=n2)

for (i in 1:n2)
{
 b[i]<-as.integer(readline("Enter the number "))
}

d<-intersect(a,b)

if(length(d)==0)
{
print("The sets are disjoint")
}

if(length(d)!=0)
{
 print("The sets are not disjoint")
}
