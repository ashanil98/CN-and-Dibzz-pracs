
library(e1071)
library(caret)
data <- read.csv("svmdata.csv", header = TRUE)
data
plot(data, pch=16)
model <- lm(Y ~ X, data)
abline(model)
# make a prediction for each X

predictedY <- predict(model, data)

#dev.off()
# display the predictions
points(data$X, predictedY, col = "blue", pch=4)
model$residuals #positive/negative distance from linear line

#SVM CLASSIFIER 
??svm
model <- svm(Y ~ X , data)

predictedY <- predict(model, data)

points(data$X, predictedY, col = "red", pch=4)

model$residuals

###########################################
####MulticlassSVM####
iris_mdl = svm(Species ~ ., data=iris, header=T)
iris_predict = predict(iris_mdl, newdata=iris)
table(iris$Species, iris_predict)
classification_rate = sum(diag(table(iris$Species, iris_predict))) / nrow(iris)
classification_rate


#NON LINEAR DATA
?svm
heart_df <- read.csv("heartdata.csv", sep = ',', header = FALSE)
head(heart_df)
str(heart_df)
dim(heart_df)
set.seed(100)
?createDataPartition
partition<- createDataPartition(heart_df$V14,p=0.7, list = FALSE)
anyNA(heart_df)
traindata <- heart_df[partition,]
testdata <- heart_df[-partition,]
dim(traindata)
dim(testdata)

#BUILD MODEL
?svm
nonlinearmodel <- svm(V14~.,data = traindata, kernel="radial")
nonlinearmodel
dev.off()
unseen <- predict(nonlinearmodel, newdata = testdata[,-14])
unseen
plot(nonlinearmodel,traindata)
##ACCURACY CHECK
tab<- cbind(testdata$V14,unseen)
dim(tab)
plot(tab)

tab<- confusionMatrix(nonlinearmodel,unseen)
as.matrix(tab)
##############Tuning AND KERNEL TRICK#########
# Construct sample data set - not completely separated
x <- matrix(rnorm(20*2), ncol = 2)
x
y <- c(rep(-1,10), rep(1,10))
x[y==1,] <- x[y==1,] + 1
dat <- data.frame(x=x, y=as.factor(y))
#####PLOT
ggplot(data = dat, aes(x = x.2, y = x.1, color = y, shape = y)) + 
  geom_point(size = 2) +
  scale_color_manual(values=c("#000000", "#FF0000")) +
  theme(legend.position = "none")
dev.off()

# Fit Support Vector Machine model to data set
svmfit <- svm(y~., data = dat, kernel = "linear", cost = 10)
# Plot Results
plot(svmfit, dat)
library(kernlab)
###MISCLASSIFICATION PENALTY INCREASE
# Fit Support Vector Machine model to data set
kernfit <- ksvm(x,y, type = "C-svc", kernel = 'vanilladot', C = 100)
# Plot results
plot(kernfit, data = x)

# find optimal cost of misclassification
tune.out <- tune(svm, y~., data = dat, kernel = "linear",
                 ranges = list(cost = c(0.001, 0.01, 0.1, 1, 5, 10, 100)))
# extract the best model
bestmod <- tune.out$best.model
bestmod

ypred <- predict(bestmod, dat)
misclass <- table(predict = ypred, truth = dat$y)
misclass


####LARGE DATASET######
# construct larger random data set
x <- matrix(rnorm(200*2), ncol = 2)
x[1:100,] <- x[1:100,] + 2.5
x[101:150,] <- x[101:150,] - 2.5
y <- c(rep(1,150), rep(2,50))
dat <- data.frame(x=x,y=as.factor(y))

# Plot data
ggplot(data = dat, aes(x = x.2, y = x.1, color = y, shape = y)) + 
  geom_point(size = 2) +
  scale_color_manual(values=c("#000000", "#FF0000")) +
  theme(legend.position = "none")


set.seed(123)
# sample training data and fit model
train <- base::sample(200,100, replace = FALSE)
svmfit <- svm(y~., data = dat[train,], kernel = "radial", gamma = 1, cost = 1)
# plot classifier
plot(svmfit, dat)


