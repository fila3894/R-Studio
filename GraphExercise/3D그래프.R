iteration <- 1000
n_circle <- 0

plot(NA, xlim = c(0,1), ylim = c(0,1))
pts <- NULL


for(i in 1:iteration) {
  # 임의의 위치에 점 생성
  x <- runif(1, min = 0, max = 1)
  y <- runif(1, min = 0, max = 1)
  
  pts <- rbind(pts, c(x, y))
  
  #거리 계산
  dist <- sqrt(x^2 + y^2)
  
  if(dist <= 1) {
    n_circle <- n_circle + 1
  }
}

points(pts, pch=19, cex=0.5, col="black")
pi <- 4 * n_circle / iteration
