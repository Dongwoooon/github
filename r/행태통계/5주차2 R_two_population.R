setwd("d:/")
library(MASS)
library(dplyr)
library(psych)
library(stats)

#########################################################
## SoftwareTest, page : 406
## Indepedent Sampling


mydata <- read.csv("d:/SoftwareTest.csv")

summary=describe(mydata)
summary

test=t.test(mydata[[1]],mydata[[2]],alternative="greater",mu=0)
test


#########################################################
## Matched, Page : 411
## Matched sampling

mydata <- read.csv("d:/Matched.csv")

summary=describe(mydata)
summary

test=t.test(mydata[[2]],mydata[[3]],paired=TRUE,mu=0)
test











