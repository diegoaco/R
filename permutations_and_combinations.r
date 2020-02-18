#load library
library(gtools)

### PERMUTATIONS ###

# 4-element set:
x = c('a', 'b', 'c', 'd')
# Get all the permutations without repetitions: 4! outcomes
per1 = permutations(n=4,r=4,v=x)
# Print
cat('Number of outcomes:', nrow(per1))
per1


# 4-element set:
y = c('a','b', 'c', 'd')
# Choose 2 elements and get all the permutations without repetitions: n!/(n-k)! = 4!/2! outcomes
per2 = permutations(n=4, r=2, v=y)
# Print
cat('Number of outcomes:', nrow(per2))
per2


# 3-element set:
z = c('a','b','c')
# Get all the permutations of lenght 4 with repetitions: n^k = 3^4 outcomes
# This can model a coin toss, for example
per3 = permutations(n=3,r=4,v=z,repeats.allowed=T)
# Print
cat("Number of outcomes:", nrow(per3))
per3


### REPETITIONS ###

# 4-element set:
u = c('a', 'b', 'c', 'd')
# Choose k=2 elements and get all the combinations without repetitions: (n,k) outcomes
comb1 = combinations(n=4,r=2, v=u, repeats.allowed=F)
# Print
cat('Number of outcomes:', choose(4,2))
comb1

# # 4-element set:
w = c('a', 'b', 'c', 'd')
# Choose k=2 elements and get all the combinations without repetitions: (n,k) outcomes
comb2 = combinations(n=4,r=2, v=w, repeats.allowed=T)
cat('Number of outcomes:', nrow(comb2))
comb2
