
#[데이터 가져오기]
#################################
#### 데이터프레임으로 데이터 가져오기 
#################################
# header값이 있으면 TRUE
# 문자열이 자동으로 Factor 자료형으로 변환되지 않도록  FALSE
# sep(=seperator) 구분자는 쉼표 
getwd()
root_dir <- "D://rLecture//R//rCookbook"
mnet_csv_file <- file.path(root_dir, "/data/sample_kopo.csv")
salesDf <- read.csv(file=mnet_csv_file,header=TRUE, sep=",",stringsAsFactors = FALSE)
str(salesDf)
head(salesDf,15)

# attach()함수 : 테이블명$컬럼명에서 테이블명 생략 처리하여 데이터프레임 활성화
attach(salesDf) 
class(salesDf)

#################################
#[특정 컬럼 조회하기]
#################################
#문제1. sample_kopo테이블의 product 컬럼과 year컬럼만 출력하시오
testDfSelectColumns = salesDf[,c('product','year')]
testDfSelectColumns

install.packages("dplyr")
library(dplyr)
testDfSelectColumns2 = select(salesDf, product,year)

#################################
#[특정 행 조건 부여하여 조회하기]
#################################
#문제2. sample_kopo테이블의 product 컬럼에서 상품명이 
# 접근방법#1
testDfSelectRows1= salesDf[product %in% c("PRODUCT1","PRODUCT2") & sales_qty >=1000,]

# 접근방법#2
testDtSelectRows2 = subset(salesDf,product %in% c("PRODUCT1","PRODUCT2") & 
                             sales_qty >= 1000)

#################################
#[Missing Value 조회하기]
#################################
#문제4. sample_kopo테이블의 Capa컬럼에서 값이 NA인 행이 있는지 조회하시오.

salesDf1 <- salesDf[is.na(salesDf$Capa),]
salesDf1 <- salesDf[!is.na(salesDf$Capa),]

salesDf2 = subset(salesDf,is.na("Capa"))
salesDf2 = subset(salesDf,!is.na("Capa"))

#################################
# [데이터 조작하기]
#################################
#문제5. sample_kopo테이블의 Capa컬럼에서 값이 '-'인 경우 500으로 바꾸어서 출력하시오.
# 조회된 데이터 범위에 대한 값 변경하기
salesDf$Capa[salesDf$Capa=="-"] <- 999

#################################
#[정렬하기]
#################################
#문제6. sample_kopo테이블의 subsidiary, product, model컬럼을 별도로 변수(seg=segmentation)에 담고,
#seg에 mon컬럼을 추가하여 정렬할 기준컬럼을 만들고 데이터를 정렬하여 내림차순으로 출력하시오.
seg = c('subsidiary','product')
by.var <- c(seg, 'year','mon')

#접근방법
testDfOrderValue = salesDf[order(subsidiary,product,model,year,mon, decreasing=F), ]
testDfOrderValue

#################################
#[집계함수]
#################################
#문제7. 위에서 정한 seg변수를 이용하여 year컬럼과 mon컬럼을 추가하여 그룹핑할 기준컬럼을 만들고
#subsidiary, product, model,mon별 sales_qty 평균을 구하여 출력하시오.
seg
by.var <- c(seg,'year','mon')

#접근방법 1 
testDfGroupValue = aggregate(sales_qty~subsidiary+product+year+mon, salesDf, mean )
testDfGroupValue

#접근방법 2
#install.packages("dplyr")
library("dplyr")
testDfGroupValue2  <- salesDf %>%
  group_by(subsidiary, product, year, mon) %>%
  summarize(sales_qty = mean(sales_qty))

#################################
#[데이터 조인]
#################################
#문제8. 위에서 구한 testDfGroupValue를  sample_kopo테이블과 조인하는데 seg변수를 이용하여
#year컬럼과 mon컬럼을 추가하여 조인할 기준컬럼을 만들고 테이블을 조인하여 출력하시오.
#all.x = TRUE는 레프트조인 ,false가 이너조인
#접근방법 1 
by.var = c(seg,"year","mon")
testDfJoinValue =  merge(x=salesDf, y=testDfGroupValue, by = by.var, all.x=TRUE)
testDfJoinValue2 =  merge(x=salesDf, y=testDfGroupValue, by = by.var, all.y=TRUE)

#접근방법 2
testDfJoinValue3 <- salesDf%>%inner_join(testDfGroupValue,by= seg)
colnames(testDfJoinValue3)[which(colnames(testDfJoinValue3) %in% c("sales_qty.y") )] <- c("sales_qty_avg")

#################################
#[컬럼 연산]
#################################
#문제9. 위에서 구한 결과값의의 sales_qty컬럼과 sales_qty의 평균값인 sales_qty_avg을 구해서
#sales_qty컬럼을 sales_qty_avg로 나누어 계산된 파생컬럼을 calc_value컬럼으로 새로로 추가한 테이블을 출력하시오.
testDfJoinValue3$ratio <- testDfJoinValue3$sales_qty.x / testDfJoinValue3$sales_qty_avg

