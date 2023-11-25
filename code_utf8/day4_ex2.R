################################################
# 7. 영어 텍스트 분석하기 - tm( ) 패키지 사용하기-교재 117 페이지
################################################
#Step 1. 작업 디렉토리 지정
setwd("c:\\temp\\data")

#Step 2.필요한 패키지를 설치합니다. 
library("wordcloud")
library("tm")

#Step 3.데이터를 불러 옵니다.
data1 <- readLines("tm_test11.txt")
data1

#Step 4. Corpus (말뭉치) 형태로 변환합니다.
corp1 <- VCorpus(VectorSource(data1))
corp1                                

inspect(corp1) # corpus 안의 내용 살펴보기

# Step 5. tm 패키지가 분석 할 수 있는 Term-Document 형식의 Matrix 로 변환합니다.
tdm <- TermDocumentMatrix(corp1)
tdm

#Step 6. 일반적으로 사용되는 Matrix 로 변환합니다.
m <- as.matrix(tdm)
m

#Step 7. 불용어와 기호, 공백등을 제거합니다.
corp2 <- tm_map(corp1,stripWhitespace) # 여러 개의 공백을 하나의 공백으로 변환합니다
corp2 <- tm_map(corp2,tolower) # 대문자가 있을 경우 소문자로 변환합니다
corp2 <- tm_map(corp2,removeNumbers) # 숫자를 제거합니다
corp2 <- tm_map(corp2,removePunctuation)  # 마침표,콤마,세미콜론,콜론 등의 문자 제거
corp2 <- tm_map(corp2,PlainTextDocument)  
sword2 <- c(stopwords('en'),"and","but","not")# 기본 불용어 외 불용어로 쓸 단어 추가하기
corp2 <- tm_map(corp2,removeWords,sword2) # 불용어 제거하기 (전치사 , 관사 등)

#Step 8. 불용어나 공백 등이 제거된 후 다시 Term-Document Matrix 를 생성 후 확인합니다
tdm2 <- TermDocumentMatrix(corp2)
tdm2

m2 <- as.matrix(tdm2)
m2

colnames(m2) <- c(1:4)
m2

#Step 9. 추가로 발견된 불용어 제거하기
slist <- readLines("stopword_list.txt") # 불용어 리스트를 불러 옵니다
sword3 <- c(stopwords('en'),slist) # 기본 불용어 외 불용어로 쓸 단어 추가하기
corp2 <- tm_map(corp2,removeWords,sword3)
tdm2 <- TermDocumentMatrix(corp2)
tdm2

m2 <- as.matrix(tdm2)
colnames(m2) <- c(1:4)
m2


#Step 10. 추출된 단어를 빈도별로 집계하기
freq1 <- sort(rowSums(m2),decreasing=T)
head(freq1,20)

freq2 <- sort(colSums(m2),decreasing=T)
head(freq2,20)

findFreqTerms(tdm2,2) 
findAssocs(tdm2,"apple",0.5)
findAssocs(tdm2,"apple",0.6)

# Step 11. 집계된 내용을 워드 클라우드로 표현합니다.
library(RColorBrewer) 
windows()
palete <- brewer.pal(3,"Set1")
wordcloud(names(freq1) , 
          freq=freq1 , 
          scale=c(5,1) , 
          min.freq=1 , 
          rot.per=0.5 , 
          colors=palete , 
          random.order=F , 
          random.color=T)
