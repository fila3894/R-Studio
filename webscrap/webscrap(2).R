install.packages('rvest')
library(rvest)

#url 설정(페이지)
url.page <- "https://movie.naver.com/movie/point/af/list.nhn?&page="

#시작, 끝 페이지
page.start <- 1
page.end <- 5

#페이지별 평점 통합
score.page <- NULL

#시작페이지 ~ 끝 페이지 반복
for(p in page.start:page.end) {
  #페이지 url 설정
  url <- paste(url.page, p, sep="") #끝 문자열에 p(1~5)를 붙여준다
  html <- read_html(url)
  
  #리뷰 셀 추출
  review_cell <- html_nodes(html, "#old_content table tr .title")
  
  #평점 추출
  score <- html_nodes(review_cell, "em") %>% html_text()
  score
  #페이지별(1~5) 평점
  score.page <- c(score.page, score)
}
score.page
#숫자형으로 변환
i_score <- as.numeric(score.page)

#막대그래프로 표현
barplot(table(i_score), main = "네이버 영화 평점별 빈도 수", ylim = c(0,length(i_score)),
        col = c(rainbow(10)), xlab = "평점", ylab = "빈도 수", cex.names = 1.5)
