using Random, Distributions
Random.seed!(1010); x=rand(Normal(1,0),30)
fit_mle(Normal,x)

truncated(distribution; lower=1,upper=u)
censored(distribution, lower=1,upper=u)

x = [303, 282, 289, 298, 283, 
317, 297, 308, 317, 293, 
284, 290, 304, 290, 311, 
305, 277, 278, 301, 304, 
300, 293, 300, 276, 318, 
303, 309, 293, 316, 302, 
295, 294, 291, 297, 300, 
299, 303, 299, 282, 318, 
296, 285, 288, 279, 310, 
315, 292, 303, 301, 292]

using Statistics, HypothesisTests
tres11=OneSampleZTest(
    mean(x),
    12,
    length(x),
    295
)
confint(tres11)
pvalue(tres11)

tres12=OneSampleTTest(x,295)

tres21=BinomialTest(750,1000,0.8)


# 两样本均值比较和置信区间
x = [1263, 897, 849, 891, 964, 
810, 877, 899, 847, 1070, 
1252, 920, 1256, 1196, 1150,
1024, 1016, 1126, 1289, 1220, 
912, 1026, 786, 989, 1133, 
990, 999, 1049]
y = [996.7, 897, 912, 894.9, 785, 
750.7, 882.2, 1110, 907.2, 1226.1, 
762.1, 835.5, 1048, 773.8, 807, 
972, 980, 876.6, 943, 992.7, 
704.3, 962.9]

tres31=EqualVarianceTTest(x,y)

using DataFrames, RDatasets
rds=RDatasets.datasets()
size(rds);first(rds,3)

rds[occursin.("crab", rds[:,:Dataset]), :]
crabs = RDatasets.dataset("MASS", "crabs")
size(crabs)
## (200, 8)
first(crab, 3)

using RCall
xjulia=5


