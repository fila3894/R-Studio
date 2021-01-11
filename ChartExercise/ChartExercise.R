rivers
stem(rivers)
stem(rivers, scale = 2)

#pie
city<-c("서울","부산","대구","인천")
pm25<-c(18,22,21,30)
colors<-c("red","orange","yellow","green")
pie(pm25, labels = city, col = colors, main = "지역별 미세먼지")
pie(pm25, labels = city, col = colors, main = "지역별 미세먼지",
    init.angle=90, clockwise=T)

install.packages("RColorBrewer")
library(RColorBrewer)

green <- brewer.pal(4, 'Greens')
pct<- round(pm25/sum(pm25)*100,0)
city_label <- paste(city, ", ", pct, "%", sep = "")
pie(pm25, labels = city_label, col = green, main="지역별미세먼지",
    init.angle=90, clockwise=T)

