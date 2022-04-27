//Int, UInt 자료형
var integer: Int = -200
let unsignedInteger: UInt = 30
print("integer값: \(integer), unsignedInteger값: \(unsignedInteger)")
print("Int 최댓값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최댓값: \(UInt.max), UInt 최솟값: \(UInt.min)")

let largeInteger: Int64 = Int64.max
let smallInterger: Int8 = Int8.max
print("Int64 최댓값: \(largeInteger), Int8 최댓값: \(smallInterger)")
//Swift에서 Int와 UInt는 서로 다른 자료형

//Bool 자료형
var boolean: Bool = true
boolean.toggle()    //true-false 변환
let isMan: Bool = true
print("당신은 남자 입니까?: \(isMan)")

//Float, Double 자료형
var floatValue = 123456.1
let doubleValue = 1234567890.1
print("floatValue: \(floatValue), doubleValue: \(doubleValue)")

//Character
let alphabet: Character = "A"   //문자와 문자열 모두 큰 따옴표("") 사용
print(alphabet)

let unicode: Character = "♡"    //유니코드 문자 사용 가능
print(unicode)

let 한글: String = "ㄱ"    //한글도 유니코드에 속하므로 변수 이름을 한글로 표현 가능
print(한글)

//String
let name: String = "jeunghun"

var hello: String = String()    //이니셜라이저를 사용하여 빈 문자열 생성
hello.append("My name is ")   //append() 메서드를 사용하여 문자열 연결 가능

hello = hello + " " + name  // + 연산자로 문자열 연결 가능
print(hello)

print("name의 문자 수: \(name.count)")
print("introduce가 비어있습니까?: \(hello.isEmpty)")

