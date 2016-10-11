setwd("d:/")
library(MASS)
library(dplyr)
library(psych)
library(stats)

#########################################################
# CASE 2


mydata <- read.csv("d:/BLS.csv")


# 1)

summary=describe(mydata)
summary


# 2)  95% confidence interval

test = t.test(mydata$Weeks, alternative="two.sided", conf.level=0.95 )
#가설 안 집어넣으면 H0 : mu=0 으로 구함
names(test)
#test에 있는 개체의 category(column) 보여줌
test$conf.int
test$p.value

# 3) test

test = t.test(mydata$Weeks, alternative="greater", mu=14.6) #H0 : mu=14.6
test

# 4) scatter plot

plot(mydata$Age,mydata$Weeks, xlab="Age", ylab="Weeks", pch=10)


#######################################################
# Appendix WomenGolf
######################################################

proportion_test = function(success_num,n,p0,type.test,alpha){
  
  pbar = success_num/n
  test.static = (pbar-p0)/sqrt(p0*(1-p0)/n)
  
  if (type.test =="less"){
    
    pval = pnorm(test.static)
    
  }
  
  if (type.test =="greater"){
    
    pval = 1-pnorm(test.static)
    
  }
  
  if (type.test == "two.sided"){
  
    pval = 2*min(pnorm(test.static),1-pnorm(test.static))  
    
  }
  
  if (pval < alpha){
    
    conclusion = "rejected"
    
  }
  else {
    
    conclusion = "not rejected"
    
  }
  
  print(paste("Null Hypothesis : p0 =",p0))
  print(paste("Sample Proportion = ",pbar))
  print(paste("test statistic = ",test.static))
  print(paste("test type is ",type.test))
  print(paste("p-value = ",round(pval,3)))
  print(paste("Null is ",conclusion," at ", alpha," siginificance level"))
  
  
  list(pbar=pbar, p0=p0, test.static = test.static, pval=pval, type.test=type.test, alpha=alpha, conclusion=conclusion)
  #list(column이름 = 변수)
  #그냥 값만 내려면 return
}


mydata = read.csv("d:/WomenGolf.csv")
yes_num = sum(mydata[[1]]=="Female")

result = proportion_test(yes_num,length(mydata[[1]]),p0=0.2,type.test="two.sided",alpha=0.1)
result



