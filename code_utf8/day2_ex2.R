# 단순조건분기문
# if~else문
x = 5
if (x > 5) {print(1)} else {print(0)}

if_myf1 = function(x) {if (x > 5) {print(1)} else {print(0)}}
if_myf1(6)

menu = '짬뽕'
if (menu == '짜장면') {
  cat(menu, '맛있어요')} else {
  cat(menu, '싫어요\n')} 

# 다중조건 분기문
food = function(x) {
  if (x == '감자') {print('좋아요')}
  else if (x == '당근') {print('싫어요')}
  else if (x == '오이') {print('최고')}
  else {print('다시 입력')}
}

food('오이')
food('감자')
food('토마토')

# 조건반복문의 이해
w_ex1 = function(x) {
  no = 1
  while (x >= no) {
    cat('숫자는:', no, '\n')
    no = no+1}}

w_ex2 = function(x) {
  hap = 0
  no = 1
  while (x >= no) {
    hap = hap+no
    no = no+1}
  print(hap)}

w_ex1(4)
w_ex2(10)


# 순차대입반복문의 이해
# for 반복문의 이해
for_ex1 = 
  function(x) {for (i in 1:x){print(i)}}
for_ex1(3)

# w_ex2 코드의 다른 표현(1~x 값 까지 누적합)
myf_ex1 = function(x) {(1+x) * (x/2)}
myf_ex1(100)

# 정형데이터 핸들링
#install.packages('dplyr')
library(dplyr)
setwd('c:/temp/data')

d_ex1 = 
  read.table('2017_프로야구.txt', head=T)
d_ex1

filter(d_ex1, 타율 > 0.35)
head(select(d_ex1, 선수명, 팀명), 10)

# 파이프라인 연산자의 이해
d_ex1 %>% 
  select(선수명, 팀명, 홈런) %>%
  filter(홈런 > 20 ) %>%
  arrange(desc(홈런)) %>%
  slice(1:5)

d_ex1 %>% 
  group_by(팀명) %>% 
  summarise(팀별평균타수 
            = mean(타수, na.rm=TRUE))















