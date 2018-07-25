############################################################
############## Remove all packages #########################
# create a list of all installed packages
ip <- as.data.frame(installed.packages())
head(ip)
# if you use MRO, make sure that no packages in this library will be removed
ip <- subset(ip, !grepl("MRO", ip$LibPath))
# we don't want to remove base or recommended packages either\
ip <- ip[!(ip[,"Priority"] %in% c("base", "recommended")),]
# determine the library where the packages are installed
path.lib <- unique(ip$LibPath)
# create a vector with all the names of the packages you want to remove
pkgs.to.remove <- ip[,1]
head(pkgs.to.remove)
# remove the packages
sapply(pkgs.to.remove, remove.packages, lib = path.lib)
############################################################
############################################################

install.packages("ISLR")

### i

getwd()
setwd("D:/rLecture/rCookbook")

install.packages("ISLR")
## library load
search()
library(MASS)
library(ISLR)
search()


#################################
# 3. Linear Regression (p 127)
#################################
# if fix is not working go to Environment Global Environment
# Clear object
# https://stackoverflow.com/questions/24587980/fix-function-not-working-in-r

fix(college)
names(Boston)

lm.fit =lm(medv ~ lstat)
lm.fit =lm(medv ~ lstat , data=Boston )
attach (Boston )
lm.fit =lm(medv ~ lstat)
lm.fit

#################################
# 3.6.3 Multiple Linear Regression (p 128)
##################################
lm.fit =lm(medv ~ lstat + age , data=Boston )
lm.fit

# . = all data
lm_fit = lm( medv ~. , data=Boston)
lm_fit
# if pvalue is less than 0.05 it is not related to medv
summary(lm_fit)

############################
# Feature selection
############################
dim(Boston)
# 506 count 14 features

# if data has 13 features
# (forward method)
# set feature then add feature one by one from the first feature
# (backward method) 
# set all feature (13) then delete feature one by one

###############################
# Epsilon
# y = ax + ax^2 + ax^3 + E (E)

lm_fit2 =  lm(medv ~ lstat + I(lstat^2) + I(lstat^3) + I(lstat^4)     )
lm_fit2
summary(lm_fit2)

####
# 3.6.6 Qualitative Predictors
############################

# carsheet display
#We will attempt to predict Sales (child car seat sales) 
# in 400 locations
# based on a number of predictors.

# bad medium, goot

fix(Carseats)
names(Carseats)

lm_fit = lm(Sales ~. + Income :Advertising +Price :Age , data=Carseats)

lm_fit

summary(lm_fit)

attach (Carseats )
contrasts (ShelveLoc )

LoadLibraries=function (){
   library (ISLR)
   library (MASS)
   print (" The libraries have been loaded .")
}
#library
search()
#packages
installed.packages()

LoadLibraries


################################
# 4.6 Lab: Logistic Regression, LDA, QDA, and KNN
######################################

# f(x) = e^x / 1+ e^x


# compare up and down of stock price

library (ISLR)
names(Smarket)

Smarket
# 2001~ 20015

summary(Smarket)
# 2001 ~ 2005
# Today up/down compare to yesterday

# minus -9 index column
# Year""Lag1""Lag2" "Lag3""Lag4""Lag5""Volume" "Today""Direction"   



# correlation 
# +1 plus cor 
# -1 minus cor
head(Smarket)
names(Smarket)
cor(Smarket[,-9])

head(Smarket[-9])

attach (Smarket )
plot(Volume )

#############################
# 4.6.2 Logistic Regression
#############################
### Classification 0 or 1
### P = ex/1+ex
#This data set consists of
#percentage returns for the S&P 500 stock index over 1, 250 days, from the
#beginning of 2001 until the end of 2005. For each date, we have recorded
#the percentage returns for each of the five previous trading days, Lag1
#through Lag5. We have also recorded Volume (the number of shares traded
#                                            4.6 Lab: Logistic Regression, LDA, QDA, and KNN 155
#                                            on the previous day, in billions
glm_fit=glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume ,
            data=Smarket ,family =binomial )

summary (glm_fit )

coef(glm_fit)

summary (glm_fit )$coef

summary (glm_fit )$coef [,4]


glm.probs =predict (glm_fit ,type ="response")
glm.probs [1:10]

# defining up -> 1 down -> 0
contrasts (Direction )


glm.pred = rep("Down", 1250)

# if the prob value is upper than 0.5 put "Up"
glm.pred[ glm.probs > 0.5] ="Up"

table(glm.pred, Direction)

Direction

?Predict

# train True/False
train =(Year <2005)

# get Data if train is false

Smarkek_2000= Smarket [ train ,]
Smarkek_2005= Smarket [! train ,]

Direction_2005 = Smarkek_2005["Direction"]

summary(Smarkek_2005)

dim(Smarkek_2000)
dim(Smarkek_2005)
dim(Direction_2005)

Smarkek_2000

#### Training 
# binomial -> logistic
# subset = train -> use only training set
glm_fit=glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume ,
            data=Smarket ,family =binomial , subset = train )

glm_probs = predict(glm_fit, Smarkek_2005, type="response")
# Walk forward

glm_probs
dim(Smarkek_2005)

glm_pred = rep("Down", 252)
glm_pred[ glm_probs > 0.5] = "Up"

glm_pred

final_result = cbind(Smarkek_2005,glm_pred)

final_result$Compare = final_result$Direction == final_result$glm_pred

final_result

ls()
