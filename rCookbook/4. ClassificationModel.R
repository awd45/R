# Classification

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

# train True/False
train =(Year <2005)

# get Data if train is false

Smarkek_2000= Smarket [ train ,]
Smarkek_2005= Smarket [! train ,]
summary(Smarkek_2005)

dim(Smarkek_2000)
dim(Smarkek_2005)
dim(Direction_2005)

Smarkek_2000

################### Training 
# binomial -> logistic
# subset = train -> use only training set
glm_fit=glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume ,
            data=Smarkek_2005 ,family =binomial)

################### Prediction
glm_probs = predict(glm_fit, Smarkek_2005, type="response")
# Walk forward

glm_probs
dim(Smarkek_2005)

glm_pred = rep("Down", 252)
glm_pred[ glm_probs > 0.5] = "Up"


final_result = cbind(Smarkek_2005,glm_pred)

final_result$Compare = final_result$Direction == final_result$glm_pred


final_result$answer <- ifelse(final_result$Direction == "Up", 1, 0)
final_result$prediction <- ifelse(final_result$glm_pred == "Up", 1, 0)

ls()

################### Evaluation
install.packages("ROCR")
library (ROCR)

y <- as.vector(final_result$answer)
predictions <- as.vector(final_result$prediction)

?prediction
pred <- prediction(predictions, y);

# Recall-Precision curve             
RP.perf <- performance(pred, "prec", "rec");

plot (RP.perf);

# ROC curve
ROC.perf <- performance(pred, "tpr", "fpr");
plot (ROC.perf);

# ROC area under the curve
auc.tmp <- performance(pred,"auc");
auc <- as.numeric(auc.tmp@y.values)
auc








############################
# 4.6.3 Linear Discriminant Analysis
#############################
# default averaeg and non-default average average
# 정규분포를 가지고 분리할때 가장 나이스하게 분리하는 방ㅂ
# for finance it is not so goot to apply LDA algorithm
# 등고선 직서

################### Training
lda_fit = lda(Direction ~ Lag1 + Lag2, data = Smarkek_2005)

lda_fit
# Group means
# -> Down norm(f(x)) up Norm (g(x)) 
# Coefficients of linear discriminants:
# Actually we have to divide two group in data
# Where we can design
# we find nice coefficient
# that's why the norm plot is similar 
# 

# foreign/Enterprise buy stock increase
# personal buy stock decrease
# personal/foreign <-- decide buy or sell
plot(lda_fit)

# Searching PCA Principle Component line

################### Prediction
lda_pred = predict(lda_fit, Smarkek_2005, type="response")
names(lda_probs)
lda_probs[]

lda_class =lda_pred$class
length(lda_class)
length(Direction_2005)
Direction_2005 = Smarkek_2005$Direction
table(lda_class ,Direction_2005)

# Evaluation
mean(lda_class == Direction_2005)

##############################
# Quadratic Discriminant Analysis
###############################
# Qda is better than LDA (정규분포가 다른경우 유용)
# if stardard norm is not beween data set
# 영역 나눔 커브가 나옴
qda_fit = qda(Direction ~ Lag1 + Lag2, data = Smarkek_2005)
qda_pred = predict(qda_fit, Smarkek_2005, type="response")
qda.class = predict(qda_fit, Smarkek_2005)$class

table(qda.class, Direction_2005)

##############################
# KNN(K-Nearest Neighhbors)
# 4.6.5 K-Nearest Neighbors
# if k value is small -> overfitting
# if k value is too large -> non meaningful analysis
#    answer -> bigger portion 
###############################
# Linear, LDA, QDA has line
# KNN has no line only region
library (class)

# extract train is true
train_X=cbind(Lag1 ,Lag2)[train ,] 
test_X=cbind (Lag1 ,Lag2)[!train ,]
train_Direction =Direction [train]

dim(train_X)
length(train_Direction)

# random number gerneration
# seed must set in order to get reproducaible result
# seed value will be fixed for random num generation
set.seed (1)

knn_pred=knn (train_X,test_X,train_Direction ,k=5)

table(knn_pred ,Direction_2005)



########################################
# 4.6.6 An Application to Caravan Insurance Data
########################################
dim(Caravan )

dim(Purchase)
attach (Caravan )
attach (Purchase )
summary (Purchase)

# Normalization
standardized_X=scale(Caravan [,-86])

# test data is 1 to 1000
test = 1:1000
test

# 1000~5820
train_X = standardized_X[ -test,]
# 1~1000
test_X = standardized_X[ test,]

train_Y = Purchase [-test]
test_Y = Purchase[test]

set.seed (1)

knn_pred=knn(train_X,test_X,train_Y,k=1)
knn_pred

# 88%  -> the result is goes no 
# This model is not good
# forexample cancel detection 
mean(test_Y ==knn_pred)
mean(test_Y!= knn_pred)

mean(test_Y!="No")

table(knn_pred, test_Y)
