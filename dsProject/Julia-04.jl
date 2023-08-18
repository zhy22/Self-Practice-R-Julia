m1=[1 2 -2;1 -1 2;-1 1 1]
using LinearAlgebra
res=LinearAlgebra.lu(m1)
qr(m1)
eigen(m1)

big(0.1);big(1)/10

using SpecialFunctions
gamma(n);beta(a,b)

using Random
Random.seed!(1010)
rand(),rand()
rand(5)
rand(2,3)

randn(),randn()
randn(5)

using Random, Distributions
using StatsBase, DataFrames

y=rand(Poisson(2),100)
using CairoMakie

using AlgebraOfGraphics
plt = data((;y=y)) * mapping(:y) * frequency()
draw(plt)

y2=rand(Normal(10,2),1000)
plt2=data((;y=y2))*mapping(:y)*histogram(bins=30)
draw(plt2)

StatsBase.sample(1:10, 
  StatsBase.Weights([ones(5); 4 .* ones(5)]), 
  5; replace=true) |> show
  function rand_tri(n, m)
    Finv(u) = u < m ? sqrt(m*u) : 1 - sqrt((1-m)*(1-u))
    Finv.(rand(n))
end

mean(rand_tri(1_000_000, 0.6))



