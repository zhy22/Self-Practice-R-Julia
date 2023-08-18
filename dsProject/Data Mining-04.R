data(iris)
pairs(iris[1:4],main="")
summary(iris)

library(e1071)
cla=naiveBayes(iris[,1:4], iris[,5])
table(predict(cla, iris[,-5]),iris[,5],dnn = list('predicted','actual'))

data(HairEyeColor)
naiveBayes(sex~., data = HairEyeColor)


