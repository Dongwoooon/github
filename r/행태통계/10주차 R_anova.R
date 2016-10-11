setwd("d:/")
library(MASS)
library(dplyr)
library(psych)
library(stats)
library(agricolae)


#########################################################
## Return, page : 537, SalesSalry - ANOVA


mydata <- read.csv("d:/SalesSalary.csv",header=TRUE) #data 1st row의 header 다 가져 
names(mydata) #헤더들 보여줌
attach(mydata) #mydata$header를 header만 적어도 호출하도록 바꿔 줌

decribeBy(Salary....,list(Positioin,Experience))

## ony-way ANOVA with single factor
tapply(Salary....,Position,describe) #describe에서 position(factor)에 따라 salary(variable)의 요약 통계를 보여줘 
result1=aov(Salary....~Position) #aov(variable~factor) : 1-way anova, variable에 대해서 factor 사용 
summary(result1)
boxplot(Salary....~Position) #데이터를 그림으로 보여 줌 (facotr 마다 평균, interval 보여줌)

tapply(Salary....,Experience,describe)
result2=aov(Salary....~Experience)
summary(result2)
boxplot(Salary....~Experience)

## two-way ANOVA with single factor
result3=aov(Salary....~Position + Experience) #aov(variable~fac1+fac2) : no interaction 2-way anova, variable에 대해서 factor 2개 사용
summary(result3)
boxplot(Salary....~Position + Experience)

result3=aov(Salary....~Position * Experience) #aov(variable~fac1*fac2) : interaction 2-way anova, variable에 대해서 factor 2개 사용
summary(result3)
boxplot(Salary....~Position * Experience)

#########################################################
## Return, page : 536, SalesSalry - ANOVA

mydata <- read.csv("d:/Medical1.csv",header=TRUE)
names(mydata)
attach(mydata)

response = c(as.matrix(mydata)) #mydata를 matrix로 만든 후, 각 column들을 하나의 column으로 합친다
treatment = factor(c(rep(names(mydata[1]),length(mydata[[1]])),rep(names(mydata[2]),length(mydata[[2]])),rep(names(mydata[3]),length(mydata[[3]]))))
#response에 해당하는 treatment들 대응 시키기 위해 factor column만들어 보자
#mydata[1] : florida, mydata[[1]] : # of florida / rep : replication

trans1 = data.frame(response=response,treatment=treatment) #data frame 만들자 response column과 treatment column 붙여서(lsd 하려고 data로 만듦)

describeBy(trans1$response,trans1$treatment)

result1 = aov(trans1$response~trans1$treatment,data=trans1)
summary(result1)

lsd1 = LSD.test(result1,"trans1$treatment",group=FALSE) #lsd test(anova 결과물, factor들, false 넣어야 pairwise로 비교)

mydata <- read.csv("d:/Medical2.csv",header=TRUE)
names(mydata)
attach(mydata)

response = c(as.matrix(mydata))
treatment = factor(c(rep(names(mydata[1]),length(mydata[[1]])),rep(names(mydata[2]),length(mydata[[2]])),rep(names(mydata[3]),length(mydata[[3]]))))

trans2 = data.frame(response=response,treatment=treatment)

describeBy(trans2$response,trans2$treatment)

result2 = aov(trans2$response~trans2$treatment,data=trans2,group=FALSE)

lsd2 = LSD.test(result2,"trans2$treatment")

