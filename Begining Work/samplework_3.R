#variables
v <- c( 2,5.5,6)
t <- c(8, 4)
#it gives error as no of values are less.
z<-v+t
print(z)

v <- c( 2,5.5,6)
t <- c(8, 3, 4)
z<-v^t
print(z)

v <- c(2,5.5,6,9)
t <- c(8,2.5,14,9)
print(v!=t)

#generating the sequence
seq(1,10,0.25)

#repeating value
rep(1,10)

#sequence 
sequence(4:5)

#statistics
#gaussian 
rnorm(10,mean = 5,sd=1)
#exponential
rexp(1,rate = 5)
#possion
rpois(1,3)

#if Case
x<-30L
y<-33L
if(is.integer(x)==TRUE && is.integer(y)==TRUE){
 print("Both x and y are same")
}else{
  print("Both x and y are not same")
}

#switch Case
x <- switch(
  2,
  "first",
  "second",
  "third",
  "fourth"
)
print(x)

#for-loop
v <- LETTERS[1:14]
for ( i in v) {
  print(i)
}

#while
v <- c("Hello")
cnt <- 2
while (cnt <= 5) {
  print(v)
  cnt = cnt + 1
}

#function
new.func<-function(a){
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}

# Call the function new.function supplying 6 as an argument.
new.func(6)
  

