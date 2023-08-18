library(vars)
data(finland,package = "urca")
VAR(finland, p=2, type = "none")
VAR(finland, p=2, type = "const")
VAR(finland, p=2, type = "trend")

z=VAR(finland, p=2, type = "both")
zp=predict(z,n.ahead = 8, ci=0.95);plot(zp)

library(dse);attach(finland)
fld=TSdata(input=finland[,2:4],output=finland[,1])
fld=tframed(fld,list(start=c(1958,2),frequency = 4))
fld.ls=estVARXls(fld,max.lag = 2);print(fld.ls);stability(fld.ls)

fld.ss=estSSfromVARX(fld,max.lag=3);print(fld.ss);stability(fld.ss)

fld.bb=estBlackBox(fld,max.lag = 6);print(fld.bb);stability(fld.bb)
informationTests(fld.ss,fld.ls,fld.bb)
tfplot(fld.ss,fld.ls,fld.bb,start = c(1960,1))




