library(KoNLP)
setwd('~/repository/learningR/data/')

# 데이터 불러오기
# txt_ex1 = readLines('좋아하는과일_utf8.txt')
txt_ex1 = readLines('토론 1.txt')
txt_ex1

# 사전 활용하기 (명확하게 명사를 추출하기 위해서)
# use세종dic() = 기본사전 + 세종사전이 빌트됨
useSejongDic()

# 특수기호, 띄어쓰기 조심
# 명사 추출
txt_ex2 = KoNLP::extractNoun(txt_ex1)
txt_ex2

# 리스트를 벡터로 전환
sort(table(unlist(txt_ex2)), decreasing = TRUE)