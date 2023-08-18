n<-10
y<-c(3.4,3.8,9.1,2.2,2.6,2.9,2.0,2.7,1.9,3.4)
x<-c(5.5,5.9,6.5,3.3,3.6,4.6,2.9,3.6,3.1,4.9)
library(R2WinBUGS)
data=list("x","y","n")
parameter=list("alpha","beta","sigma")
inits1 <-list(tau=5,alpha=4, beta =1.9)
inits2 <-list(tau =0.74, alpha =-2.33, beta =1.31)
inits3 <-list(tau=3,alpha =0.91, beta =3.32)
inits <-list(inits1 ,inits2 ,inits3)
output=bugs(data, inits, parameter, n.chains = 3, n.burnin = 1000, n.iter = 2000,
            n.thin = 1,
            model.file = "C:\Users\Thf12\OneDrive - University of Canterbury\dsProject\bayes-03.txt",
            bugs.directory ="C:\\Program Files\\winbugs14_full_patched\\WinBUGS14")
print(output)
plot(output)
output.mcmc<-as.mcmc.list(output)
autocorr.plot(output.mcmc)
mcmcplots::traplot(output.mcmc)
mcmcplots::denplot(output.mcmc)

library(rstan)
options(mc.cores = parallel::detectCores())
fit <- stan(
  file = "rstanm.stan",#Stan program
  data = schools_data, #named list of data
  chains = 4, #number of Markov chains
  warmup = 1000, #number of warmup iterations per chain
  iter = 2000, #total number of iterations per chain
  cores = 2, #number of cores
  refresh = 0 #no progress shown
)

print(fit)
plot(fit)
traceplot(fit)
pairs(fit, pars=c("mu", "tau", "lp__"))
library("shinystan")
launch_shinystan(fit)