# Sample proportion

# Central limit theorem 불가 (np<5 or n(1-p)<5)
bino_prob1 <- dbinom(0:5,5,0.4) 
barplot(bino_prob1, names.arg=c(0:5)/5, space=0, xlim=c(0,5), ylim=c(0,0.5),
        main=paste("Normal approximation to Binomial, n=",5,", p=",0.4)) 
curve(dnorm((x-0.5), 5*0.4, sqrt(5*0.4*0.6)), from=0, to=6, xlim = c(0,6), add=T, col="blue") 

approx_bino=sum(dbinom(1:3, size=5, prob=0.4))     # P(1<=Bino<=3)
real_norm=pnorm(3.5, 2, sqrt(1.2)) - pnorm(0.5, 2, sqrt(1.2))   # P(0.5<Normal<3.5) with continuity correction
error1=100*abs((approx_bino-real_norm)/real_norm)     # error(%)
error1

# Central limit theorem 가능 (np>=5 and n(1-p)>=5)
bino_prob2 <- dbinom(30:70,100,0.5) 
barplot(bino_prob2,names.arg=c(30:70)/100, space=0, ylim=c(0,0.1),
        main=paste("Normal approximation to Binomial, n=",100,", p=",0.5))
curve(dnorm(x+29.5, 100*0.5, sqrt(100*0.5*0.5)), from=0, to=40, 
      xlim = c(0, 40), ylim = c(0, 0.5), xlab = "x", add=T, col="blue")

approx_bino=sum(dbinom(45:55, size=100, prob=1/2))     # P(45<=Bino<=55) 
real_norm=pnorm(55.5,50,5)-pnorm(44.5,50,5)          # P(44.5<Normal<55.5) with continuity correction
error2=100*abs((approx_bino-real_norm)/real_norm)        # error(%)
error2
