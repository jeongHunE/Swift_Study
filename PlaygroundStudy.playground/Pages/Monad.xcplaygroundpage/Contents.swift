let number: Int? = 42    //모나드 Context와 Contents
//Functor 예시
//Context인 Optional로부터 Contents를 함수에 넣고 수행 후 다시 Optional로 mapping
var addedThree: Int? = number.map { (number: Int) -> Int in
    return number + 3
}

print(addedThree)    //Optional(45)

let nothing: Int? = nil    //비어있는 Context
addedThree = nothing.map { (number: Int) -> Int in
    return number + 3    //nil인 경우 callback 함수 수행하지 않고 nil 반환
}
print(addedThree)    //nil

//Contents의 타입은 상관 없음
/*let StringNumber: String? = number.map { (number: Int) -> String in
    return String(number)
}

print(StringNumber)    //Optional("42")*/

//중첩 Context
let numbers: [[Int]] = [[1, 2], [3, 4, 5]]
//flatMap Functor
let flattedNumbers:[Int] = numbers.flatMap { (numbers: [Int]) -> [Int] in
    return numbers
}
print(flattedNumbers)    //[1, 2, 3, 4, 5]

//모나드를 사용하지 않는 경우
let stringNumber: String? = "45"
var result: Int?

//let binding
if let string: String = stringNumber {
    if let number: Int = Int(string) {
        result = number + 3
    } else {
        result = nil
    }
} else {
    result = nil
}

print(result)    //Optional(48)

//모나드를 사용한 경우 flatMap, map 체이닝
result = stringNumber.flatMap { (number: String) -> Int? in
    return Int(number)
}.map { (number: Int) -> Int in
    return number + 3
}

//result = stringNumber.flatMap { Int($0) }.map { $0 + 3 }

print(result)    //Optional(48)
