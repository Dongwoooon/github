# Uniform distribution

# 누적확률분포값 계산 P(x<2)
punif(2,0,4)                                          

# 누적확률분포함수의 역함수 계산, p(X<x)=0.5일 때 x는?
qunif(0.5,0,4)                                        

# 모수가 0,4 인 uniform distribution에서 10000개의 random sample을 "sample"이라는 벡터로 저장
sample <- runif(10000,0,4)                            

#  "sample"이라는 벡터에 대해서 히스토그램을 그리고 관련 결과물을 result에 저장
result <- hist(sample,breaks=10,plot=TRUE,prob=TRUE)  



# Normal distribution 

pnorm(0,0,1)
qnorm(0,0,1)
sample <- rnorm(100000,3,2)
result <-hist(sample,breaks=40,plot=TRUE,prob=TRUE)



# Poisson approximation of Binomial Distribution
# 이항분포(binomiral distribution)을 포아송 분포로 근사한 결과물 비교

approx <- function(n,p,low,max){
  
  # 인수를 n, p, low, max로 갖는 함수를 정의
  
  # low부터 max까지(정수) 모수를 n,p로 갖는 이항분포의 probability mass function 값을 bino_prob에 저장
  bino_prob <- dbinom(low:max,n,p)
  
  # low부터 max까지(정수) 모수를 nXp로 갖는 포아송분포의 probability mass function 값을 pois_prob에 저장
  pois_prob <- dpois(low:max,n*p)
  
  # bino_prob와 pois_prob를 행기준으로 합쳐서 prob에 저장
  prob <- rbind(bino_prob,pois_prob)
  
  # prob에 저장된 값을 barplot으로 그림.
  barplot(prob,beside=TRUE,names.arg=c(0:10),legend=c("Binomial","Poisson"),ylim=c(0,0.3),
          main=paste("Poisson approximation to Binomial, n=",n,", p=",p," mu=",n*p))  
 
}

# 위에 정의된 함수를 다양한 값으로 실행한 결과물을 보여줌 
approx(10,0.3,0,10)
approx(100,0.03,0,10)
approx(1000,0.003,0,10)




# Normal approximation of Binomial Distribution
# 이항분포를 정규분포로 근사한 결과물 비교 


# CASE 1  (n=100, p=0.5)
# 30부터 70까지(정수)에 대해  모수를 n=100, p=0.5를 갖는 이항분포의 pmf값을 저장
bino_prob1 <- dbinom(30:70,100,0.5)
# 위에 저장된 결과물을 barplot으로 그림 
barplot(bino_prob1,names.arg=c(30:70), space=0, xlim=c(0,40), ylim=c(0,0.1),xpd=FALSE,
        main=paste("Normal approximation to Binomial, n=",100,", p=",0.5), xlab="x")


#  x가 0부터 41의 값을 가질 때( from=0, to=41,) 
#  dnorm(x+29.5, 100*0.5, sqrt(100*0.5*0.5)), 
#  즉 평균이 100*0.5이고 분산이 100*0.5*0.5 인 정규분포의 probability density function값을 
#  위에서 그려진 bar plot의 x축 0부터 40까지의 구간에서 (xlim = c(0, 40))
#  curve를 그려주는 작업 
curve(dnorm(x+29.5, 100*0.5, sqrt(100*0.5*0.5)), from=0, to=41, xlim = c(0, 40),add=T, col="blue")



sum(dbinom(45:55, size=100, prob=1/2))   # P(45<=Bino<=55)
pnorm(55.5,50,5)-pnorm(44.5,50,5)        # P(44.5<Normal<55.5) with continuity correction
pnorm(55,50,5)-pnorm(45,50,5)            # P(45<Normal<55)     without continuity correction



# CASE 2  (n=10, p=0.5)
bino_prob2 <- dbinom(0:10,10,0.5)
barplot(bino_prob2, names.arg=c(0:10), space=0, xlim=c(0,10), ylim=c(0,0.3),
        main=paste("Normal approximation to Binomial, n=",10,", p=",0.5)) 
curve(dnorm((x-0.5), 10*0.5, sqrt(10*0.5*0.5)), from=0, to=11, xlim = c(0,11), add=T, col="blue") 

sum(dbinom(3:7, size=10, prob=1/2)) 
pnorm(7.5, mean=5, sd=sqrt(2.5)) - pnorm(2.5, mean=5, sd=sqrt(2.5)) 
pnorm(7, mean=5, sd=sqrt(2.5)) - pnorm(3, mean=5, sd=sqrt(2.5)) 


