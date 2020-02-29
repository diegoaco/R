# Creates a histogram of a standard normal distribution

x = seq(-3, 3, 0.1)               # Defines the interval
h = rnorm(50000, 0, 1)            # Histogram data
y1 = dnorm(x, 0, 1)               # Continuous curve
hist(h, breaks=100, freq=FALSE)   # Creates the plots
lines(x, y1)

# Next we create a plot with 3 normal distributions

y2 = dnorm(x, 0, 1.5)
y3 = dnorm(x, 0, 2)
matplot(x, cbind(y1,y2,y3),type="l",col=c("red", "green", "blue"))
