//Int, UInt 자료형
/* Int: +, -, 0을 포함하는 정수
   UInt: -를 제외한 0과 +를 포함하는 정수 */
var integer: Int = -200
let unsignedInteger: UInt = 30
print("integer값: \(integer), unsignedInteger값: \(unsignedInteger)")
print("Int 최댓값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최댓값: \(UInt.max), UInt 최솟값: \(UInt.min)")

let largeInteger: Int64 = Int64.max    //64비트 Int 타입
let smallInterger: Int8 = Int8.max    //8비트 Int 타입
print("Int64 최댓값: \(largeInteger), Int8 최댓값: \(smallInterger)")

//let tooLarge: Int = Int.max + 1    Int 범위 초과, 오류
//let minusUInt: UInt = -1    UInt 타입에 음수 대입 불가능, 오류

//Bool 자료형
var boolean: Bool = true
boolean.toggle()    //true-false 변환
print(boolean)
let isMan: Bool = true
print("당신은 남자 입니까?: \(isMan)")

//Float, Double 자료형
var floatValue:Float = 1234567890.1    //표현 범위 초과
let doubleValue:Double = 1234567890.1
print("floatValue: \(floatValue), doubleValue: \(doubleValue)")

floatValue = 123456.1
print("floatValue: \(floatValue)")

//random(in: ) method
//1이상 100미만의 범위에서 난수 발생
print(Int.random(in: 1..<100))
print(UInt.random(in: 1..<100))
print(Float.random(in: 1..<100))
print(Double.random(in: 1..<100))

//Character
let alphabet: Character = "Z"   //문자와 문자열 모두 큰 따옴표("") 사용
print(alphabet)

let unicode: Character = "♡"    //유니코드 문자 사용 가능
print(unicode)

let 한글: String = "ㅎ"    //한글도 유니코드에 속하므로 변수 이름을 한글로 표현 가능
print(한글)

//String
let name: String = "jeunghun"
var hello: String = String()    //이니셜라이저를 사용하여 빈 문자열 생성
hello.append("My name is ")   //append() 메서드를 사용하여 문자열 연결 가능
hello = hello + " " + name  // + 연산자로 문자열 연결 가능
print(hello)

print("name의 문자 수: \(name.count)")    //문자열의 문자 개수
print("introduce가 비어있습니까?: \(hello.isEmpty)")    //문자열이 비어있는지 bool 값 반환

// 타입 별칭
// 스위프트에서는 기본의 데이터 타입에 별칭 부여가 가능함
typealias MyInt = Int
typealias MyDouble = Double

let age: MyInt = 24
var height: MyDouble = 173.3

print(age)
print(height)

//tuple 자료형
var personLee: (name: String, age: Int, height: Double) = ("jeunghun", 24, 173.3)   //tuple 키워드 없이 선언
print("이름: \(personLee.name), 나이: \(personLee.age), 키: \(personLee.height)")
//tuple index

personLee.age = 25
personLee.2 = 175   //index를 이용한 값 변경
print("이름: \(personLee.0), 나이: \(personLee.1), 키: \(personLee.2)")
//  index를 이용한 값 호출
