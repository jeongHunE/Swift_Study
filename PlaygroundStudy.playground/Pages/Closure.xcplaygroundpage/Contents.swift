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

//문맥을 통합 타입 유추(매개변수, 반환 값)
yourCircle = circle(r: 3,  PI: 3.14) {(r, PI) in return 2 * PI * r}
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

//값 획득
func makeIncrementer(amount: Int) -> (() -> Int) {
    var runningTotal = 1
    func incrementer() -> Int {
        runningTotal *= amount
        return runningTotal
    }   //incrementer 함수는 주변 변수인 amount와 runningTotal의 참조를 획득
    return incrementer
}

let incrementByTwo: (() -> Int) = makeIncrementer(amount: 2)

let first: Int = incrementByTwo()
//incrementByTwo 상수에 저장된 클로저는 참조를 가지고 있기때문에 호출시 runningTotal에 amount가 곱해진 값이 반환됨
print(first)
let second: Int = incrementByTwo()
print(second)
let third: Int = incrementByTwo()
print(third)

//탈출 클로저
typealias funcObject = () -> Void
let firstClosure: funcObject = {
    print("You choice First Closure!")
}

let secondClosure: funcObject = {
    print("You choice Second Closure!")
}

let noExistClosure: funcObject = {
    print("error")
}

func chocieClosure(first: @escaping funcObject, second: @escaping funcObject, choice: String) -> funcObject {
    if choice == "f" {
        return first
    }
    else if choice == "s" {
        return second
    }
    else {
        return noExistClosure
    }
    //전달인자로 전달된 클로저가 다시 반환 될 수 있으므로 탈출 클로저를 사용
}

//함수의 반환 값인 클로저를 외부 상수에 저장
let yourClosure: funcObject = chocieClosure(first: firstClosure, second: secondClosure, choice: "f")

yourClosure()   //클로저 호출

typealias VoidClosure = () -> Void

func functionNoescapeClosure(closure: VoidClosure) {
    closure()
}

func functionEscapeClosure(completionHandler: @escaping VoidClosure) -> VoidClosure {
    return completionHandler
}

class SomeClass {
    var a: Int = 10
    
    func noescapeClosureMethod() {
        functionNoescapeClosure() { a = 200 }
    }
    
    func escapeClosureMethod() -> VoidClosure {
        return functionEscapeClosure() { self.a = 100 }     //탈출 클로저의 프로퍼티, 메서드, 서브스크립트로 접근시 self 키워드 필수
    }
}

let aInstance: SomeClass = SomeClass()
aInstance.noescapeClosureMethod()
print(aInstance.a)

let returnedClosure: VoidClosure = aInstance.escapeClosureMethod()
returnedClosure()
print(aInstance.a)


//자동 클로저
var myDevice: [String] = ["iPhone", "iPad", "Macbook Pro"]

func introduceMyDevice(_ device: @autoclosure () -> String) {
    //autoclosure 속성을 가지는 매개변수가 전달인자를 클로저로 변환
    print("This is my \(device())!")    //(자동)클로저 호출
}

introduceMyDevice(myDevice.removeFirst())
