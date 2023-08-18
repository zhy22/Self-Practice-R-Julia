function rb(x::Vector{Float64})
    return (1.0-x[1])^2+100.0*(x[2]-x[1]^2)^2;
end

using Optim
ores1=optimize(rb, [0.0,0.0])
Optim.minimizer(ores1)
ores2=optimize(rb, [0.0,0.0], BFGS())

funi(x)=2x^2+3*x+1
optimize(funi,-10,10)

using JuMP; using GLPK
omod21 = Model(GLPK.Optimizer)

@variable(omod21, 0 <= x <= 2 );
@variable(omod21, 0 <= y <= 30 );
@objective(omod21, Max, 5x + 3*y )
@constraint(omod21, con, 1x + 5y <= 3.0 )
print(omod21)

JuMP.optimize!(omod21)
println(termination_status(omod21))
println("最大目标函数值：", objective_value(omod21))
println("最大值点：x=", value(x), " y=", value(y))

using JuMP
using Ipopt
omod22 = Model(Ipopt.Optimizer)
@variable(omod22, x, start = 0.0);
@variable(omod22, y, start = 0.0);
@NLobjective(omod22, Min, (1 - x)^2 + 100 * (y - x^2)^2)
optimize!(omod22)

using Plots; Plots.gr()
rf1(x) =  sin(4.0*(x - 0.25)) + x + x^20 - 1.0
Plots.plot(rf1, 0.0, 1.0, linewidth=2, legend=false)
Plots.hline!([0.0], color=:black)

using Roots
Roots.find_zero(rf1, (0.0, 1.0), Bisection())
Roots.find_zero(rf1, 1.0, Order1())


