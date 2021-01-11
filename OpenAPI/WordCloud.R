#http를 통해 데이터 주고 받는 패키지
install.packages("RCurl")
install.packages("XML")
install.packages("wordcloud")
install.packages("RmecabKo")

library(RCurl)
library(XML)
library(wordcloud)
library(RmecabKo)

install_mecab("C:/Rlibs/mecab")
library(RmecabKo)

#네이버 API 사용
searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "tY2ofr7ug5SOeHvGdBoZ"
Client_Secret <- "u8DRvoycv4"


#검색 쿼리(키워드) -> url 뒤에 붙는 쿼리
query <- URLencode(iconv("인공지능", "euc-kr", "UTF-8"))
# url 
url <- paste(searchUrl, "?query=", query, "&display=20", sep="")
url
# 헤더 부분에 ID와 Secret값 넘겨주기
doc <- getURL(url, httpheader = c('Content-Type'="application/xml", 'X-Naver-Client-Id'= Client_ID, 'X-Naver-Client-Secret'= Client_Secret))

doc
#xml 형식으로 파싱
xmlFile <- xmlParse(doc)
xmlFile

#데이터 프레임 형태
df <- xmlToDataFrame(getNodeSet(xmlFile, "//item"))
str(df)
# 기사 내용 데이터 프레임
description <- df[,4]
description
# 필요 없는 내용 제거
description2 <- gsub("\\d|<b>|</b>|&quot;","", description)

#단어 추출(utf8변환)
nouns <- nouns(iconv(description2, "utf-8"))
nouns

#리스트를 벡터 형태로
nouns.all <- unlist(nouns, use.names = F)
#필요 없는 한글자 짜리 단어
nouns.all1 <- nouns.all[nchar(nouns.all) <= 1]
#두글자 이상의 단어
nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]

#2글자 이상의 단어를 테이블 형태로 저장, 빈도수 카운팅
nouns.freq <- table(nouns.all2)
nouns.df <- data.frame(nouns.freq, stringsAsFactors = F)

#빈도수 별로 분류(sorting)
nouns.df.sort <- nouns.df[order(-nouns.df$Freq), ]

#wordcloud
wordcloud(nouns.df.sort[, 1], freq = nouns.df.sort[,2], min.freq = 1,
          scale = c(3,0.7), rot.per = 0.25, random.order = F, random.color = T,
          colors = rainbow(7))
