//MARK: - Wildcard Pattern(와일드 카드 패턴)
let number: Int = 1

switch number {
case _:    //어떤 값이 와도 해당 case문을 실행
    print(number)
}

let optionalNumber: Int? = 1

switch optionalNumber {
case 1?:    //Optional(1)인 case
    print("Optional(1)")
case _?:    //Optional(1)이 아닌 다른 모든 Optional인 case
    print(optionalNumber)
case nil:    //값이 없는 case
    print("nill")
}

let tupleValue1: (String, Int) = ("이순신", 99)    //(이름, 나이)

switch tupleValue1 {
case ("이순신", 99):
    print("이름과 나이가 모두 일치합니다.")
case ("이순신", _):
    print("이름만 일치합니다.")
case (_, _):
    print("아무것도 일치하지 않습니다.")
}

//MARK: - Identifier Pattern(식별자 패턴)
let someValue = 10    //type: Int
print(someValue)    //10

//MARK: - Value-Binding Pattern
let tupleValue2: (String, Int) = ("홍길동", 100)

switch tupleValue2 {
case let (name, age):    //tupleValue2의 각 요소와 바인딩
    print("이름: \(name), 나이: \(age)")
}

/*
 switch tupleValue2 {
 case (let name, let age):
     print("이름: \(name), 나이: \(age)")
 }
 */

//MARK: - Tuple Pattern(튜플 패턴)
let (x, y): (Int, Int) = (1, 2)    //각 변수에 값 매칭
print(x)    //1
print(y)    //2

let tupleArray: [(Int, Int)] = [(0, 0), (1, 1), (2, 2), (3, 3), (4, 4), (5, 5)]

for (a, b) in tupleArray {
    print("a: \(a), b: \(b)")
}

//a: 0, b: 0
//a: 1, b: 1
//a: 2, b: 2
//a: 3, b: 3
//a: 4, b: 4
//a: 5, b: 5

//MARK: - Enumeration Case Pattern(열거형 케이스 패턴)
let anotherValue: Int = 100

if case 100 = anotherValue {    //case 조건
    print(anotherValue)    //100
}

enum Todo {
    case sum(todo: String)
    case mon(todo: String)
    case tue(todo: String)
    case wen(todo: String)
    case thu(todo: String)
    case fri(todo: String)
    case sat(todo: String)
}

let mondayTodo: Todo = .mon(todo: "영어 공부")

while case .mon(let todo) = mondayTodo {    //연관값에는 튜플 패턴 사용
    print(todo)    //영어 공부
    break
}

let tuesdayTodo: Todo = .tue(todo: "과제 제출")

func findTueTodo(target: Todo) {
    guard case .tue(let todo) = target else {
        print("화요일에 해야할 작업이 없습니다.")
        return
    }
    print("화요일 작업: \(todo)")
}

findTueTodo(target: tuesdayTodo)    //화요일 작업: 과제 제출

//MARK: - Optional Pattern(옵셔널 패턴)
var optionalValue: Int? = 10

if case .some(let value) = optionalValue {
    print(value)    //10
}

if case let value? = optionalValue {
    print(value)    //10
}

//MARK: - Type-Casting Pattern
let stringValue: String = "Swift"

switch stringValue {
case is Int:    //타입 확인만 가능
    print("stringValue is Int")
case var value as String:    //타입 캐스팅 후 변수 사용 가능
    value += " is fun!"
    print(value)    //Swift is fun!
default:
    print("stringValue is not String")
}

//MARK: - Expression Pattern(표현 패턴)
let intValue: Int = 5

//~= 연산자를 통해 Range 객체와 비교하여 true이면 매치
switch intValue {
case 0...9:
    print("intValue in 0...9")
default:
    print("intvalue < 0 or intValue > 9")
}

//같은 타입의 비교는 == 연산자 사용
switch intValue {
case 5:
    print("intValue is 5")
default:
    print("intValue is not 5")
}

//~= 연산자 재정의
func ~= (pattern: String, value: Int) -> Bool {
    return pattern == String(value)
}

//재정의된 ~= 연산자를 사용하여 비교
switch intValue {
case "5":
    print("intValue is 5")
default:
    print("intValue is not 5")
}
