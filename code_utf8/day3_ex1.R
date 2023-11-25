# 정규식의 이해
g_ex = c('apple', 'map365', '153pen',
         '789', '사과')
g_ex

# grep('정규식', 데이터, 옵션)
# '^'(캐럿 기호의 활용) : ~으로 시작하는것
grep('^[0-9]', g_ex, value = T)
grep('[^0-9]', g_ex, value = T)
grep('^[^0-9]', g_ex, value = T)

# 숫자 관련 정규식
grep('[0-9]', g_ex, value = T)
grep('\\d', g_ex, value = T)
grep('[[:digit:]]', g_ex, value = T)

# 문자 관련 정규 표현식
grep('[A-z가-힣]', g_ex, value = T)
grep('\\D', g_ex, value = T)
grep('[[:alpha:]]', g_ex, value = T)
grep('[[:lower:]가-힣]', g_ex, value = T)

# [:alpha:] 정규식의 이해
grep('[:alpha:]', g_ex, value = T)
grep('[[:alpha:]]', g_ex, value = T)
grep('^[[:alpha:]]', g_ex, value = T)
grep('[^[:alpha:]]', g_ex, value = T)

# ggplot2 패키지 활용하기
install.packages("ggplot2")
library('ggplot2')

# 작업디렉토리 설정
setwd('c:/temp/data')
getwd()
list.files()[79]

# 파일 읽어오기
data_ex1 = 
  read.csv('사원별판매현황_홍길동.csv')
data_ex1

# 그래프 종류 확인하기
apropos('^geom*_')
# 선 그래프 그리기
# windows()
gg1 = ggplot(data_ex1, aes(
  x=요일, y=실적, group=이름))+
  geom_line(linetype='dashed', color='red', size=1)

# 요일 중심으로 그래프 작성하기
gg1 + scale_x_discrete(limits=data_ex1$요일)


# 사원별 전체현황 데이터로 그래프 작성하기
# 데이터 불러오기
data_ex2 = read.csv('사원별판매현황_전체.csv')
data_ex2

gg2 = ggplot(
  data_ex2, 
  aes(x=요일, y=실적,group=이름, color=이름))+
  geom_line(size=2)

#windows()
gg2 + scale_x_discrete(
  limits=unique(data_ex2$요일))


# 점 그래프 작성하기
gg3 = ggplot(data_ex1, aes(x=요일, y=실적)) +
  geom_point(shape=21, aes(size=실적), fill='red')

gg3 + scale_x_discrete(limits=data_ex1$요일)

# 바 차트 작성하기
ggplot(data_ex1, aes(x=요일, y=실적)) +
  geom_bar(stat = 'identity', fill='blue') +
  scale_x_discrete(limits = data_ex1$요일)

# 지도 시각화하기
install.packages('leaflet')
library(leaflet)

han <- leaflet() %>%
  addTiles() %>%  
  setView(lng=126.5292, lat=33.36167, zoom = 10) %>%
  addMarkers(lng=126.5292, lat=33.36167,popup="제주도 한라산")
han

# 국내지진발생현황 시각화 하기
# (2) leaflet( ) 패키지 활용 실습- 교재 228 페이지
setwd("c:/temp/data")

#install.packages("Rcpp") # 혹시 leaflet( ) 패키지 설치하다가 Rcpp 에러나면 실행하세요
install.packages("readxl")
library("readxl") 


data_all <- read_excel("국내지진발생현황_2017.xlsx",sheet=2)
data1 <- read_excel("국내지진발생현황_2017.xlsx",sheet=3)
data2 <- read_excel("국내지진발생현황_2017.xlsx",sheet=4)
data3 <- read_excel("국내지진발생현황_2017.xlsx",sheet=5)
data4 <- read_excel("국내지진발생현황_2017.xlsx",sheet=6)
data5 <- read_excel("국내지진발생현황_2017.xlsx",sheet=7)
data6 <- read_excel("국내지진발생현황_2017.xlsx",sheet=8)
data7 <- read_excel("국내지진발생현황_2017.xlsx",sheet=9)
data8 <- read_excel("국내지진발생현황_2017.xlsx",sheet=10)
data9 <- read_excel("국내지진발생현황_2017.xlsx",sheet=11)
data10 <- read_excel("국내지진발생현황_2017.xlsx",sheet=12)
data11 <- read_excel("국내지진발생현황_2017.xlsx",sheet=13)
data12 <- read_excel("국내지진발생현황_2017.xlsx",sheet=14)

