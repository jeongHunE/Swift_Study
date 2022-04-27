let hello: String = "Hello"
let jeunghun: String = "jeunghun"
var greeting: String = hello + " " + jeunghun + "!" //+ 연산자로 문자열 합치기
print(greeting)

greeting = hello
greeting += " "
greeting += jeunghun
greeting += "!"
print(greeting)

//Bool 자료형을 이용한 문자열 비교
var isSamString: Bool = false

isSamString = hello == "Hello"
print(isSamString)

//메서드를 이용한 접두어, 접미어 확인
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")   //메서드를 이용한 접두어 비교
print(hasPrefix)

var hasSuffix: Bool = false
hasSuffix = jeunghun.hasSuffix("jeung") //메서드를 이용한 접미어 비교
print(hasSuffix)

//메서드를 이용한 대소문자 변환
var convertedString: String = ""
convertedString = hello.uppercased()    //대문자 변환
print(convertedString)

convertedString = hello.lowercased()    //소문자 변환
print(convertedString)

//빈 문자열 확인
var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString)

//문자열 길이 확인
print(jeunghun.count)
print(greeting.count)


