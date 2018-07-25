# page 352
#install.packages("e1071")

library(e1071)
# c & r package library has different result (no normalization method)
# Because of Support Vector outlier has no... impact

# create 20*2 random normailzation value
x=matrix (rnorm (10*2) , ncol =2)

# create -1 10 and +1 10
y=c(rep (-1,10) , rep (1 ,10) )

# y = 1
x

x[y==1 ,]= x[y==1,] + 1

# depens on y value color changed
# color = 2 red col = 4 blue
plot(x, col =(3-y))

dat=data.frame(x=x, y=as.factor (y))
svmfit =svm(y~., data=dat , kernel ="linear", cost =10,
            scale =FALSE )

plot(svmfit , dat)