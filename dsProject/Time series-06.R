data=readr::read_delim(file='C:/Users/Thf12/OneDrive - University of Canterbury/STAT317/a1dta.csv', col_names =TRUE,delim=',')
data1=ts(data[,2], start = c(1987,6), frequency = 4)
ts.plot(data1, main = "Expenditure of Quarterly GDP", ylab="Value")

forecast::gglagplot(data1,set.lags = 1:4,do.lines = FALSE, diag.col = "red",main="1 to 4 Order Lag Against Value by Quarters")

mod1=fGarch::garchFit(~1+garch(4,0), data = data1,trace = FALSE )
summary(mod1)
(resi=residuals(mod1, standardize=TRUE))
plot(mod1, which = 13)

mod2=garchFit(~1+garch(9,0),data = ,trace = FALSE)
plot(mod2)
d3=data(finland);attach(finland)
Box.test(EuStockMarkets, type = "Ljung-Box")


plot(mod1)