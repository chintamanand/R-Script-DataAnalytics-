#To Predict Car Accessibility
#install.packages("caret")
#install.packages("rpart.plot")

library(rpart)
library(rpart.plot)
library(caret)
library(e1071)

data_url <- c("https://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data")
download.file(url = data_url, destfile = "car.data")

car_df <- read.csv("car.data", sep = ',', header = FALSE)


set.seed(3033)
intrain <- createDataPartition(y = car_df$V7, p= 0.7, list = FALSE)
training <- car_df[intrain,]
testing <- car_df[-intrain,]

dim(training)
dim(testing)
summary(car_df)

trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3333)
dtree_fit <- train(V7 ~., data = training, method = "rpart",
                   parms = list(split = "information"),
                   trControl=trctrl,
                   tuneLength = 10)
print(dtree_fit)

pre<-predict(dtree_fit, newdata = testing[1,])
print(pre)
