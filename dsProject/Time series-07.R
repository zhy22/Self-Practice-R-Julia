data(AirPassengers);acf(AirPassengers)
fracdiff::fdGPH(AirPassengers)
model=fracdiff::fracdiff(AirPassengers,nma = 1,nar = 1)
summary(model)
