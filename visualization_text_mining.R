# 특정 키워드만 골라내서 분석
'''
setwd ('c:/temp/data')
setwd ('c://temp//data')
setwd ('c:\\temp\\data')
역슬레쉬 한개는 안됨'''

setwd('~/repository/learningR/data/')
library(wordcloud)

tmp1 = readLines('oracle_alert_testdb.log')
tmp2 = grep('^ORA-', tmp1, value = TRUE)
# ORA-로 시작하는 것만 고름

tmp3 = substr(tmp2, 1, 9)
tmp4 = table(tmp3)
sort(tmp4[1:20], decreasing = TRUE)

# 시각화 하기
palete = brewer.pal(7,"Set1") # 컬러 7개 씀
wordcloud(names(tmp4),
          freq=tmp4,
          scale=c(1.6, 0.8), # 크기
          rot.per=0.5, # 가로글씨, 세로글씨 비율 (회전 가능)
          min.freq=1,
          random.order=F, # F : 랜덤 x
          random.color=T, # 랜덤한 컬러
          colors=palete,
          family="AppleGothic")