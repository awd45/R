##Defining variables
a=1
a<-1

##mathmatical computation
x<-11
y<- 3

x+y
x*y
x/y
x^y
x%%y
pi
sqrt(2)
2*3

# Set working Directory
#Defining Working Directory
getwd()
setwd("D://rLecture//R//rCookbook")

## 자료형 생성
# Creating vector
vec1<-c(1,2,3,4)
vec2<-c(1.0,1,"ss")

# indexing (default indexing)
vec1[1]

# indexing (name indexing)
names(vec1) <- c("first","second")
vec1["first"]


#append
vec4<-append(vec1,5,after=2)

# Create vector
seq(from=0, to=10, by=1)
rep(1,10)

#패키지 인스톨
install.packages("data.table")

#패키지 불러오기
library(data.table)

# Generate normailze variables (random)
# Standard norm -> avg(0), stdev(1)
normData <- rnorm(10)
linData <- 1:10
normData

max(normData)
min(normData)
sum(normData)
mean(normData)
median(normData)
quantile(normData, probs=c(0.2,0.7))

var(normData)
sd(normData)
cov(normData) # 공분산 
cor(normData,linData)

# Generate normailze variables (random)
# Standard norm -> avg(0), stdev(1)
normData <- rnorm(10)

sort(normData)
rank(normData)
order(normData)

# condition (including missingValue)
normData[normData>0.2]
normData[is.na(normData)]
normData[!is.na(normData)]

# Data manipulation
x<- 1:4
y<- 5:8

cbind(x,y)
rbind(x,y)

#####################################
# Loading Dataframe
#################### READ FILE
sales_csv_file <- file.path(getwd(), 
                            "/data//sample_kopo.csv")
?fread
salesDf <- fread(sales_csv_file)


# data type check
class(salesDf)

## data타입 변환
salesDt <- data.table(salesDf) 


## selecting Specific Columns
## [condition, .(column list)]
testDtSelectColumns = salesDt[, .(product,year)]

# 원하는 조건 selecting하기
testDtSelectRows = salesDt[
  product %in% c("PRODUCT1","PRODUCT2") & 
    sales_qty >= 1000]

testDtSelectRows = salesDt[
  product == "PRODUCT1" & sales_qty >= 1000]

#null값 처리
salesDt[is.na(Capa)]


## Manupulating Value
## [condition, value]
testDtMissingValue = salesDt[Capa=="-", Capa := 500]


## Defining Seg 
seg <- c('subsidiary', 'product' ,'model')

## Sorting Data
by.var <- c(seg, 'mon') #그룹바이 키와 같음
setkeyv(salesDt, by.var)

## Grouping Data
by.var <- c(seg, 'year', 'mon')
testDtGroupValue <- salesDt[
  ,  .(sales_qty = mean(sales_qty)), 
  by = by.var, with = T]

## Joining Data
## merge preDefinedData set data
testDtMergeValue <- salesDt[testDtGroupValue,
                            sales_qty_avg := i.sales_qty,
                            on=c(seg,"year","mon")]


## Calculate DataTable
testDtCalcValue <- testDtMergeValue[
  , calc_value := sales_qty/sales_qty_avg ]














