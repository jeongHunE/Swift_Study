//map(맵)
let numbers: [Int] = [1, 2, 3, 4, 5, 6]

var squaredNum: [Int] = [Int]()     //제곱한 수를 저장할 배열
var stringNum: [String] = [String]()    //숫자를 문자로 만들어 저장할 배열

squaredNum = numbers.map({ (number: Int) -> Int in
    return number * number
})


stringNum = numbers.map({ (number: Int) -> String in
    return ("\(number)")
})

print(squaredNum)   //[1, 4, 9, 16, 25, 36]
print(stringNum)    //["1", "2", "3", "4", "5", "6"]

//for문을 이용한 표현
for number in numbers {
    squaredNum.append(number * number)
    stringNum.append("\(number)")
}

print(squaredNum)   //[1, 4, 9, 16, 25, 36]
print(stringNum)    //["1", "2", "3", "4", "5", "6"]

//filter(필터)
var evenNum: [Int] = numbers.filter( { (number: Int) -> Bool in
    return number % 2 == 0      //numbers에서 짝수만을 추출하여 새로운 배열에 저장
})

print(evenNum)      //[2, 4, 6]

//map 함수와 filter 함수의 연계
var oddNum: [Int] = numbers.map { $0 + 5 }.filter { $0 % 2 == 1}    //numbers의 각 요소에 5씩 더한 후 홀수 추출

print(oddNum)       //[7, 9, 11]

//reduce(리듀스)
//연산 후 결과 값을 반환하는 형태의 리듀스
var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    return result + next    //초기값이 0이고 numbers에 모든 요소를 더하는 리듀스
})

print(sum)      //21

var mul: Int = numbers.reduce(1) {  //초기값이 1이고 numbers의 모든 요소를 곱하는 리듀스
    $0 * $1     //후행 클로저, return 생략, 매개변수 생략
}

print(mul)  //720

//연산 후 결과 같은 반환 하지 않고 초기값에 직접 연산을 수행하는 형태의 리듀스
sum = numbers.reduce(into: 0, { (result: inout Int, next: Int) in
    result += next  //값을 반환하지 않고 inout으로 직접 연산 수행
})

print(sum)      //21

mul = numbers.reduce(into: 1) {
    $0 *= $1    //후행 클로저, return 생략, 매개변수 생략
}

print(mul)      //720

//소문자 String을 대문자 String으로 바꾸기
let language: [String] = ["Swift", "Kotlin", "Objective-C", "Java", "Python"]

var upperString: [String] = language.reduce(into: []) {
    $0.append($1.uppercased())
}
print(upperString)      //["SWIFT", "KOTLIN", "OBJECTIVE-C", "JAVA", "PYTHON"]
