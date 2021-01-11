install.packages("magick")
library(magick)

#공, 테이블 이미지 읽기
ball<-image_read("ball.png")
table<-image_read("table.png")

#이미지 사이즈 조정
ball<-image_scale(ball, "40x40!")
table<-image_scale(table, "300x400!")

#당구공 좌표
x <- 0
y <- 0
while(TRUE){
  pos <- paste("+",x,"+",y,sep="")
  img_c <- image_composite(table, ball, offset = pos)
  print(img_c)
  Sys.sleep(0.1)
  #x,y좌표 위치 변환 시작
  if(x == 0 && y == 0){
    while(x != 260){
      x <- x + 10
      y <- y + 10
      pos <- paste("+",x,"+",y,sep="")
      img_c <- image_composite(table, ball, offset = pos)
      print(img_c)
      Sys.sleep(0.1)
    }
  }
  if(x == 260 && y == 260){
    while(y != 360){
      x <- x - 10
      y <- y + 10
      pos <- paste("+",x,"+",y,sep="")
      img_c <- image_composite(table, ball, offset = pos)
      print(img_c)
      Sys.sleep(0.1)
    }
  }
  if(x == 160 && y == 360){
    while(x != 0){
      x <- x - 10
      y <- y - 10
      pos <- paste("+",x,"+",y,sep="")
      img_c <- image_composite(table, ball, offset = pos)
      print(img_c)
      Sys.sleep(0.1)
    }
  }
  if(x == 0 && y == 200){
    while(y != 0){
      x <- x + 10
      y <- y - 10
      pos <- paste("+",x,"+",y,sep="")
      img_c <- image_composite(table, ball, offset = pos)
      print(img_c)
      Sys.sleep(0.1)
    }
  }
  #위치 변환 종료
  print("애니메이션 종료")
  break;
}



