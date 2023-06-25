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
