# 작업디렉토리 설정
# 실행할 코드 블록 설정 후 컨트롤+엔터
setwd('c:/temp')
getwd()

# 변수의 활용
var1 = 3
var2 = 2
print(var1 + var2)
cat('합계:', var1+var2)

# 여러가지 데이터 유형의 이해
var3 = 3.5
var4 = '오늘 날씨 더워요'

class(var1)
class(var3)
class(var4)

# 함수의 이해
print()
cat()
sum(1,2)

# 함수의 호출
ex1 = '2023-05-05'
ex2 = as.Date('2023-05-05')

class(ex1)
class(ex2)

# 날짜의 연산
ex3 = as.Date('2023-11-01')
ex4 = as.Date('2000-01-01')
cat('날짜계산:', ex3-ex4)













