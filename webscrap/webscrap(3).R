library(rvest)

#url 설정(페이지)
url.page <- "https://movie.naver.com/movie/point/af/list.nhn?&page="

#시작, 끝 페이지
page.start <- 1
page.end <- 5

#페이지별 리뷰 통합
review.page <- NULL #초기화(이곳에 리뷰 다 넣음)

#시작페이지 ~ 끝 페이지 반복
for(p in page.start:page.end) {
  
  #페이지 url 설정
  url <- paste(url.page, p, sep="") #끝 문자열에 p(1~5)를 붙여준다
  html <- read_html(url)
 
  #리뷰 셀 추출
  review_cell <- html_nodes(html, "#old_content table tr .title")
  
  #평점 추출
  score <- html_nodes(review_cell, "em") %>% html_text()
  
  #리뷰 추출
  review <- review_cell %>% html_text()
  
  #리뷰 정제 
  index.start <- regexpr("\t별점 -", review) #시작점
  index.end <- regexpr("\t신고", review) #끝나는곳
  
  #정제된 곳 기준으로 추출
  review <- substring(review, index.start, index.end)
  
  #리뷰 부분만 잘라내기
  review <- substring(review, 16)
  
  #텍스트 대체(재어문자 제거)
  review <- gsub("|\n|\t","",review)
  
  #앞 뒤로 자르기
  review <- trimws(review, "both")

  review.page <- c(review.page, review)
}

#통합된 리뷰 출력
review.page 
