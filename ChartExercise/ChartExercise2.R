dept <- c("영업1팀","영업2팀","영업3팀","영업4팀")
sales01 <- c(4, 12, 5, 8)

bp<-barplot(sales01, names.arg = dept, main = "부서별 영업 실적(1분기)",
        col = rainbow(length(dept)), xlab = "부서", ylab = "실적",
        ylim = c(0, 15))
text(x=bp, y=sales01, labels = sales01, pos = 3)

bp<-barplot(sales01, names.arg = dept, main = "부서별 영업 실적
            (1분기)",col = rainbow(length(dept)), xlab = "부서", 
            ylab = "실적", xlim = c(0, 15), horiz = TRUE)
sales02 <- c(12, 8, 10, 4)
sales<-rbind(sales01,sales02)
sales
legend_label <- c("1분기", "2분기")
barplot(sales, names.arg = dept, main ="부서별 영업 실적(1-2분)"
        ,col = c("green","orange"), xlab = "부서", ylab = 
        "실적", ylim = c(0, 15), legend.text = legend_label, 
        beside = TRUE)
