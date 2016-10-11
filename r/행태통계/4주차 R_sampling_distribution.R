#  Illustration of Central Limit distribution
#  sample size : 5,10,50


#  Population : Exponential ditribution with rate = 0.5 

#  CASE 1 : sample size = 5

# 각 원소를 저장할 공간을 행렬( 5 by 10000 )로 선언하고 모두 0을 집어 놓음 
sample_exp1 = matrix(0,5,10000)

# 반복문, i는 1부터 10000까지 1씩 늘어나면서 중괄호 안의 명령문을 수행
for (i in 1:10000 ){
  
  # 10000개의 sample을 sample_exp1의 열에 각각 저장 
  sample_exp1[,i] = rexp(5,0.5)
  #[,i] : column만 볼거야, rexp(5,0.5) : 5개의 값 랜덤하게 뽑아라, 람다=0.5인 exponential에서  
}

# sample_exp1에 저장된 각 sample에 대해서 평균 계산 
mean_sample_exp1 = apply(sample_exp1,2,mean) 
#apply : matrix안에서 row나 column수준에서 정보 처리할래
#숫자 2 : column기준으로 mean 계산해라, 1이면 row
result1 <- hist(mean_sample_exp1,breaks=seq(0,10,by=0.1),prob=TRUE,plot=TRUE)
#Prob=True : y축을 확률로 ㄱㄱ


#  CASE 2 : sample size = 10

# 각 원소를 저장할 공간을 행렬( 10 by 10000 )로 선언하고 모두 0을 집어 놓음 
sample_exp2 = matrix(0,10,10000)

# 반복문, i는 1부터 10000까지 1씩 늘어나면서 중괄호 안의 명령문을 수행
for (i in 1:10000 ){
  
  # 10000개의 sample을 sample_exp1의 열에 각각 저장 
  sample_exp2[,i] = rexp(10,0.5)
  
}

# sample_exp1에 저장된 각 sample에 대해서 평균 계산 
mean_sample_exp2 = apply(sample_exp2,2,mean)
# 히스토그램
result2 <- hist(mean_sample_exp2,breaks=seq(0,10,by=0.1),prob=TRUE,plot=TRUE)


#  CASE 3 : sample size = 50
 
sample_exp3 = matrix(0,50,10000)

for (i in 1:10000 ){
  
  sample_exp3[,i] = rexp(50,0.5)
  
}

mean_sample_exp3 = apply(sample_exp3,2,mean)
result2 <- hist(mean_sample_exp3,breaks=seq(0,10,by=0.1),prob=TRUE,plot=TRUE)


mean1 = mean(mean_sample_exp1)
mean2 = mean(mean_sample_exp2)
mean3 = mean(mean_sample_exp3)
#1만개 column 썼으니까=1만번 샘플 뽑았으니까 mean은 거의 같지

sd1 = sd(mean_sample_exp1)*sqrt(5)
sd2 = sd(mean_sample_exp2)*sqrt(10)
sd3 = sd(mean_sample_exp3)*sqrt(50)
#마찬가지 1만번 했으니 잘 맞겠지 그래도 sample 클수록 잘 되더라


