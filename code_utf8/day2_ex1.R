# vector -> matrix -> array
# (1, 2, 3, 4) : vector (1차원 array)
# | 1, 3 | 
# | 2, 4 | : matrix (2차원 matrix, Z방식으로 씀)
# matrix의 결합 : array (3차원 matrix)

# sequence type : 나열된 데이터들의 집합, 자료형이 동일하지 않아도 됨 
# array type : 자료형이 반드시 전부 동일해야 함
# ex) (1, 'a', 3) == sequence type / (1, 2, 3) == array type

vec_ex1 = c(1,2,3) # c(~) : 벡터 정의 (concatanate, connection)
vec_ex2 = c(4,5,6) 
vec_ex3 = c('ㄱ', 'ㄴ', 'ㄷ')

# 벡터인가 아닌가? (True, False return)
is.vector(vec_ex1)

# 벡터 인덱싱 (R언어는 1부터 인덱싱)
vec_ex3[1]
vec_ex3[c(1,3)] # c(m, n) : 1번 인덱스의 compo랑 3번 인덱스의 compo만 출력
vec_ex3[1:3] # [m, n] : m에서 n까지의 component
vec_ex3[-3] # 거꾸로

# 벡터 연산
vec_ex1 + vec_ex2 
vec_ex1[1] + vec_ex2[1] 

# NA (Not Available)

# 벡터 concatanate
union(vec_ex1, vec_ex2) # vec1 + vec2 == vec1, vec2

# matrix 구현
mat_ex1 = matrix(c(3,4,2,4), nrow = 2) # 1차원 벡터를 2개의 row matrix로 변환
mat_ex1

mat_ex2 = matrix(c(1:20), nrow = 4) # 1~20까지 숫자를 4개 row matrix로 변환
mat_ex2 # component의 갯수 % nrow == 0이 되어야 함

mat_ex3 = matrix(c(1:100), nrow = 5)
mat_ex3

mat_ex2[1,1] + mat_ex2[1,2] # 1 + 5
mat_ex2[c(1,3), c(2,3)] # 겹치는 부분. row1, row3, column2, column3 수평선이 서로 겹치는 4개의 component 출력

ary_ex1 = array(c(1:8), dim =c(2,1,4)) # dim = c(r, c, l) : row갯수, column갯수, layer갯수대로 array 만들기
ary_ex1

a = ary_ex1[1,1,1] # row, column, layer
b = ary_ex1[1,1,2]
c = ary_ex1[1,1,3]
d = ary_ex1[1,1,4]

a
b
c
d

sum(a,b,c,d)

# 리스트 만들기 (서로 다른 데이터 유형도 한 세트로 저장 가능

lst_ex1 = list(
  c('a', 'b', 'c'),
  c('d', 'e', 'f'),
  c('g', 'h', 'i')
)

lst_ex1
lst_ex1[2] # 리스트 안에 2번째 벡터
is.list(lst_ex1) # 리스트인가?
is.vector(lst_ex1) # 리스트도 벡터임

sort(table(unlist(lst_ex1)), decreasing = T)

# lst_ex1을 벡터로 만듦 (unlist로)
# -> table로 정렬
# -> decreasing으로 값들을 내림차순

unlist (lst_ex1)
table(unlist (lst_ex1))


#################


# ??? ???
# ?????? ??
setwd('c:/temp/data')
getwd()

# ?????? ?????? ????????????
list.files()

# ????????? ????????? ?????? ????????????
txt_ex1 = readLines('????????????.txt')
txt_ex1

library(KoNLP)
sort(
  table(
    unlist(
      KoNLP::extractNoun(txt_ex1)
    )
  ), decreasing = T
)

# ????????? ?????? ????????? ??????
myf_ex1 = 
  function(x) {return(x^3)}
myf_ex2 = 
  function(x,y) {return(x*y)}

# ????????? ?????? ????????? ??????
myf_ex1(3)
myf_ex2(3,9)



