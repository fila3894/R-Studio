#표본 추출, 복원을 해줘야 나옴
sample(c("앞면", "뒷면"), 20, replace=T)
#난수 발생
runif(10, min = 0, max = 10)

iteration <- 1000
plot(0, 0, xlab = "동전을 던진 횟수", ylab = "앞면 비율", xlim = c(0,iteration), 
     ylim = c(0,1))
abline(a=0.5, b=0, col="red")

sum<-0

#동전 던지기 반복
for(x in 1:iteration) {
  #동전 던진 결과
  coin <- sample(c("앞면", "뒷면"), 1, replace=T)
  
  if(coin == "앞면"){
    sum = sum + 1
  }
  #비율
  prob <- sum / x
  points(x, prob)
}

#뒷면
x <- sample(c(0,1), iteration, replace = T)
result <- sum(x) / iteration
#확률
round(result * 100, 1)
