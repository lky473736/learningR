# 제주도 여행지 키워드 분석
library(KoNLP)
library(wordcloud)
library(stringr)
library(wordcloud2) # install.packages('wordcloud2')

# 사전 작업하기
setwd('c:/temp/data/')
useSejongDic()
mergeUserDic(
  data.frame(readLines('제주도여행지.txt'), 'ncn'))

# 파일 불러와서 명사 추출하기(집계 포함)
txt1 = unique(readLines('jeju.txt'))
txt2 = unlist(extractNoun(txt1))

txt3 = str_replace_all(
  txt2,"[^[:alpha:][:blank:]]","")
txt3 = gsub('랜드', '', txt3)
txt3 = gsub('이곳', '', txt3)
txt3 = gsub('에코', '에코랜드', txt3)
txt3 = gsub(paste(c("성산","일출"),collapse='|'), "성산일출봉", txt3)
txt3 = gsub(paste(c("산방","산방산"),collapse='|'), "산방산", txt3)

# 불용어 파일로 정리하기
r_txt = readLines("제주도여행코스gsub.txt")
cnt_txt = length(r_txt)

for(i in 1:cnt_txt) {txt3 = gsub((r_txt[i]),"",txt3)}

place = Filter(function(x){
  nchar(x) >= 2 &nchar(x) <= 6}, txt3)place

wordcount = table(place)
#head(sort(wordcount, decreasing=T),30)

# 시각화 하기
palete = brewer.pal(7,"Set1")
windows()
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(5,1),
          rot.per=0.25,
          min.freq=4,
          random.order=F,
          random.color=T,
          colors=palete)


# 시각화 하기(워드클라우드2)
wordcount4 = head(sort(wordcount, decreasing=T),100)
wordcloud2(wordcount4,
           gridSize=1,
           size=0.5,
           shape="circle")


