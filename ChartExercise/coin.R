plot(NA, xlab = "동전을 던진 횟수", ylab = "앞면이 나오는 확률",
     xlim = c(0,1000), ylim = c(0,100),
     main = "동전 던지는 횟수에 따른 앞면이 나올 확률 변화")
abline(h=50, col="red", lty=1.5)

count<-0

for(n in 1:1000){
  coin<-sample(c("앞면","뒷면"), 1)
  
  if(coin == "앞면"){
    count = count + 1
  }
  
  prob <- ((count / n) * 100)
  
  points(n, prob)
  
}
