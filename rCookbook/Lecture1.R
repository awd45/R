
a<-1

# Interactive environment
pi
sqrt(2)
# Creating vector
c(1,2,3,4)

# Defining variables
a=1
a<-1
############################
####### 2.1 Printing Something
############################
#Creating vector
tempVector <- c(1,2,3,4)
#average
mean(x)
#standard deviation
sd(x)
#variance
var(x)

# show function details
?matrix

# Crete matrix byrow <- fill the value using column order
x <- matrix( c(1,2,3,4), 2,2)
y <- matrix(tempVector,2,2)
# Crete matrix byrow <- fill the value using row order
z <- matrix(tempVector,2,2, byrow=2)


# print
cat("This is ML Class")
cat("This is ML Class\n")

sqrt(x^2)

a=3.5
sprintf("pi is %f \n",a)

############################
####### 2.2 Setting Variables
############################

x<-3
x=3

x <-3
y <-4
z <- sqrt(x^2 + y^2)
print(z)

# Creating vector
# Select specific vector point
x <- c(1,2,3,4)
x[1]

y <- c("fee","fie","foe","fun")
y[1]

z <- 3

############################
####### 2.3 Listing Variables
############################

### Generate Function
f <- function(n,p) sqrt(p*(1-p)/n)
f
f(2,1/2)

### Generate Function
## Define of Function
g <- function (a,b) {
  u = a+b
  v = a-b
  # Do not use return
  v / u}

## Use of Function
g(3,2)

############################
####### 2.4 Deleting Variables
############################
# showing list of all variables
ls()
?rm
# deleting specific variable
rm(x)
# deleting all varaiables
rm(list=ls())

############################
####### 2.5 Creating a Vector
############################
## Variables Uppercase LowerCase
c(1,1,2,3,5,8,13,21)

k = c( TRUE, TRUE FALSE, TRUE)
K

## Logical operator
l = c(1==2,1==1)
l

v1 = c(1,2,3,4)
v2 = c(4,5,6)
v1
v2

## concating vector
w = c(v1,v2)
w

v1
## concating vector and type is cenverted to String 
## if new vector value can not be cast to original type
v3 <- c("A","B","C")
w1 <- c(v1,v3)
w1

## Finding type of variable (class)
#mode(w1)
class(w1)

############################
####### 2.6 Basic Statistics
############################
x <- c(0,1,1,2,3,5,8,13,21,34)

mean(x)
median(x)
sd(x)
var(x)

# r feature
# (Do not use loop -> vector operation)
y <- log(x+1)
z <- x+1
z

# Calculating corr
cor(x,y)

rm(list=ls())

############################
####### 2.7 Sequence !!!!!!!!
############################
x = c(1:100)
y = c(100:1)
x

f = c(1:100)
y = 2 * f +1

lm_r = lm ( y ~ f)

coef(lm_r)

summary(lm_r)
resid(lm_r) 
fitted(lm_r) 
plot(lm_r)

# Well
data()


############################
####### Etc
############################
## Setting working directory
getwd()
setwd("D://rLecture//rCookbook")

x = c(1:100)
y = c(100:1)
x

f = c(1:100)
y = 2 * f +1

lm_r = lm ( y ~ f)

coef(lm_r)

summary(lm_r)
resid(lm_r) 
fitted(lm_r) 
plot(lm_r)

lm_r

# Wellknown data
data()

## Loading data
data(iris)
## Checking iris data
head(iris)

## book introduction type:pdf
islr type:pdf

## packge Install
install.packages("ISLR")
## library load
library(ISLR)
## Searching library
search()

############################
####### 3.5. Displaying the Search Path
############################
# Searching Currnetly loaded library
search()

# MASS
# MASS Wellknow package
# Modern Applied Statistics With S 
library("MASS")
search()

############################
####### 3.12 Running a Script
############################
source("Runnable.R")

############################
####### 3.13 Running a Batch Script
############################
# Setting System Variables
# R CMD BATCH scriptfile outputfile
# R CMD BATCH Runnable.R log.txt
# C:\Program Files\R\R-3.5.1\bin\x64


