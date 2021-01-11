x <- c(1, 2.2, 3.3, 4, 5.7, 6.1, 7.3, 8.6, 9.1, 10)
y <- c(41, 47, 62, 75, 85, 90, 110, 115, 125, 140)
plot(x, y, xlim = c(0, 10), ylim = c(0, 150))

# 기울기 b, y절편 a, y=bx+a

B <- seq(-5, 15, by=1)
A <- seq(-30, 30, by=1)

cost.mtx <- matrix(NA, nrow = length(B), ncol = length(A))

for(i in 1:length(B)) {
  for(j in 1:length(A)) {
    err.sum <- 0
    
    for(k in 1:length(x)) {
      y_hat <- B[i] * x[k] + A[j]
      err <- (y_hat - y[k])^2
      err.sum <- err.sum + err
    }
    cost <- err.sum / length(x)
    cost.mtx[i,j] <- cost
  }
}

range(cost.mtx)

idx <- which(cost.mtx == min(cost.mtx), arr.ind = TRUE)
idx.Bmin <- idx[1,1]
idx.Amin <- idx[1,2]
Bmin <- B[idx.Bmin]
Amin <- A[idx.Amin]

abline(a=Amin, b=Bmin, col="red", lty=2)

plot(B, cost.mtx[,idx.Amin])

install.packages("rgl")
library(rgl)
persp3d(B, A, cost.mtx, col="green", zlim = c(0,400))
