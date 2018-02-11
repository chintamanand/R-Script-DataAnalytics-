a<-c(1,2,3,4,6,8,10,5,3,14,24)
#my.b<-readline(prompt="enter the number to divide: ")
#c<-as.integer(my.b)
c=2
n=0
i=0
for(i in 1:length(a)){
 if((a[i]%%c)==0){
 n=n+1
 } 
}

    print(n)