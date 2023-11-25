#install.packages("KoNLP") 
#install.packages("wordcloud") 
#install.packages("stringr")

setwd("c:\\temp\\data")  
library(stringr)
library(KoNLP)
library(wordcloud)

useSejongDic() 

data1 <- unique(readLines("ray_all.txt", encoding="UTF-8"))
data2 <- str_replace_all(
  data1, "[^[:alpha:][:digit:][:blank:]]" , "" )
data2<- sapply(data2, function(x) {Filter(function(y) {nchar(y) <= 100 && nchar(y) >1 },x)} )
data3 <- sapply(data2, extractNoun,USE.NAMES=F)
head(data3,5)

data4 <- sapply(data3, unique) 

data5 <- lapply(data4, function(x) gsub("\\d+", "", x)) 
data5 <- lapply(data5, function(x) gsub("오른쪽", "오른쪽쏠림", x)) 
data5 <- lapply(data5, function(x) gsub("핸들", "핸들소음", x)) 
data5 <- lapply(data5, function(x) gsub("하부", "하부소음", x))
data5 <- lapply(data5, function(x) gsub("호스", "연료호스누유", x))
data5 <- lapply(data5, function(x) gsub("주유", "주유구입구녹", x))
data5 <- lapply(data5, function(x) gsub("신호대기", "신호대기시동꺼짐", x))
data5 <- lapply(data5, function(x) gsub("후진", "후진안됨", x))

data6 <- lapply(data5, function(x) 
  gsub(paste(c("센터", "서비스","오토큐","서비스센터"),collapse='|'),"서비스센터", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("도어", "슬라이딩","슬라이딩도어"),collapse='|'),"슬라이딩도어문제", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("청소", "떨림","차량떨림","유저","악셀"),collapse='|'),"울렁거림", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("스마트", "센서","스마트키"),collapse='|'),"스마트키불량", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("조수", "조수석"),collapse='|'),"조수석도어", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("바퓨", "바이퓨얼"),collapse='|'),"바이퓨얼", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("소리", "잡소리","귀뚜라미","소음","음악","출발","간헐적"),collapse='|'),"잡소리", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("오일", "엔진오일"),collapse='|'),"엔진오일", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("헤드", "가스"),collapse='|'),"헤드가스켓", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("프레스", "프레스티지"),collapse='|'),"프레스티지", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("타이밍","타이밍벨트"),collapse='|'),"타이밍벨트", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("제거","고속","시동","시동꺼짐"),collapse='|'),"시동꺼짐", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("베터리", "배터리","방전"),collapse='|'),"배터리방전", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("터보", "레이터보"),collapse='|'),"레이터보", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("벨트", "겉벨트"),collapse='|'),"겉벨트", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("유격", "브레이크"),collapse='|'),"브레이크유격", x))
data6 <- lapply(data6, function(x) 
  gsub(paste(c("습기", "라이트"),collapse='|'),"라이트습기", x))

head(data6,5)

data7 <- sapply(data6, function(x) {Filter(function(y) {nchar(y) <= 6 && nchar(y) >1 },x)} )
head(data7,4)

wordcount <- table(unlist(data7)) 
wordcount <- Filter(function(x) {nchar(x) <= 10} ,wordcount)
head(sort(wordcount, decreasing=T),100)

txt <- readLines("raygsub.txt")
txt

cnt_txt <- length(txt)
cnt_txt

for( i in 1:cnt_txt) {
  data6 <- lapply(data6, function(x) gsub((txt[i]),"", x))   
}
head(data6,4)

data7 <- sapply(data6, function(x) {Filter(function(y) { nchar(y) >=2 },x)} )

head(data7,4)

wordcount <- table(unlist(data7))
head(sort(wordcount, decreasing=T),100)

windows()
palete <- brewer.pal(3,"Set1")
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(8,0.8),
          rot.per=0.25,
          min.freq=20,
          random.order=F,
          random.color=T,
          colors=palete)