#####################################
# 4.2 Printing Fewer Digits (or More Digits)
#####################################
q <- seq(from =0 , to =3, by = 0.5)
# normalization  avg=0 stdev = 1
pnorm(q)
rount(pnorm(-q),3)

# Create Dataframe
tbl <- data.frame(Quant = q, Lower = pnorm(-q), Upper = pnorm(q))
tbl

#####################################
# 4.2 Printing Fewer Digits (or More Digits)
#####################################

#####################################
# 4.5 Dealing with ¡°Cannot Open File¡± in Windows
#####################################
getwd()
setwd("D://rLecture//rCookbook")
samp <- read.csv("data.csv")
samp
?read.csv
# header = FASLE , sep option can be changed
samp <- read.csv("data.csv", header=FALSE)
samp

#####################################
# 4.10 Reading Tabular or CSV Data from the Web
#####################################

#####################################
# 4.13 Reading from MySQL Databases
#####################################

#####################################
# Chapter 5 Data Structure
#####################################

#Vector, Lists

#####################################
# 5.2 Inserting Data into a Vector
#####################################
1:10

append(1:10, 99, after = 5)
append(1:10, 99, after = 0)

# cbind rbind
x0 <- 1:10
y0 <- 10:19
z0 <- cbind(x0,y,y0)

x <- 1:10
y <- 10:19
z1 <- cbind(x,y)
z
a <- 1:6
# if row count is not matching iter the value
z2 <- cbind(x,a)
# rbind must match number of columns
z3 <- rbind(z1,z0)

# Vector

# Summarizing Data
# Feature, Factor
head(iris)
summary(iris)

# Select specific column
iris$Sepal.Length

# Select specific row using index
iris$Sepal.Length[10]
# Select specific row using value
iris[iris$Sepal.Length==4.9,]

# vector operation
a <- c(1:5)
b <- c(2:6)
a*b

#####################################
# 5.18 Initializing a Data Frame from Column Data
####################################
# difference between matrix and dataframe
# matrix has only numeric value

getwd()
setwd("D://rLecture//rCookbook")

?read.csv
# header = FASLE , sep option can be changed
samp <- read.csv("data.csv", header=FALSE)
samp
class(samp)
samp

## Extracting data using condition
## using condition <- subset is more frequent
s <- subset(samp, subset = (V2 > 2))
t <- subset(samp, subset = (V2 > 2))$V2
t

ans <- samp[samp$V2>2,]$V2
ans

#####################################
#5.25 Changing the Names of Data Frame Columns
#####################################
# Changing matrix data to dataframe
x <- matrix( c(1,2,3,4), 2,2)
y <- matrix(tempVector,2,2)
z <- matrix(tempVector,2,2, byrow=2)
z
class(z)
df2 <-as.data.frame(z)
class(df2)
df2

# Changing column name in Dataframe
colnames(df2) <- c("before","treatment")
df2

#####################################
#apply function -> column create using
#####################################

#######################################
# Drawing chart
#######################################

# delete all variables
rm(list=ls())

#rnorm (random normalization mean = 0 , sd = 1)
?rnorm
x = rnorm(100)

# avg = 10 std = 1
# create dataset 
# y = 2 * x + 1
x = rnorm(100,10,1)
y = 2 * x + 1
plot(x,y)  
# y = 2 * x + 1   + error
# x = c(1:100)
# e ÀÔ½Ç·Ð = rnorm(100,0,1)
e = rnorm(100,0,1)
e = rnorm(100, sd = 5)
e  
y = 2 * x + 1 + e
plot(x,y)

# 
x = c(1:100)
y = 2* x +1 +e
plot(x,y)


x = rnorm(100, mean = 10, sd = 5)
e = rnorm(100, sd = 5)
y = 3 * x + 10 + e

plot(x,y)
# lm model
?lm
l = lm(y ~ x)
abline(l)
l

# pvalue -> if pvalue is less than 0.05 it is meaningful model
summary(l)
