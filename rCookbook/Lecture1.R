
a<-1

# ?¸?„°? ‰?‹°ë¸? ?™˜ê²?
pi
sqrt(2)
#ë²¡í„° ?ƒ?„± create
c(1,2,3,4)

# ë³€?ˆ˜ ?„ ?–¸ ?¼ë°˜ì ?œ¼ë¡? <- ?‚¬?š© ë§Žì´?•¨
a=1
a<-1
############################
####### 2.1 Printing Something
############################
#ë²¡í„° ?ƒ?„± create
tempVector <- c(1,2,3,4)
#?‰ê·?
mean(x)
#?‘œì¤€?Ž¸ì°?
sd(x)
#ë¶„ì‚°
var(x)

# ë¬¼ì–´ë³´ê¸° ì°¬ìŠ¤ ?‚¬?š©?•˜ê¸?
?matrix

# ë©”íŠ¸ë¦??Š¤ (?–‰ê³? ?—´?´ ?žˆ?Š” ?°?´?„° ?ƒ?„±)
x <- matrix( c(1,2,3,4), 2,2)
y <- matrix(tempVector,2,2)
# ?–‰?„ ë¨¼ì?€ ?ˆ˜?–‰?•¨
z <- matrix(tempVector,2,2, byrow=2)

#
# cat ê³? print?˜ ì°¨ì´?Š” print?Š” ?¬ë§¤íŒ…?´ ê°€?Š¥?•˜?‹¤.
cat("This is ML Class")
cat("This is ML Class\n")

print(pi)

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

# ?¸?±?Š¤ ?œ ?˜?•˜ê¸? ì²«ë²ˆì§¸ëŠ” ì§„ì§œ ì²«ë²ˆì§¸ë‹¤
# ? „?‚° ?ž­ê¸°ì?€ê°€ ?•„?‹˜
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
### ë³€?ˆ˜ ë©”ëª¨ë¦¬ì—?„œ ?‹¤ë£¨ê¸°
# ?‚¬?š©?œ ë³€?ˆ˜ ë¦¬ìŠ¤?Š¸
ls()
?rm
# ?Š¹? • ë³€?ˆ˜ ?‚­? œ
rm(x)
# ? „ì²´ë?€?ˆ˜ ?‚­? œ
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

## ë°±í„° ?•©ì¹˜ê¸°
w = c(v1,v2)
w

v1
## vector ??€?ž…?´ 2ê°? ?˜¼?ž¬?• ê²½ìš° ë³€?™˜ê°€?Š¥?•œ ??€?ž…?œ¼ë¡? ?ž?™ë³€?™˜
v3 <- c("A","B","C")
w1 <- c(v1,v3)
w1

## classë¥? ?†µ?•´ ??€?ž… ?™•?¸ ê°€?Š¥?•¨ class ê°€ ?” ë§Žì´ ?‚¬?š©?¨
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
# Break time
#####################################
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
samp2 <- read.csv("data2.csv", header=FALSE, sep=";")
samp2

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
#####################################
# matrix has only numeric value

class(samp)
samp

## Extracting Specific rows
## using condition <- subset is more frequent
s <- subset(samp, subset = (V2 > 2))
t <- subset(samp, subset = (V2 > 2))$V2
t

ans <- samp[samp$V2>2,]$V2
ans

#####################################
#5.25 Changing the Names of Data Frame Columns
#####################################
# change type matrix -> dataframe
x <- matrix( c(1,2,3,4), 2,2)
y <- matrix(tempVector,2,2)
z <- matrix(tempVector,2,2, byrow=2)
z
class(z)
df2 <-as.data.frame(z)
class(df2)
df2

# column name change
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
