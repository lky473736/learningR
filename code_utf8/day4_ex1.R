# 제주도 여행지 키워드 분석
library(KoNLP)
library(wordcloud)
library(stringr)
library(wordcloud2) # install.packages('wordcloud2')

# Java 기반 한나눔분석기 -> KoNLP 만듦 (그래서 자바를 설치한거임)

# 사전 작업하기
setwd('~/repository/learningR/data/')
useSejongDic()
mergeUserDic(
  data.frame(readLines('제주도여행지_utf8.txt'), 'ncn')) # 단어들의 품사를 명사로 바꿔줌

# 파일 불러와서 명사 추출하기(집계 포함)
txt1 = unique(readLines('jeju_utf8.txt')) # 중복 줄 제거
txt2 = unlist(extractNoun(txt1)) # 명사 뽑고 벡터로 바꿈

txt3 = str_replace_all(txt2,"[^[:alpha:][:blank:]]","") # 각 줄마다 특수기호 제거
txt3 = gsub('랜드', '', txt3) # 랜드라는 단어 제거
txt3 = gsub('이곳', '', txt3) # 이곳이라는 단어 제거 
txt3 = gsub('에코', '에코랜드', txt3) # 에코 -> 에코랜드
txt3 = gsub(paste(c("성산","일출"),collapse='|'), "성산일출봉", txt3) # 성산과 일출을 성산일출봉으로 만들어줌
txt3 = gsub(paste(c("산방","산방산"),collapse='|'), "산방산", txt3) # 산방과 산방산을 산방산으로 만들어줌

# 불용어 파일로 정리하기 (제거대상, 불필요한 단어를 저장한 사전)
r_txt = readLines("제주도여행코스gsub_utf8.txt")
cnt_txt = length(r_txt)

for(i in 1:cnt_txt) {txt3 = gsub((r_txt[i]),"",txt3)}

place = Filter(function(x){
  nchar(x) >= 2 &nchar(x) <= 6}, txt3) # 글자갯수가 2~6개인 단어만 모음

wordcount = table(place)
#head(sort(wordcount, decreasing=T),30)

# 시각화 하기
palete = brewer.pal(7,"Set1") # 컬러 7개 씀
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(2, 0.5), # 크기
          rot.per=0.25, # 가로글씨, 세로글씨 비율 (회전 가능)
          min.freq=3,
          random.order=F, # F : 랜덤 x
          random.color=T, # 랜덤한 컬러
          colors=palete,
          family="AppleGothic")


# 시각화 하기(워드클라우드2)
wordcount4 = head(sort(wordcount, decreasing=T),100)
wordcloud2(wordcount4,
           gridSize=1,
           size=0.5,
           shape="circle")