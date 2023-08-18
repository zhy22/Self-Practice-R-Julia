data(Boston, package = "MASS");summary(Boston)
library(rpart.plot)
attach(Boston)
a=rpart(crim~., data = Boston)
rpart.plot(a, type = 2,faclen = 1)

library(mboost)
mboost(crim~btree(zn)+btree(indus)+btree(chas)+btree(nox))

library(ipred)
bagging(crim~.,data = Boston)

library(randomForest)
randomForest(crim~.,data=Boston)
set.seed(1234)
ss=randomForest(crim~., data = Boston, importance = TRUE, proximity = TRUE)
ss$importance

library(rminer);set.seed(1010)
fit(crim~.,data=Boston,model = "svm")

library(caret);set.seed(1000)
mygrid=expand.grid(.decay=c(0.5,0.1),.size=c(4,5,6))
nnetfit=train(crim~.,data = Boston,method="nnet", maxit=1000,tuneGrid = mygrid)

