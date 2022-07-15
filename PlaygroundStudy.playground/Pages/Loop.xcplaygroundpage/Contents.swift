//간단한 for문
var sum: Int = 0

for i in 1...10 {
    sum += i
}

print("1부터 10까지의 합은 \(sum)입니다.")

//딕셔너리를 활용한 for문
let endOfMonth: [String: Int] = ["1월": 31, "2월": 28, "3월": 31, "4월": 30]

for (month, day) in endOfMonth {
    print("\(month), \(day)")
}

//while문
var language1: [String] = ["Swift", "Objective-C", "Python", "Java"]

while language1.isEmpty == false {
    print("\(language1.removeFirst())")
}

//repeat-while문
var language2: [String] = ["Kotlin", "JavaScript", "C++", "HTML"]

repeat {
    print("\(language2.removeFirst())")
} while language2.isEmpty == false

//중첩된 반복문
let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var sumNum:Int = 0

numbersLoop: for num in numbers {
    if num % 2 != 0 {
        continue numbersLoop    //반복문 제어 범위
    }
    
    var evenNumbers: [Int] = [Int]()
    evenNumbers.append(num)
    
    addLoop: while true {
        if evenNumbers.isEmpty == true {
            break addLoop   //반복문 제어 범위
        }
    
        sumNum += evenNumbers.removeFirst()
    }
}
print(sumNum)

