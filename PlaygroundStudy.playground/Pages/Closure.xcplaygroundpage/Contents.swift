//클로저
//원의 둘레 구하기
let round: (Double, Double) -> Double = {(r: Double, PI: Double) in
    return 2 * PI * r   //클로저를 사용하여 상수 선언
}

let result: Double = round(2, 3.14)
print(result)

//함수의 전달인자로 클로저 전달하기
let circumference: (Double, Double) -> Double
circumference = {(r: Double, PI: Double) in return 2 * PI * r}

let area: (Double, Double) -> Double
area = {(r: Double, PI: Double) in return PI * r * r}

func circle(r: Double, PI: Double, method: (Double, Double) -> Double) -> Double {
    return method(r, PI)
}

var myCircle: Double
myCircle = circle(r: 3, PI: 3.14, method: circumference)
print(myCircle)

myCircle = circle(r: 3, PI: 3.14, method: area)
print(myCircle)

//후행 클로저
var yourCircle: Double
yourCircle = circle(r: 3, PI: 3.14) {(r: Double, PI: Double) -> Double in return 2 * PI * r}
print(yourCircle)

//반환 값 생략
yourCircle = circle(r: 3,  PI: 3.14) {(r: Double, PI: Double) in return 2 * PI * r}
print(yourCircle)

//단축 인자이름(매개변수 생략)
yourCircle = circle(r: 3, PI: 3.14, method: {
    return 2 * $0 * $1
})
print(yourCircle)

//단축 인자이름(후행 클로저)
yourCircle = circle(r: 3, PI: 3.14) {
    return 2 * $0 * $1
}

print(yourCircle)

//암시적 반환 표현
yourCircle = circle(r: 3, PI: 3.14) {
    2 * $0 * $1
}

print(yourCircle)
