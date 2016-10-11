library(MASS)
library(dplyr)
library(psych)
library(stats)

#########################################################
# CASE 1

data <- read.csv("C:/Users/dwchoi/Dropbox/공부할거/16/행태통계/r/숙제/Professional.csv")

# 1)
summary=describe(data)
summary

# 2)  95% confidence interval
summary$Conf.95.lower = summary$mean - qt(0.975,df=409)*summary$se
summary$Conf.95.upper = summary$mean + qt(0.975,df=409)*summary$se

summary[1,]$Conf.95.lower #95% for age
summary[1,]$Conf.95.upper

summary[7,]$Conf.95.lower #95% for household income
summary[7,]$Conf.95.upper

# 3)  95% confidence interval
n=summary[6,2]

  # for broadband
yes_num = sum(data[[6]]=="Yes")
pbar=yes_num/n   # sample proportion
pbar

ME=qnorm(0.975,0,1)*sqrt(pbar*(1-pbar)/n) #margin of error = z*s
conf_interval=pbar + c(-ME,ME) # 95% confidence interval
conf_interval

  # for children
yes_num = sum(data[[8]]=="Yes")
pbar=yes_num/n   # sample proportion
pbar

ME=qnorm(0.975,0,1)*sqrt(pbar*(1-pbar)/n) #margin of error = z*s
conf_interval=pbar + c(-ME,ME) # 95% confidence interval
conf_interval

# 4) 
# 상대적으로 broadband 접근성이 높고 income이 높다면 적절함 그러나 상대적인 비교가 불가능

# 5) 
# Children이 있고 income이 높으며 여성이 많을 경우 적절함 그러나 상대적인 비교가 불가능
yes_num = sum(data[[2]]=="Female")
pbar=yes_num/n   # sample proportion
pbar

#6 비교 대상이 있어야 누구에 비해서 이런 이런게 높으니까 여기에 집중해서 봐라 할텐데...


