# 패키지 설치
install.packages("rvest")
library(rvest)


#웹문서(페이지) 읽기
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html


title <- html_nodes(html, "#apiDataList .title") %>% html_text()
title

desc <- html_nodes(html, "#apiDataList .ellipsis") %>% html_text()
desc

title <- gsub("[|\r|\t|\n]","", title) #없애고 싶은 문자 대체
title

api <- data.frame(title, desc)
api
