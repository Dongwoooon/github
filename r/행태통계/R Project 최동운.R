setwd("C:\\Users\\dwchoi\\Dropbox\\공부할거\\코딩\\r\\term")
library(MASS)
library(dplyr)
library(psych)
library(stats)
library(agricolae)

library(sqldf)

mydata <- read.csv("R_exam.csv",header=TRUE)


tmp <- sqldf("select subject, treatment, sum(ape) as sape from mydata group by subject, treatment")

##prob 1

mape = as.vector(tapply(mydata$ape,mydata$subject,mean)) #subject에 따라 ape의 mean을 보여준 후 벡터로 만들어
subject = c(1:150)
treatment = factor(c(rep(1,30),rep(2,30),rep(3,30),rep(4,30),rep(5,30)))

madat = data.frame(subject=subject,treatment=treatment,mape=mape)
attach(madat)
boxplot(mape~treatment)
tapply(mape,treatment,describe)

##prob 2
result.aov=aov(mape~treatment)
summary(result.aov) #p-value가 매우 낮으므로 reject the null!

##prob 3
lsd = LSD.test(result.aov,"treatment",group=FALSE)
lsd #1-3-5 vs 2-4

##prob 4
pop=matrix(data=NA,nrow=30,ncol=5)
for(i in 1:5){
  pop[,i]=madat[treatment==i,3]
}

var.test(pop[,1],pop[,2])$p.value
var.test(pop[,1],pop[,3])$p.value
var.test(pop[,1],pop[,4])$p.value
var.test(pop[,1],pop[,5])$p.value
var.test(pop[,2],pop[,3])$p.value
var.test(pop[,2],pop[,4])$p.value
var.test(pop[,2],pop[,5])$p.value
var.test(pop[,3],pop[,4])$p.value
var.test(pop[,3],pop[,5])$p.value
var.test(pop[,4],pop[,5])$p.value

##prob 5
t.test(pop[,1],pop[,2])$p.value
t.test(pop[,1],pop[,3])$p.value
t.test(pop[,1],pop[,4])$p.value
t.test(pop[,1],pop[,5])$p.value
t.test(pop[,2],pop[,3])$p.value
t.test(pop[,2],pop[,4])$p.value
t.test(pop[,2],pop[,5])$p.value
t.test(pop[,3],pop[,4])$p.value
t.test(pop[,3],pop[,5])$p.value
t.test(pop[,4],pop[,5])$p.value