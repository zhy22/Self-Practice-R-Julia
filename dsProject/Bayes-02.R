data=read.csv("C:\\Users\\Thf12\\OneDrive - University of Canterbury\\STAT315\\Contraception315.csv")
library(rstanarm)
post=stan_glm(livch~age+urban+use, data = data,seed=1, chains=2,cores=2,iter=500)
print(post,digits=3)
summary(bayes_R2(post))
post_mc=as.array(post)
library(bayesplot)
mcmc_intervals(post_mc)
mcmc_areas(post_mc, prob = 0.8)
mcmc_hist(post_mc, pars = c("age"),transformations = list("age"="log"))
mcmc_dens(post_mc, pars = c("age"),transformations = list("age"="log"))
mcmc_violin(post_mc, pars = c("age"),transformations = list("age"="log"))
mcmc_trace(post_mc, pars = c("age"))
mcmc_acf(post_mc,lags = 10)
mcmc_acf_bar(post_mc,lags = 10)
mcmc_rhat(rhat(post))
plot(post,"ess", size=3)
mcmc_combo(post_mc,
           combo = c("dens_overlay","trace"),
           pars = c("age"),
           transformations = list("age"="log"),
           gg_theme = legend_none())
mcmc_parcoord(post_mc)






