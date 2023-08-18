data(iris)
library(rpart.plot)
a=rpart(Species~., data = iris)
rpart.plot(a, type = 2,extra = 4)

wp=predict(a,iris, type = "class")
(z=table(iris[,5], wp))
sum(iris[,5]!=wp)/nrow(iris)

library(adabag)
set.seed(4410)
b=boosting(Species~., data = iris)

wp2=predict(b,iris)$class
(z2=table(iris[,5], wp2))
sum(iris[,5]!=wp2)/nrow(iris)
barplot(b$importance)

set.seed(1010)
c=bagging(Species~., data = iris)

wp3=predict(c,iris)$class
(z3=table(iris[,5], wp3))
sum(iris[,5]!=wp3)/nrow(iris)
barplot(c$importance)

library(randomForest)
set.seed(1234)
d=randomForest(Species~., iris, importance=T, proximity=T)

wp4=predict(d,iris)
(z4=table(iris[,5],wp4))
sum(iris[,5] !=wp4)/nrow(iris);barplot(d$importance)

library(e1071)
e=svm(Species~., iris, kernel = "sigmoid")
wp5=predict(e,iris)
(z5=table(iris[,5],wp5))
E=(sum(z5)-sum(diag(z5)))/sum(z5)

library(kernlab)
e2=ksvm(Species~., iris)
wp52=predict(e2,iris)
(z52=table(iris[,5],wp52))
E2=(sum(z52)-sum(diag(z52)))/sum(z52)

library(kknn)
f=kknn(Species~., k=6, train = iris, test = iris)
(z6=table(iris[,5], f$fit))
E3=(sum(z6)-sum(diag(z6)))/sum(z6)

library(nnet)
g=nnet(Species~., iris, size = 2)
wp7=predict(g, iris, type="class")
(z7=table(iris[,5],wp7))
sum(iris[,5] != wp7)/nrow(iris)



