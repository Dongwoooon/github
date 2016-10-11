## Interval Estimation
install.packages("psych")
install.packages("dplyr")
library(MASS)
library(dplyr)
library(psych)

setwd("C:\Users\dwchoi\Dropbox\공부할거\16\행태통계\r")


#########################################################
# Exercise 47

mydata <- read.csv("C:/Users/dwchoi/Dropbox/공부할거/16/행태통계/r/NYSEStocks.csv")

summary(mydata)

# interval estimation of population mean with unknown variance

# size of sample
#[n]:n번째 column 호출 [[n]] : n번째 column에서 head 떼고 data만 호출
n=length(mydata[[3]])
n
#sample mean
xbar=mean(mydata[[3]])
xbar
#sample standard deviation
s=sd(mydata[[3]])
s
#margin of error
#t-statistics 할거야, qt(a,b) = x : t(X<x)=a, b=d.o.f
ME=qt(0.975,df=n-1)*s/sqrt(n)
ME
# 95% confidence interval
conf_interval = xbar + c(-ME,ME)
conf_interval

# interval estimation of population proportion

# number of Yes(Binomial에서 Y=1 잡아내기)
yes_num = sum(mydata[[2]]=="Yes")
# sample proportion
pbar=yes_num/n
pbar
#margin of error
ME=qnorm(0.975,0,1)*sqrt(pbar*(1-pbar)/n)
# 95% confidence interval
conf_interval=pbar + c(-ME,ME)
conf_interval




########################################################################################
## Case Problem 2

gulf <- read.csv("C:/Users/dwchoi/Dropbox/공부할거/16/행태통계/r/GulfProp.csv")


## problem 1,2,3
summary = describeBy(gulf,gulf$Location)
#gulf를 describe 해 주세요, $Location에 대해 (gulf[1]과 같음)
summary
summary$Gulf_view #==summary[1]
summary$No_Gulf_view #==summary[2]

## Problem 4,5

## Method 1 : summary table 활용법

#t distribution ㄱㄱ
summary$Gulf_view$Conf.95.lower = summary$Gulf_view$mean - qt(0.975,df=39)*summary$Gulf_view$se
summary$Gulf_view$Conf.95.upper = summary$Gulf_view$mean + qt(0.975,df=39)*summary$Gulf_view$se

summary$No_Gulf_view$Conf.95.lower = summary$No_Gulf_view$mean - qt(0.975,df=17)*summary$Gulf_view$se
summary$No_Gulf_view$Conf.95.upper = summary$No_Gulf_view$mean + qt(0.975,df=17)*summary$Gulf_view$se

summary


## Method 2 : dplyr 패키지를 사용하는 방법
# a %>% f(b) = f(a,b) 
confidence_List = gulf %>% group_by(Location) %>%   
                  summarise(num=length(List.Price),
                            List.mean=mean(List.Price),
                            List.sd=sd(List.Price)) %>%
                  mutate(List.95.lower=List.mean-qt(0.975,df=num-1)*List.sd/sqrt(num),
                         List.95.upper=List.mean+qt(0.975,df=num-1)*List.sd/sqrt(num))

confidence_Sale  = gulf %>% group_by(Location) %>% 
                   summarise(num=length(Sale.Price),
                             Sale.mean=mean(Sale.Price),
                             Sale.sd=sd(Sale.Price)) %>%
                    mutate(Sale.95.lower=Sale.mean-qt(0.975,df=num-1)*Sale.sd/sqrt(num),
                           Sale.95.upper=Sale.mean+qt(0.975,df=num-1)*Sale.sd/sqrt(num))

confidence_Days  =  gulf %>% group_by(Location) %>% 
                    summarise(num=length(Days.to.Sell),
                              Days.mean=mean(Days.to.Sell),
                              Days.sd=sd(Days.to.Sell)) %>%
                    mutate(Days.95.lower=Days.mean-qt(0.975,df=num-1)*Days.sd/sqrt(num),
                           Days.95.upper=Days.mean+qt(0.975,df=num-1)*Days.sd/sqrt(num))

confidence_List
confidence_Sale
confidence_Days

