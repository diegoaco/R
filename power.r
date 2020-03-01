x = c(0,1,2,3,7,8,9,10)
p = seq(0, 1, 0.1)
l = c()

for (i in p)
    {
    s = 0
    for (j in x)
        {
        d = dbinom(j, 10, i)
        s = s + d
        }
#    cat('Sum for p =', i, 'is:', s, '\n')
    l = c(l,s) 
    }

plot(p,l)
