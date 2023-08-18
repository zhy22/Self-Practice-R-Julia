#Julia-02
using Statistics,StatsBase
quantile(rand(1000))
x=[1,3,4,1,3,1]
g=unique(x);show(g)

using Distributions, Random
dn=Normal(0,1)
mean(dn);std(dn)
quantile.(dn,[0.025,0.975])
params(dn)
fit(Gamma,[1,3,3,4,4,4,5,6])

using Makie
using CairoMakie

let
 x = -3:0.1:3
 y = pdf.(Normal(), x)
 lines(x, y)
end
