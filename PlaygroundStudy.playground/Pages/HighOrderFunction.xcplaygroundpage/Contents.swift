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
