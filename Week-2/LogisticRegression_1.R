#logistic Regression

attach(mtcars)
head(mtcars)

# subset of mtcar(built in dataset)
input<-mtcars[,c("mpg","am","disp","hp","wt")]
print(input)

head(input)
relation<-glm(formula = am ~ cyl + hp + wt,data=input,family = binomial())
print(summary(relation))
