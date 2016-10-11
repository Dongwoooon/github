#p~~ : P(X<a) = ?, cumulative function
#q~~ : P(X<?) = a, inverse of p~~
#r~~ : random

# Uniform distribution

punif(2,0,4) #punif(x,a,b) = p(X<x), a<x<b
qunif(0.5,0,4) #qunif(p(X<x),a,b) = x, a<x<b
sample <- runif(10000,0,4) #[0,4]unifdist에서 point 10000개 뽑아서 sample에다가 넣어라  
result <- hist(sample,breaks=20,plot=TRUE,prob=TRUE) 
#plot=true : 바로 그림 그려라 prob=true : y축을 개수 말고 prob형태로 나타내라

# Normal distribution

pnorm(0,0,1) #pnorm(x,mean,sd) = p(X<x)
qnorm(0,0,1) #qnorm(p(X<x),a,b) = x
sample <- rnorm(1000,3,2) #[mean=3, sd=2] normdist에서 point 1000개 뽑아서 sample에다가 넣어
result <-hist(sample,breaks=40,plot=TRUE,prob=TRUE)
lines(density(sample),col="blue") #sample의 desity를 blue line으로 표시해


# Poisson approximation of Binomial Distribution

approx <- function(n,p,low,max) #4가지 변수를 가지는 함수 만들거야
  
  {
  bino_prob <- dbinom(low:max,n,p) #dbinom : density of binomial dist, low:max = low~max까지 정수 모두
  pois_prob <- dpois(low:max,n*p)  #dpois : poisson dist
  prob <- rbind(bino_prob,pois_prob) #벡터들을 붙이는 데, row로 만들어서 붙여라 (l+l -> =)
  barplot(prob,beside=TRUE,names.arg=c(0:10),legend=c("Binomial","Poisson"),
          main=paste("Poisson approximation to Binomial, n=",n,", p=",p," mu=",n*p))  
  #bar graph 만들거고 변수들은 이런거 넣을거, beside=true : 두 개 붙여서 그려라
}

approx(10,0.3,0,10)
approx(100,0.03,0,10)
approx(1000,0.003,0,10)


# Normal approximation of Binomial Distribution

bino_prob1 <- dbinom(30:70,100,0.5)
barplot(bino_prob1,names.arg=c(30:70), space=0, ylim=c(0,0.1),
        main=paste("Normal approximation to Binomial, n=",100,", p=",0.5))
curve(dnorm(x+29.5, 100*0.5, sqrt(100*0.5*0.5)), from=0, to=40, 
      xlim = c(0, 40), ylim = c(0, 0.5), xlab = "x", add=T, col="blue")
#curve 만들어서 bar 위에 올려라

sum(dbinom(45:55, size=100, prob=1/2))   # P(45<=Bino<=55)
pnorm(55.5,50,5)-pnorm(44.5,50,5)        # P(44.5<Normal<55.5) with continuity correction
pnorm(55,50,5)-pnorm(45,50,5)            # P(45<Normal<55)     without continuity correction



bino_prob2 <- dbinom(0:10,10,0.5)
barplot(bino_prob2, names.arg=c(0:10), space=0, xlim=c(0,10), ylim=c(0,0.3),
        main=paste("Normal approximation to Binomial, n=",10,", p=",0.5)) 
curve(dnorm((x-0.5), 10*0.5, sqrt(10*0.5*0.5)), from=0, to=11, xlim = c(0,11), add=T, col="blue") 

sum(dbinom(3:7, size=10, prob=1/2)) 
pnorm(7.5, mean=5, sd=sqrt(2.5)) - pnorm(2.5, mean=5, sd=sqrt(2.5)) 
pnorm(7, mean=5, sd=sqrt(2.5)) - pnorm(3, mean=5, sd=sqrt(2.5)) 


