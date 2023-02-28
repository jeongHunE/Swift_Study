//String Method
//문자열 결합
let hello: String = "Hello!"
let your: String = "jeunghun"
var greet: String = hello + " " + your
print(greet)    //Hello! jeunghun

//연산자를 이용한 문자열 비교
var isSameString: Bool = false
isSameString = hello == "Hello!"
print(isSameString)    //true

isSameString = hello == "hello"
print(isSameString)    //false

//접두어 비교
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("He")
print(hasPrefix)    //true

hasPrefix = your.hasPrefix("mi")
print(hasPrefix)    //false

//접미어 비교
var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("llo!")
print(hasSuffix)    //true

hasSuffix = your.hasSuffix("ke")
print(hasSuffix)    //false

//대소문자 변환
var convertedString: String = String()    //빈 문자열
convertedString = hello.uppercased()    //새로운 문자열 반환
print(convertedString)    //HELLO!

convertedString = hello.lowercased()    //새로운 문자열 반환
print(convertedString)    //hello!

//빈 문자열 확인
var isEmpty: Bool = false
isEmpty = greet.isEmpty    //isEmpty는 프로퍼티
print(isEmpty)    //false

greet = ""
isEmpty = greet.isEmpty
print(isEmpty)    //true

//문자열 길이 확인
print(greet.count)    //0
print(hello.count)    //6
print(your.count)    //8

let s: String = "hello"
let i: String.Index = s.startIndex
print(s[i])    //h

let j: String.Index = s.index(s.startIndex, offsetBy: 0)
print(s[j])    //h

let k: String.Index = s.index(s.startIndex, offsetBy: 4)
print(s[k])    //o

let a: String.Index = s.index(after: s.startIndex)
print(s[a])    //e

let b: String.Index = s.index(before: k)
print(s[b])    //l

print(s[i...a])    //he
