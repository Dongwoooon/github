setwd("d:/")
library(MASS)
library(dplyr)
library(psych)
library(stats)

#########################################################
## Return, page : 444


mydata <- read.csv("d:/Return.csv",na.strings="")
mydata=mydata[1:dim(mydata)[1]-1,1:2]
#dim(x) : dim[1]은 x의 row 수, dim[2]는 x의 column 수
#mydata에서 row는 1~dim(mydata)[1] 까지, column은 1~2 까지만 들고와

summary=describe(mydata)
summary

sd=summary$sd[2]
n=summary$n[2]

conf.upper = (n-1)*sd^2/qchisq(0.025,n-1)
conf.lower = (n-1)*sd^2/qchisq(0.975,n-1)

sd.conf.upper=sqrt(conf.upper)
sd.conf.lower=sqrt(conf.lower)


#########################################################
## Return, page : 455

mydata <- read.csv("d:/Training.csv",na.strings="")

current = mydata[[1]][!is.na(mydata[[1]])]
sd1 = sd(current)
n1 = length(current)
propose = mydata[[2]][!is.na(mydata[[2]])]
sd2 = sd(propose)
n2 = length(propose)

test.stat = sd1^2/sd2^2
p.value = 2*min(pf(test.stat,n1-1,n2-1),1-pf(test.stat,n1-1,n2-1))





