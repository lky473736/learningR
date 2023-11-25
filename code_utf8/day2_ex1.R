# 벡터 유형의 이해
vec_ex1 = c(1,2,3)
vec_ex2 = c(4,5,6)
vec_ex3 = c('감', '밤', '콩', '잣')

# 벡터여부 확인하기 
is.vector(vec_ex1)

# 벡터 데이터 조회하기
vec_ex3[1]
vec_ex3[c(1,3)]
vec_ex3[1:3]
vec_ex3[-3]

# 벡터 연산하기
vec_ex1 + vec_ex2
vec_ex1[1] + vec_ex2[1]

# 벡터 데이터 합치기
union(vec_ex1, vec_ex2)[6]

# matrix 의 이해
mat_ex1 = matrix(c(3,4,2,4), nrow=2)
mat_ex1

mat_ex2 = matrix(c(1:20),nrow = 4)
mat_ex2

mat_ex2[1,1] + mat_ex2[1,2]
mat_ex2[c(1,3), c(2,3)]

# 배열(array) 이해하기
ary_ex1 = array(c(1:16), dim =c(2,2,4))
ary_ex1

a = ary_ex1[1,2,1]
b = ary_ex1[1,2,2]
c = ary_ex1[1,2,3]
d = ary_ex1[1,2,4]

sum(a,b,c,d)

# 리스트 유형 이해하기
lst_ex1 = list(
  c('감자', '당근', '호박'),
  c('당근', '가지', '포도'),
  c('감자', '대파', '수박')
)

lst_ex1[2]
is.list(lst_ex1)

sort(table(unlist(lst_ex1)), 
     decreasing = T)

# 비정형 데이터 불러오기
# 작업디렉토리 설정
setwd('c:/temp/data')
getwd()

# 파일 목록 확인하기
list.files()

# 비정형 텍스트 파일 불러오기
txt_ex1 = readLines('구매후기.txt')
txt_ex1

library(KoNLP)
sort(
  table(
    unlist(
      KoNLP::extractNoun(txt_ex1)
    )
  ), decreasing = T
)

# 사용자 정의 함수의 이해
myf_ex1 = 
  function(x) {return(x^3)}
myf_ex2 = 
  function(x,y) {return(x*y)}

# 사용자 정의 함수의 호출
myf_ex1(3)
myf_ex2(3,9)



