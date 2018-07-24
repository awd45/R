
a<-1

# 인터렉티브 환경
pi
sqrt(2)
#벡터 생성 create
c(1,2,3,4)

# 변수 선언 일반적으로 <- 사용 많이함
a=1
a<-1
############################
####### 2.1 Printing Something
############################
#벡터 생성 create
tempVector <- c(1,2,3,4)
#평균
mean(x)
#표준편차
sd(x)
#분산
var(x)

# 물어보기 찬스 사용하기
?matrix

# 메트릭스 (행과 열이 있는 데이터 생성)
x <- matrix( c(1,2,3,4), 2,2)
y <- matrix(tempVector,2,2)
# 행을 먼저 수행함
z <- matrix(tempVector,2,2, byrow=2)

#
# cat 과 print의 차이는 print는 포매팅이 가능하다.
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

# 인덱스 유의하기 첫번째는 진짜 첫번째다
# 전산 랭기지가 아님
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
### 변수 메모리에서 다루기
# 사용된 변수 리스트
ls()
?rm
# 특정 변수 삭제
rm(x)
# 전체변수 삭제
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

## 백터 합치기
w = c(v1,v2)
w

v1
## vector 타입이 2개 혼재할경우 변환가능한 타입으로 자동변환
v3 <- c("A","B","C")
w1 <- c(v1,v3)
w1

## class를 통해 타입 확인 가능함 class 가 더 많이 사용됨
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

# 벡터의 연산 
# R의 장점
# (loop 돌리지 않고 한문장으로 표현가능하다)
y <- log(x+1)
z <- x+1
z

# x와 y 값의 상관관계 확인
cor(x,y)
