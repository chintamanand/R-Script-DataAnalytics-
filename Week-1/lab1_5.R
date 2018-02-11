a<-c(1,2,6,19,7,10,12)
max=0
n=0
for(i in 1:length(a))
{
 if(a[i]>max){
    max=a[i]
    n=i
 }
}
print(n)
