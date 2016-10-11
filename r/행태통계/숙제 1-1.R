#  Central Limit Theorem
#  sample size : 5,10,50
#  Population : Uniform ditribution, [-3,4] 

#  CASE 1 : sample size = 5
sample_exp1 = matrix(0,5,10000) # 각 원소를 저장할 공간을 행렬( 5 by 10000 )로 선언하고 모두 0을 집어 넣음

# 10000개의 sample을 sample_exp1의 열에 각각 저장 
for (i in 1:10000 ){
  sample_exp1[,i] = runif(5,-3,4)
}
mean_sample_exp1 = apply(sample_exp1,2,mean) # sample_exp1에 저장된 각 sample(column)에 대해서 평균 계산
result1 <- hist(mean_sample_exp1,breaks=seq(-5,5,by=0.1),prob=TRUE,plot=TRUE) # 히스토그램


#  CASE 2 : sample size = 10
sample_exp2 = matrix(0,10,10000)
for (i in 1:10000 ){   
  sample_exp2[,i] = runif(10,-3,4)
}
mean_sample_exp2 = apply(sample_exp2,2,mean)
result2 <- hist(mean_sample_exp2,breaks=seq(-5,5,by=0.1),prob=TRUE,plot=TRUE)


#  CASE 3 : sample size = 50
sample_exp3 = matrix(0,50,10000)
for (i in 1:10000 ){
  sample_exp3[,i] = runif(50,-3,4)
}
mean_sample_exp3 = apply(sample_exp3,2,mean)
result3 <- hist(mean_sample_exp3,breaks=seq(-5,5,by=0.1),prob=TRUE,plot=TRUE)

mean1 = mean(mean_sample_exp1)
mean2 = mean(mean_sample_exp2)
mean3 = mean(mean_sample_exp3)

sd1 = sd(mean_sample_exp1)*sqrt(5)
sd2 = sd(mean_sample_exp2)*sqrt(10)
sd3 = sd(mean_sample_exp3)*sqrt(50)

