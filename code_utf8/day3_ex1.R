# R을 활용한 한글/영어 텍스트 분석

# 텍스트마이닝 : 문장 -> 단어 -> 키워드 -> 필터링 -> 집계 -> 시각화
# 단어 -> 키워드 : extractNoun()
# 필터링 : gsub(), stringr()
# 집계 : table()
# 시각화 : wordcloud, histogram

# 정규식 기호 : //로 시작하는 것, 특정 기호
# 1) \\d, [0-9], [:digit:] : 숫자가 들어간거 추출
# 2) (중요) ^ (캐럿) : ~으로 시작하는 것

# 캐럿의 용도 
# ^[ab] : a or b로 시작하는 것
# [^ab] : a or b를 제외하는 것
# ^[^ab] : a or b를 제외한 것으로 시작하는 것
# ^[^0-9] : 0-9를 제외한 것으로 시작 (문자로 시작)

# 정규식의 이해
g_ex = c('apple', 'map365', '153pen',
         '789', '사과')
g_ex

# grep('정규식', 데이터, 옵션)
# 옵션에 value = T 꼭 해줘야 함

# '^'(캐럿 기호의 활용) : ~으로 시작하는것
grep('^[0-9]', g_ex, value = T) # 숫자로 시작하는 것
grep('[^0-9]', g_ex, value = T) # 숫자를 제외한 것 (789만 제외)
grep('^[^0-9]', g_ex, value = T) # 문자로 시작하는 것

# 숫자 관련 정규식
grep('[0-9]', g_ex, value = T) # 숫자가 들어간 것
grep('\\d', g_ex, value = T) # 숫자가 들어간 것
grep('[[:digit:]]', g_ex, value = T) # 숫자가 들어간 것

# 문자 관련 정규 표현식 
grep('[A-z가-힣]', g_ex, value = T) # 영문 or 한글이 들어간 것
grep('\\D', g_ex, value = T) # 문자가 들어간거 출력
grep('[[:alpha:]]', g_ex, value = T) # 문자가 들어간거 출력
grep('[[:lower:]가-힣]', g_ex, value = T) # 영문 소문자 or 한글이 들어간 것

# [:alpha:] 정규식의 이해 (알파벳을 추출하기 위해)
grep('[:alpha:]', g_ex, value = T) # 숫자 날라감, 한글 날라감
grep('[[:alpha:]]', g_ex, value = T) # 숫자 날라감
grep('^[[:alpha:]]', g_ex, value = T) # 문자로 시작하는 것
grep('[^[:alpha:]]', g_ex, value = T) # apple과 사과 제외

# substr() : 특정 위치 값을 잘라냄
substr('820715', 3, 4) # : 3에서 4까지 잘라냄
# == 07

# strsplit() : 특정 기호로 분리
strsplit('031)123-3456', ')')

# 패키지 설치 install.packages(~~)

# str_replace_all : 문자열 내 모든 인수를 어떤 인수로 바꿈
library(stringr)
txt = '안녕안녕하세요'
print(str_replace_all(txt, '안녕', '감자')) # 모든 안녕 -> 감자로 바꿈
