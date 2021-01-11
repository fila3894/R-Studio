install.packages("XML")
install.packages("ggplot2")
library(XML)
library(ggplot2)


api <- "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureLIst"
api_key <- "WyA2z%2FcRFPYV3EI3i4Ycp7%2FlQUEB6M%2Frrrr1M8DJYeBOJ3hGLViiTT5MlQQlM5ixJg8ajQ6yVVXnfIkOyn4wYw%3D%3D"

numOfRow <- 10
pageNo <- 1
itemCode <- "PM10"
dataGubun <- "HOUR"
searchCondition <- "MONTH"

url <- paste(api, "?serviceKey=", api_key, 
             "&numOfRows=", numOfRow, 
             "&PageNo=", pageNo,
             "&itemCode=", itemCode,
             "&dataGubun=", dataGubun,
             "&searchCondition", searchCondition,
             sep="")

url
xmlFile <- xmlParse(url)
xmlFile
xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//items//item"))
df

ggplot(data=df, aes(x=dataTime, y=seoul, fill=dataTime)) + geom_bar(stat="identity") +
theme(axis.text.x = element_text(angle = 90), legend.position = "None") + labs(title = "서울시 시간대별 PM10 변화", x="측정일시",y="농도") +
scale_fill_manual(values = rainbow(10)) + coord_flip()

df
pm <- df[1, 4:20]
pm
