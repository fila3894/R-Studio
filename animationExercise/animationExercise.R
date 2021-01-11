# Countdown
install.packages("animation")
library(animation)

ani.options(interval = 1)

while(TRUE) {
  y <- runif(5, 0, 1) #균등 분포에서 표본추출
  
  barplot(y, ylim = c(0,1), col=rainbow(5))
  
  ani.pause()
}
# HTML에 띄우기
'''
plot.new()

for (i in 10:0) {
  rect(0, 0, 1, 1, col="yellow")
  
  text_size = 11 - i
  text(0.5, 0.5, i, cex=text_size, col=rgb(0,0,1,1))
  
  ani.pause()
}

saveHTML({
  for (i in 1:20) {
    plot(runif(20), ylim = c(0,1))
    ani.pause()
  }
}, img.name = "unif_plot", imgdir = "unif_dir", htmlfile = "random.html",
autobrower = FALSE, title = "Demo of 20 uniform random numbers")
'''

