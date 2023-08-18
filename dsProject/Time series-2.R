library(urca)
data(finland)
attach(finland)
lrm1.df=ur.df(lrm1, lags=5, type="trend");summary(lrm1.df)
lrm12=diff(lrm1);lrm12.df=ur.df(lrm12,lags=5,type="trend");summary(lrm12.df)


lrm1=ts(lrm1,start = c(1958,2),end = c(1984,3),frequency = 4)
difp=ts(difp,start = c(1958,2),end = c(1984,3),frequency = 4)
ficons=window(cbind(lrm1,difp),start = c(1958,2),end = c(1984,3))
lrm1.eq=summary(lm(lrm1~difp,data = ficons))
difp.eq=summary(lm(difp~lrm1,data=ficons))
err.lrm1=ts(resid(lrm1.eq), start = c(1958,2),end = c(1984,3),frequency = 4)
err.difp=ts(resid(difp.eq), start = c(1958,2),end = c(1984,3),frequency = 4)

ficons=window(cbind(lrm1,lny,lnmr,difp),start = c(1958,2),end = c(1984,3))
pu.test=summary(ca.po(ficons,demean="const",type = "Pu"));pu.test
pz.test=summary(ca.po(ficons,demean = "const",type = "Pz"));pz.test

summary(ca.jo(data.frame(lrm1,lny,lnmr,difp),type="trace",ecdet = "const"))
summary(ca.jo(data.frame(lrm1,lny,lnmr,difp),type="eigen",ecdet = "const"))

library(lmtest)
grangertest(lrm1~difp,data = finland)

