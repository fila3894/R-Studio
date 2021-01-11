install.packages("igraph")
library(igraph)

# 3. 파일 읽기
df.fb <- read.table(file.choose(), header = F)
head(df.fb)
tail(df.fb)

# 그래프
G.fb <- graph.data.frame(df.fb, directed = FALSE)
par(mar = c(0,0,0,0))
plot(G.fb, vertex.label = NA, vertex.size = 10)
dev.off()


# 4. 중심화 분석
# 연결 정도
degree(G.fb, normalized = FALSE)
degree(G.fb, normalized = TRUE)
CD <- centralization.degree(G.fb, normalized = FALSE)
Tmax <- centralization.degree.tmax(G.fb)

# 근접
closeness(G.fb, normalized = FALSE)

# 중계
betweenness(G.fb)

# 5~6. 연결정도 분포 차트 출력(+레이블 표시)
plot(degree(G.fb), type = 'h', xlab = "물품구매수", ylab = "빈도수", main = "Amazon product co-purchasing network")

# 7. 연결정도가 가장 큰 노드 추출(10개)
v.max <- V(G.fb)$name[degree(G.fb) == max(degree(G.fb))]
degree(G.fb, v.max)
v.max.idx <- which(V(G.fb)$name == v.max)
v.set <- neighbors(G.fb, v = v.max.idx)
v3 <- c(v.max.idx, v.set[1:10])
G.fb.max <- induced.subgraph(G.fb, v3)

# 8. 그래프 그리기(+색, 레이블 없음)
V(G.fb.max)$color <- ifelse(V(G.fb.max)$name == v.max, "red", "green")
V(G.fb.max)$label <- ifelse(V(G.fb.max)$name == v.max, v.max, NA)

# 9. 노드 사이즈
V(G.fb.max)$size <- ifelse(V(G.fb.max)$name == v.max, 20, 15)
plot(G.fb.max)

