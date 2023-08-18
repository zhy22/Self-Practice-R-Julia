
data=read.csv("C:/Users/Thf12/Downloads/AMBNS.csv")
data1=ts(data[,2],start=c(1918,1),frequency = 12)
par(mfrow=c(1,2))
ts.plot(data1,ylab="value")
ts.plot(diff(data1),ylab="value")


data2=ts(data1[949:1129],start = c(1997,1),frequency = 12)
b2=HoltWinters(data2,gamma = FALSE,beta=FALSE)
par(mfrow=c(1,2))
plot(data2)
ee2=b2$x-b2$fit[,1]
plot(ee2)
acf(data1);pacf(data1)

data0=ts(data1[1:1080],start = c(1918,1),frequency = 12)
data3=ts(data1[949:1129],start = c(1997,1),frequency = 12)
b0=arima(data0,order = c(0,1,8),seasonal = list(order=c(0,0,1)))
bp72=predict(b0,72);plot(data3);lines(bp72$pre,lty=2)

B=NULL;for (i in 1:30)
  B=c(B,Box.test(b0$residuals,lag=i,type = "Ljung-Box")$p.value)
plot(B,mian="plot",ylab="p",xlab = "lag",pch=16)
abline(h=0.05,lty=2)

data(Nile,package="datasets");plot(Nile)
acf(Nile);pacf(Nile)
res2=armasubsets(y=Nile, nar=15, nma=15,y.name="test");plot(res2)
rn1=arima(Nile,c(1,0,12));rn1

par(mfrow=c(1,1))
data(Nile,package="datasets")
(fit<-StructTS(Nile, type="level"))
plot(Nile)
lines(fitted(fit),lty=2)
line(tsSmooth(fit))

