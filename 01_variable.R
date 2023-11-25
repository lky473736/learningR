# R언어도 파이썬과 마찬가지로 interpreter 언어임
# 패키지 수동 설치 : install.packages('패키지이름')
# 코드 실행 위해서 실행할 코드 드래그 한 후 ctrl + enter 같이 누르기
# 콘솔 클리어는 ctrl + l

# 프로그래밍의 3요소 : 변수(variable), 함수(function), 함수의 호출(dot notation)

# computer의 하드웨어 분류 : 저장장치, 연산장치
# 저장장치 (영구성) : SSD, HDD ... (느림)
# 메모리 (휘발성) : RAM, Cache (저장장치, 연산장치의 속도 차이를 극복하기 위한 장치)
# 연산장치 : CPU, ALU ... (빠름)

# 변수 : 메모리의 한 주소에 특정 값을 저장하는 것
# 변수명 규칙 : 약어, 특징 살려서, 문자로 시작

가격 = 1000
갯수 = 5
총액 = 가격 * 갯수
print (총액)

# 변수에 담긴 데이터 유형 (class)
t1 = 3 # numeric
t2 = 'apple' # character
t3 = 0.2 # numeric
t4 = as.Date('2023-11-25') # date

print (class(t1)) 
print (class(t2))
print (class(t3))
print (class(t4))

# numero, numeric, number == 전부 숫자를 지칭하는 말