install.packages("neuralnet")
library(neuralnet)

iris
data <- iris

maxs <- apply(data[, 1:4], 2, max)
mins <- apply(data[, 1:4], 2, min)
data[, 1:4] <- scale(data[, 1:4], center = mins, scale = maxs - mins)

# 출력 데이터 생성
data$setosa <- ifelse(data$Species == 'setosa', 1, 0)
data$virginica <- ifelse(data$Species == 'virginica', 1, 0)
data$versicolor <- ifelse(data$Species == 'versicolor', 1, 0)

# 데이터 분리
n <- nrow(data)
set.seed(1234)
index <- sample(1:n, round(n * 0.8))

train <- as.data.frame(data[index,])
test <- as.data.frame(data[-index,])

# 학습용 입출력 데이터
f.var.independent <- "Sepal.Length + Sepal.Width + Petal.Length + Petal.Width"
f.var.dependent <- "setosa + versicolor + virginica"
f <- paste(f.var.dependent, "~", f.var.independent)

nn <- neuralnet(f, data = train, hidden = c(6,6), linear.output = F)
plot(nn)

# 계산
predicted <- compute(nn, test[, -5:-8])
predicted$net.result

# 가장 큰 값 찾기
idx <- max.col(predicted$net.result)
species <- c("setosa", "versicolor",  "virginica")
predicted <- species[idx]

table(test$Species, predicted)
