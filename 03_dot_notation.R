# dot notation = 함수의 호출

class('2023-11-22')
class(as.Date('2023-11-22')) # as.Date : 날짜로 인식

# dot notation의 예시
a = as.Date('2023-11-25')
b = as.Date('2022-10-30')
print (a - b)

# 라이브러리, 모듈, 패키지의 차이 : https://aliencoder.tistory.com/20
# 포함관계 : 라이브러리 >= 패키지 >= 모듈 >= 함수

# dot notation = "."
# 어떤 모듈, 패키지 안의 특정 함수를 호출한다 = library.func(argument)
# 모듈, 패키지 파일 안에는 함수들이 있다 
# 모듈, 패키지 파일 안에 있는 함수 = 종속함수

