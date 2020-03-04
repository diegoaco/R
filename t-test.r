# PERFORMS A T-TEST FOR TWO RANDOM NORMAL DATA SETS

# Size of the samples
nx = 100
ny= 100

# Generates random normal samples:
x = rnorm(nx)
y = rnorm(ny)
#plot(density(x))
#lines(density(y))

# Performs a t-test:
ttest = t.test(x, y)
ttest

# Performs 1000 tests and takes the t-statistic of each:
ts = replicate(1000, t.test(rnorm(nx), rnorm(ny))$statistic)

# Distribution plots

pts = seq(-4,4,0.01)  # Creates an interval
plot(pts, dt(pts, df=198), type ='l', col='red')  # T-distribution for the interval (in red)
lines(density(ts))   # Plots the t-statistics of the 1000 tests

# Quantile-quantile plot:
qqplot(ts, rt(1000, 198))
abline(0,1)
