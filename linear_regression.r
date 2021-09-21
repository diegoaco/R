library(MASS)

# READ DATA #
data = read.csv("/Users/diego/python/Machine Learning/ex1data1.txt", header = FALSE)
X_temp = matrix(data[[1]])
y = matrix(data[[2]])
m = length(X_temp)

# NORMAL EQUATION #
X = cbind(replicate(m, 1), X_temp)
A = ginv(t(X)%*%X)
B = A%*%t(X)
theta_nor = B%*%y
M = X%*%theta_nor - y
cost_nor = (0.5/m)*(t(M)%*%M)
pred_nor = X%*%theta_nor

cat('The parameters using normal eqn are:',theta_nor[1,1], 'and', theta_nor[2,1])
cat('The min cost using normal eqn is:', cost_nor)

# GRADIENT DESCENT #
alpha = 0.01
i_max = 1200
cost = c(Inf)
e = 1e-10
theta_grad = matrix(c(-1,1), nrow = 2, ncol= 1)

for (i in seq(1, i_max, 1)){
  M_grad = X%*%theta_grad - y
  theta_grad <- theta_grad - (alpha/m)*(t(X)%*%M_grad)
  J = (0.5/m)*(t(M_grad)%*%M_grad)
  cost = append(cost, J)
  if (abs(cost[length(cost)] - cost[length(cost)-1]) < e){
    i_max = i
    break
  }
}

pred_grad = X%*%theta_grad

cat('Parameters using gradient descent', theta_grad[1,1], theta_grad[2,1])
cat('Cost function minimum:', cost[length(cost)])
cat('Numer of steps:', i_max)

# R^2 ANALYSIS #

res = pred_nor - y
ss_res = t(res)%*%res
res_var = y - mean(y)
ss_tot = t(res_var)%*%res_var
r2 = 1 - ss_res/ss_tot
cat('The R^2 value is:', r2)

# PLOTS #
# Data and prediction lines
plot(X_temp, y, col = 'red', pch = 20, xlab = 'x-value', ylab = 'y-value')
lines(X_temp, pred_nor, col = 'blue')
lines(X_temp, pred_grad, col = 'black')
legend(x = "topleft", legend = c('Data', 'Normal prediction', 'Gradient descent prediction'), 
      pch = 20, col = c('red', 'blue', 'black'))

# Cost function
t = seq(1, i_max, 1)
plot(t, cost[2:length(cost)], type = 'l', col= 'blue', xlab = 'Steps', ylab = 'Cost function')
