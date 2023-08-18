data(sleep)
library(REEMtree)
a=REEMtree(extra~group, data = sleep, random = ~group|ID )
print(a);plot(a)