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


#########################################################
## proportion difference, Page : 418
## Matched sampling

mydata <- read.csv("d:/TaxPrep.csv",na.strings="")
#na.string="xxx" : xxx=na로 처리

office1=mydata[[1]][!is.na(mydata[[1]])]
office2=mydata[[2]][!is.na(mydata[[2]])]

summary1=summary(office1)
summary2=summary(office2)

z.prop = function(x1,x2,n1,n2,type,alpha){
  
  numerator = (x1/n1) - (x2/n2)
  p.common = (x1+x2) / (n1+n2)
  denominator = sqrt(p.common * (1-p.common) * (1/n1 + 1/n2))
  z.prop.stat = numerator / denominator
  conc="do not reject"
  
  if (type=="two.sided"){
    
    p.value = 2*min(pnorm(z.prop.stat),1-pnorm(z.prop.stat))
    # 양쪽일 때 왼쪽 오른쪽 중 작은거 골라서 x2 하면 p-value 나오지 
    
    if (p.value < alpha){
      
      conc = "reject"
      
    }
    
  }
  else if (type=="greater"){
    
    p.value = 1-pnorm(z.prop.stat)
    
    if (p.value < alpha){
      
      conc = "reject"
      
    }
    
  }
  else if (type=="less"){
    
    p.value = pnorm(z.prop.stat)
    
    if (p.value < alpha){
      
      conc = "reject"
      
    }
    
  }
  
  list(z.prop.stat=z.prop.stat,conc=conc,p.value=p.value,alpha=alpha,type=type)
  
}

result=z.prop(sum(office1=="Yes"),sum(office2=="Yes"),length(office1),length(office2),type="two.sided",alpha=0.05)