data1

#2017년 전체를 한번에 출력하기   
mall <- leaflet(data_all) %>% 
  addTiles() %>%  
  setView(mean(data_all$경도)-0.9, 
          mean(data_all$위도)+0.5, zoom = 6) %>%
  
  addCircles(~경도, ~위도, 
             popup=paste(data_all$번호,":",
                         data_all$발생시각,":",
                         data_all$위치,":진도 ",
                         data_all$규모), 
             weight = 10,  
             color="red", 
             stroke = TRUE, 
             fillOpacity = 1 ) %>%  
  
  addLegend("topright", 
            colors= "red", 
            labels="발생지역" , 
            title="2017년 전체") 

mall  

# 월별로 다른 색깔로 출력하기
cnt <- nrow(data_all)  
time1 <- substr(data_all$발생시각,6,7)
col <- c( )

for ( i in 1:cnt )
{ if (time1[i] == "01" )
{ col <- c(col,"red") }
  else if ( time1[i] == "02" )
  { col <- c(col,"orange") }
  else if ( time1[i] == "03" )
  { col <- c(col,"blue") }
  else if ( time1[i] == "04" )
  { col <- c(col,"yellow") }
  else if ( time1[i] == "05" )
  { col <- c(col,"darkgrey") }
  else if ( time1[i] == "06" )
  { col <- c(col,"cyan") }
  else if ( time1[i] == "07" )
  { col <- c(col,"green") }
  else if ( time1[i] == "08" )
  { col <- c(col,"gray") }
  else if ( time1[i] == "09" )
  { col <- c(col,"violet") }
  else if ( time1[i] == "10" )
  { col <- c(col,"lime") }
  else if ( time1[i] == "11" )
  { col <- c(col,"black") }
  else 
  { col <- c(col,"brown") }
}

cntall <- nrow(data_all)
cnt1 <- nrow(data1)
cnt2 <- nrow(data2)
cnt3 <- nrow(data3)
cnt4 <- nrow(data4)
cnt5 <- nrow(data5)
cnt6 <- nrow(data6)
cnt7 <- nrow(data7)
cnt8 <- nrow(data8)
cnt9 <- nrow(data9)
cnt10 <- nrow(data10)
cnt11 <- nrow(data11)
cnt12 <- nrow(data12)

mall <- leaflet(data_all) %>% 
  addTiles( ) %>%  
  setView(mean(data_all$경도)-0.9, 
          mean(data_all$위도)+0.5, 
          zoom = 7) %>%  
  
  addCircles(~경도, 
             ~위도, 
             popup=paste(data_all$번호,":",
                         data_all$발생시각,":",
                         data_all$위치,":진도 ",
                         data_all$규모), 
             weight = ~규모*12,
             color=col, opacity = 0.5 ) %>%  
  
  addLegend("topright", 
            colors= unique(col), 
            labels=paste(unique(time1),"월-",
                         summary(factor(time1)),"건"), 
            title=paste("2017년 전체-",cntall,"건")) 

mall

# 지역별 인구현황 시각화 하기

pop1 <- read.csv("지역별인구현황_2014_4월기준.csv")
map1 <- leaflet(pop1) %>% 
  addTiles( ) %>%  
  setView(mean(pop1$LON), 
          mean(pop1$LAT), 
          zoom = 7) %>%  
  
  addCircleMarkers(~LON, ~LAT , 
          popup=~지역,
          color=~ifelse(
            pop1$총인구수>3000000, "red", "blue"),
          radius=(~총인구수/min(총인구수)*0.5) ,
          fillOpacity=0.5 )
map1















