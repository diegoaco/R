# SIMPLE CHI-SQUARED FOR FIT (BY HAND)

# WE SET AN ALPHA VALUE:
alpha = 0.05

# POSSIBLE OUTCOMES:
out = seq(0,6,1)

# OUTCOME COUNTS AND TOTAL OF TRIALS:
obs = c(5,11,13,7,2,1,1)
n = sum(obs)

# EXPECTED VALUES ASSUMING A BIN(6, 0.4) DISTRIBUTION:
exp = n*dbinom(out, 6, 0.4)

# STATISTICS: LIKELIHOOD RATIO AND PEARSON'S:
G = 2*sum(obs*log(obs/exp))
X = sum((obs-exp)**2 / exp)

# P-VALUES:
pG = 1 - pchisq(G, 6)
pX = 1 - pchisq(X, 6)

cat('The p-values are: pG =', pG, 'and pX =', pX, '\n')

if (pG < alpha){
cat('Under pG we reject the null hypothesis \n')
} else {
cat('Under pG we do not reject the null hypothesis \n')
}

if (pX < alpha){
cat('Under pX we reject the null hypothesis')
} else {
cat('Under pX we do not reject the null hypothesis')
}
