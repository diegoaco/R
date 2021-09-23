# APPLIES A LOGISTIC REGRESSION ALGORITHM VIA GRADIENT DESCENT #
# TRACKS THE COST FUNCTION AND COMPUTES THE ACCURACY OF THE ALGORTIHM #

# READ THE DATA #
data = read.csv("/Users/diego/python/Machine Learning/ex2data1.txt", header = FALSE)
y = matrix(data[[3]])
m = dim(y)[1]
n = dim(data)[[2]] - 1
X_temp = matrix(c(data[[1]], data[[2]]), nrow = m, ncol = n)


# NORMALISING THE DATA #
X1 = (X_temp[,1] - mean(X_temp[,1]))/sd(X_temp[,1])
X2 = (X_temp[,2] - mean(X_temp[,2]))/sd(X_temp[,2])
ones = rep(1, m)
X = matrix(c(ones, X1, X2), nrow = m, ncol = n+1)


# GRADIENT DESCENT #
alpha = 1
iter = 400
theta = matrix(1, n+1, 1)

cost = c()
for (i in 1:iter){
  z = X%*%theta
  h = 1/(1+exp(-z))
  J = (-1/m)*(t(y)%*%log(h) + t(ones - y)%*%log(ones-h))
  cost = append(cost, J)
  grad = (1/m)*(t(X)%*%(h - y))
  theta = theta - alpha*grad
}

# Decision boundary line 
x = seq(-2.5, 2.5, 0.03)
bdy = (-theta[1] - x*theta[2])/theta[3]


# ACCURACY ANALYSIS#
pred = 1/(1 + exp(-(X%*%theta)))
for (i in 1:m){
  if (pred[i] >= 0.5){pred[i] = 1}
  else (pred[i] = 0)}

acc = sum(pred == y)/100
cat('Accuracy:', acc, '%')


# PLOTS #
# Classifying the data points #
pos = c()
neg = c()
for (i in 1:m){
  if (y[i] == 0){neg = append(neg, i)}
  else{pos = append(pos, i)}}

# Cost function
t = seq(1, iter, 1)
plot(t, cost, main='Cost function', xlab = 'Steps', ylab = 'Cost function', pch = 20)

# Data points and prediction
plot(X[pos, 2], X[pos, 3], main = 'Boundary', col = 'blue', 
     xlab = 'x-value', ylab = 'y-value', xlim = c(-2,2), ylim = c(-2,2))
points(X[neg, 2], X[neg, 3], col = 'red')
lines(x, bdy, lwd = 2)
legend(x = "bottomleft", legend = c('Positive', 'Negative', 'Boundary'), 
       pch = 20, col = c('blue', 'red', 'black'), cex = 0.8)
legend('topright',legend=parse(text=sprintf('Accuracy == %s', acc)),bty='n', cex = 0.9)
