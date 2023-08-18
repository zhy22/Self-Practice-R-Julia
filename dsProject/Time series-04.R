library(datasets)
data("AirPassengers")
data("Nile")

# 加载WWWusage数据集
data("WWWusage")

# 加载sunspots数据集
data("sunspots")

# 加载BJsales数据集
data("BJsales")
library(quantmod)
chartSeries(WWWusage,type = "line",theme = "white")
plot(log(WWWusage))
acf(WWWusage)
Box.test(WWWusage, lag = 12, type = "Ljung-Box")
pacf(WWWusage)
model=ar(diff(log(WWWusage)), method = "mle")
plot(as.numeric(names(model$aic)),model$aic,type="h")
round(model$aic, 2)
model2=arima(x=diff(WWWusage), order = c(3,0,0))
Box.test(model$resid, type = "Ljung")
library(forecast)
forecast::checkresiduals(model)
tsdiag(model2)
pred=predict(model2, n.stage = 10)
plot(WWWusage);lines(pred$pred, col="red")

Box.test(WWWusage,lag = 10, type = "Ljung")