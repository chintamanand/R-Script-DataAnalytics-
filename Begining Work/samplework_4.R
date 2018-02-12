#About strings
a<-"hi"
b<-"Hello"
c<-"how are u"

#combine
print(paste(a,b,c,sep="-"))

#touppercase and tolowercase
print(toupper(b))
print(tolower(b))

#in strings space is recorded as the character
#substring
substring(c,4,7)

#count of characters
print(nchar(c))
print(nchar(substring(c,4,7)))

# Create two vectors.
v1 <- c(3,8,4,5,0,11)
v2 <- c(4,11,0,8,1,2)

# Vector addition.
add.result <- v1+v2
print(add.result)

# Vector substraction.
sub.result <- v1-v2
print(sub.result)

# Vector multiplication.
multi.result <- v1*v2
print(multi.result)

# Vector division.
divi.result <- v1/v2
print(divi.result)

v <- c("Red","Blue","yellow","violet")
sort.result <- sort(v)
print(sort.result)

# Sorting character vectors in reverse order.
revsort.result <- sort(v, decreasing = TRUE)
print(revsort.result)
