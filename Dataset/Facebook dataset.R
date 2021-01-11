install.packages("igraph")
library(igraph)

df.fb <- read.table(file.choose(), header = F)
head(df.fb)
tail(df.fb)

G.fb <- graph.data.frame(df.fb, directed = FALSE)
par(mar = c(0,0,0,0))
plot(G.fb, vertex.label = NA, vertex.size = 10)
dev.off()

# 1~50번쨰 사용자들
V(G.fb)$name
v.set <- V(G.fb)$name[1:50]
G.fb.part <- induced.subgraph(G.fb, v = v.set)
tkplot(G.fb.part)

# ID==1 연결된 그래프
v2 <- which(V(G.fb)$name == "1")
v.set <- neighbors(G.fb, v = v2)

v3 <- c(v2, v.set)
G.fb.id <- induced.subgraph(G.fb, v = v3)
V(G.fb.id)$color <- ifelse(V(G.fb.id)$name == "1", "red", "yellow")
tkplot(G.fb.id, vertex.size = degree(G.fb.id)*1.5)


# 연결정도가 가장 큰 사용자
v.max <- V(G.fb)$name[degree(G.fb) == max(degree(G.fb))]
degree(G.fb, v.max)

v.max.idx <- which(V(G.fb)$name == v.max)
v.set <- neighbors(G.fb, v = v.max.idx)
v3 <- c(v.max.idx, v.set)
G.fb.max <- induced.subgraph(G.fb, v3)
V(G.fb.max)$color <- ifelse(V(G.fb.max)$name == v.max, "red", "yellow")
V(G.fb.max)$label <- ifelse(V(G.fb.max)$name == v.max, v.max, NA)
V(G.fb.max)$size <- ifelse(V(G.fb.max)$name == v.max, 30, 5)
plot(G.fb.max)

# 연결정도, 근접, 중개 중심성과 중심화 지표
degree(G.fb, normalized = FALSE)
closeness(G.fb, normalized = FALSE)

# 밀도
graph.density(G.fb.max)

# 거리
shortest.paths(G.fb)[100:110, 100:110]
distances(G.fb, v = "3003", to = "7")
average.path.length(G.fb)

# 연결정도 분포
plot(degree(G.fb), type = 'h')

x <- degree(G.fb, normalized = F)
summary(x)

hist(x, breaks = seq(0, max(x), by = 1))

G.fb.dist <- degree.distribution(G.fb)
plot(G.fb.dist, type = 'h')
