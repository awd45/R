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

