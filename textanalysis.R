# 한글 텍스트 분석 실습

# 작업 폴더 설정 및 데이터 불러오기
setwd('~/repository/learningR/data/')
ex1 = readLines('좋아하는과일2_utf8.txt')

# 단어 추출
ex2 = KoNLP::extractNoun(ex1)
ex2

# 중복 데이터 제거
ex3 = unique(ex2) # 중복 줄 제거
ex4 = lapply(ex3, unique) # 한 줄 안에서 중복된 단어 없애줌

# 필요 없는 데이터 제거
ex5 = gsub('최고', '', unlist(ex4)) # 최고라는 단어를 찾아서 ''로 바꿈
ex5 = gsub('복숭아', '청포도', unlist(ex4)) 
ex5

# 단어 수로 정리
ex6 = Filter(function(x) {
  nchar(x) <= 6 & nchar(x) > 1}, ex5) # x의 length가 1보다 크고 6 이하면

# 특수기호 제거
ex7 = stringr::str_replace_all(ex6, '[^[[:alpha:][:blank:]]]', '')
# 모든 문자와 공백을 제외한 것 

# 단어 집계
ex8 = sort(table(ex7), decreasing = TRUE)
ex8