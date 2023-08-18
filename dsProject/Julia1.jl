using CSV, DataFrames, CategoricalArrays
data=CSV.read("C:\\Users\\Thf12\\OneDrive - University of Canterbury\\STAT315\\Contraception315.csv", DataFrame,types=Dict(
    "livch" => Float64,
    "age" => Float64,
    "use" => String

))

using GLM
lmr=lm(@formula(livch~age),data)

using StatsBase, Distances
function majvote(yn)
    cm = countmap(yn)
    mv = -999
    lab = nothing
    tot = 1e-8
    for (k,v) in cm
        tot += v
        if v > mv
            mv = v
            lab = k
        end
    end
    prop = mv/tot
    return [lab, prob]
end

function knn(x,y,x_new,k)
    n, p = size(x)
    n2, p2 = size(x_new)
    ynew = zeros(n2,2)

    for i in 1:n2
        res = zeros(n,2)
        for j in 1:n
            res[j, :] = [j, cityblock(x[j, :]),x_new[i, :]]
        end

        res2 = sortslices(res, dims=1, by=x->(x[2],x[1]))
        ind = convert(Array{Int}, res2[1:k, 1])
        ynew[i, :]=majvote(y[ind])
    end
    return ynew
end


