# page 318
library(ISLR)

#install.packages("tree")
library(MASS)
set.seed(1)

# medv : value of house
train = sample(1:nrow(Boston), nrow(Boston) / 2)
names(Boston)
tree.boston = tree(medv ~. , Boston, subset = train)
summary (tree.boston )

#install.packages("ggplot2")
library(ggplot2)

text(tree.boston ,pretty =0, cex = 0.7)

View(Boston)
