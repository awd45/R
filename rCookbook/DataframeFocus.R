######################## Dataframe select ###################

#Loading Library
#install.packages("data.table")
library(data.table) 

#Defining Working Directory
getwd()
setwd("D://rLecture//rCookbook")

#####################################
# Creating Dataframe
dateIndex = c('2017-12-01','2017-12-02','2017-12-03','2017-12-04','2017-12-05','2017-12-06')
productNameList = c('REF','TV','MOBILE','REF','MOBILE',"")
volumeList = c(1000,2000,1500,1200,1700,1000)

testDf <- data.frame( date = dateIndex,
                      product = productNameList,
                      volume = volumeList)

#####################################
# Loading Dataframe
#################### READ FILE
sales_csv_file <- file.path(getwd(), "//data//sample_kopo.csv")
salesDf <- fread(sales_csv_file, check.names = T)

## datatable
salesDt <- data.table(salesDf) 

## selecting Specific Columns
## [condition, .(column list)]
testDtSelectColumns = salesDt[, .(product,year)]

## selecting Specific Row
## [condition]
testDtSelectRows = salesDt[product %in% c("PRODUCT1","PRODUCT2") & sales_qty >= 1000]
testDtSelectRows = salesDt[product == "PRODUCT1" & sales_qty >= 1000]

## selecting missingValue
## [condition]
salesDt[is.na(Capa)]

## Manupulating Value
## [condition, value]
testDtMissingValue = salesDt[Capa=="-", Capa := 500]

## Defining Seg
seg <- c('subsidiary', 'product')

## Sorting Data
by.var <- c(seg, 'mon')
setkeyv(salesDt, by.var)

## Grouping Data
by.var <- c(seg, 'year', 'mon')
testDtGroupValue <- salesDt[,  .(sales_qty = mean(sales_qty)), by = by.var, with = T]

## Joining Data
## merge preDefinedData set data
testDtMergeValue <- salesDt[testDtGroupValue,
                            sales_qty_avg := i.sales_qty,
                            on=c(seg,"year","mon")]

## Calculate DataTable
testDtCalcValue <- testDtMergeValue[, calc_value := sales_qty/sales_qty_avg ]



