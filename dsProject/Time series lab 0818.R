plot(arima.sim(n=1000,list(ar=0.8)), col = "red")
X=arima.sim(n=1000,list(ar=0.8))
plot(acf(X))
plot(pacf(X))

X2=arima.sim(n=1000,list(ar=-0.9));plot(acf(X2))
plot(pacf(X2))

X3=arima.sim(n=1000,list(ar=c(1.74,-0.81)));plot(X3,col = "red")
plot(acf(X3));plot(pacf(X3))

X4=arima.sim(n=1000,list(ar=c(0.2,0.9)));plot(X4,col="red")

abs(polyroot(c(1,-0.8)))
abs(polyroot(c(1,0.9)))
abs(polyroot(c(1,-1.02)))

abs(polyroot(c(1,-0.9,-0.2)))

y = ts(scan("C:\\Users\\Thf12\\Downloads\\USNewOrders.txt"), frequency = 12, start = c(1960, 1))

plot(y, col = "red")

par(mfrow=c(2,1))
acf(y);pacf(y)

m1=arima(y,c(4,0,0));summary(m1)

tsdiag(m1)

gdp = ts(scan("C:\\Users\\Thf12\\Downloads\\usgdp.txt"), frequency=4, start=c(1947,1))
plot(gdp, col = "red") # definite non-stationarity, so some differencing needed

y = 100*diff(log(gdp), 1) # calculate the log returns
plot(y, col = "red")