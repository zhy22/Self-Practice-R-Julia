data(WWWusage, package = "datasets")
forecast::Acf(WWWusage)
model1=arima(WWWusage, order = c(0,0,9));model1
Box.test(model1$residuals, type = "Ljung")

predict(model1, n.ahead = 10, se.fit = T)

TSA::eacf(WWWusage)
TSA::armasubsets(WWWusage, nar = 6, nma = 12)
forecast::auto.arima(WWWusage, max.p = 10, max.q = 10, max.P = 2, max.Q = 3)

fUnitRoots::adfTest(WWWusage, lags = 9, type = "c")
tseries::adf.test(WWWusage, k=9)
fUnitRoots::adfTest(diff(log(WWWusage)), lags=9)