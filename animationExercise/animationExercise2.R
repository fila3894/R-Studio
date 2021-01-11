install.packages("imager")
library(imager)

img_path <- "roulette.png"
img <- load.image(img_path)
plot(img)

#이미지 크기변환
img <- resize(img, size_x = 400L, size_y = 400L)
plot(img, xlim = c(0, 400), ylim = c(0, 400))

plot(img, xlim = c(0, 400), ylim = c(0, 400), axes = FALSE)

#룰렛 회전
rot.count <- sample(11:20, 1)
rot.count

angle <- 0
for (i in 1:rot.count) {
  angle <- angle + 36
  title <- paste("룰렛회전: ", i, "/", rot.count)
  #이미지돌리기
  imrotate(img,
           angle,
           cx=200, cy=200) %>% #결과를 이어보냄
    draw_circle(x=200, y=30,
                radius = 30,
                col=c(1,0,0,0), opacity = 0.5) %>%
    plot(axes=FALSE, main=title)
  
  Sys.sleep(0.2)
}