# 언급된 빈도에 따라 색깔을 다르게 설정하기
# 앞에서 살펴본 예제는 워드클라우드의 색상이 랜덤이었는데 이번에는 색상을 지정하는 방법을
# 예제로 보여드리겠습니다.
# 이 방법을 응용하면 언급 빈도에 따라 색상을 마음대로 지정할 수 있습니다.
# 그리고 빈도수를 임의로 조정하여 화면에 출력되는 순서를 조정할 수도 있습니다.
# 아래의 과정에서 파일에 저장하는 이유는 빈도수를 조정하기 위해서 입니다.

wordcount <- table(unlist(data7))
data54 <- head(sort(wordcount, decreasing=T),100)
write.table(data54,"data54.txt")

data64 <- read.table("data54.txt")
data64 

# 언급 빈도에 따라 색깔을 다르게 설정하겠습니다.
# 200번 이상 언급된 키워드는 빨간색으로 표시하고 나머지는 회색으로 표시하여 강조하겠습니다.
# 이 예제에서는 색상이 2가지로 해서 ifelse 문을 사용했지만
# 만약 색상을 3가지 이상으로 하고 싶을 경우는 if ~ else if 문을 사용하시면 됩니다.

col4 <- ifelse(data64$Freq >= 150, "red", "gray")
wordcloud(data64$Var1 , freq=data64$Freq , scale=c(4,1) , rot.per=0.25 , min.freq=1 ,
          random.order=F , ordered.color=T , colors=col4)

####################################################
# 주요 키워드들을 그래프로 표현하기
####################################################
dev.new()
final <- head(sort(wordcount, decreasing=T),15)
bp <- barplot(final,main = "Ray 고객 불만 TOP 15 - 건별 출력", 
              col = rainbow(10), cex.names=0.7, las = 2,ylim=c(0,500))
text(x = bp, y = final*1.05, labels = paste(final,"건"), col = "black", cex = 0.7)

dev.new( )
bp <- barplot(final,  main = "Ray 고객 불만 TOP 15 - 비율별 출력", 
              col = rainbow(10), cex.names=0.7,  las = 2 , ylim=c(0,500))
pct <- round(final/sum(final) * 100 ,1)
text(x = bp, y = final*1.05, labels = paste(pct,"%"), col = "black", cex = 0.7)




####################################################
################ 연관 단어 분석하기
####################################################

install.packages("arules")
install.packages("igraph")

library(arules)
library(igraph)


tran4 <- sapply(data7, unique) 
head(tran4,10)
length(tran4)
wordtran <- as(tran4, "transactions")
wordtran

#co-occurance table 
wordtab <- crossTable(wordtran)
#wordtab

ares <- apriori(wordtran, parameter=list(supp=0.001, conf=0.001))

inspect(ares)

rule1 <- labels(ares, ruleSep=" ") 
rule1
rule2 <- sapply(rule1, strsplit, " ",  USE.NAMES=F) 
rule2


rulematrix <- do.call("rbind", rule2)
rulematrix

#edgelist <- graph.adjacency(wordtab,weighted=T,mode="undirected")
#edgelist

#degree(edgelist)

edge1 <- graph.edgelist(rulematrix[-c(1:93), ])
edge1

dev.new( )
plot.igraph(edge1, vertex.label=V(edge1)$name, vertex.label.cex=0.8, vertex.size=20,vertex.color="cyan")
edge2 <- simplify(edge1)
edge2
plot.igraph(edge2, vertex.label=V(edge1)$name, vertex.label.cex=0.8, vertex.size=20,vertex.color="cyan",vertex.label.color="red")



# edge 빈도별 버블 크기과 글씨 크기 다르게 하기
dev.new()
edge4 <- simplify(edge1)
V(edge4)$size <- 3*degree(edge4)
V(edge4)$size
V(edge4)$color <- "red"
plot(edge4)

dev.new()
V(edge4)$degree <- degree(edge2)
V(edge4)$degree
V(edge4)$color <- ifelse(V(edge4)$degree >= 6,"red","green")
V(edge4)$label.color <- ifelse(V(edge4)$degree >= 6,"blue","red")
plot(edge4)


