# page 318
library(ISLR)

#install.packages("tree")
library(tree)

library("ISLR")

attach(Carseats)
Carseats

dim(Carseats)

### ifelse 
High = ifelse( Sales <= 8 , "No", "Yes")
length(High)
head(High)

Carseats = data.frame( Carseats, High)

### Sales column excluded
## Respond variable = High
## Feature are selected if entropy is high
?tree
tree.carseats = tree(High~. -Sales, data=Carseats)
# kmeans clustering sse

summary(tree.carseats)

## Visualize it
plot(tree.carseats)
text(tree.carseats, pretty=1, cex=0.7)
tree.carseats

## fix the seed value to do not make ..
set.seed(1)
## train has random number (size = 200)
train = sample(1:nrow(Carseats), 200)
## get data except index of train
Carseats.test = Carseats[-train,]

# training using training set (only use 200)
tree.carseats = tree(High ~ .-Sales, Carseats, subset = train)

# type = class <-- classification
tree.pred = predict(tree.carseats, Carseats.test, type="class")

High.test = High[-train]
table(tree.pred, High.test)

result = cbind.data.frame(Carseats.test, tree.pred)
dim(result)
