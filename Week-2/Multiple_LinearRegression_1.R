#multiple Regression

attach(mtcars)
head(mtcars)

# subset of mtcar(built in dataset)
input<-mtcars[,c("mpg","disp","hp","wt")]
print(input)

head(input)
relation<-lm(mpg~disp+hp+wt,data = input)
print(summary(relation))

#in the summary, we will get the co-effcient results,these value can be used to 
#predicate the new values by just multiply each with its correspoding co-efficient

