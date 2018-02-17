library("MASS")
#data set cats is available in library MASS.
data(cats)
#loads specified data set
head(cats)
summary(cats)
plot(Hwt ~ Bwt, data=cats)
cat.mod <- lm(Bwt ~ Hwt, data=cats)
#label is Bwt
summary(cat.mod)
testData<- data.frame(Hwt=3.5)
predict(cat.mod, testData)

