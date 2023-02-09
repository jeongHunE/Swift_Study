enum Number: Int, CaseIterable {    //rawValue: Integer type
    case one = 1
    case two = 2
    case three = 3
    case four
    case five
}

var num1: Number = Number.one
//var num1: Number = .one
print("num1 = \(num1)")    //num1 = one

var num2: Number = Number.two
print("num2 = \(num2.rawValue)")    //num2 = 2

var num3: Number? = Number(rawValue: 3)    //원시값으로 열거형 변수 선언
print("num3 = \(num3!)")    //num3 = three

var allCase: [Number] = Number.allCases
print(allCase)    //[Number.one, Number.two, Number.three, Number.four, Number.five]


enum DayTodo: CaseIterable {    //연관값: String
    case sun(todo: String)
    case mon(todo: String)
    case tue(todo: String)
    case wen(todo: String)
    case thu(todo: String)
    case fri(todo: String)
    case sat(todo: String)
    
    static var allCases: [DayTodo] {
        return [DayTodo.sun(todo: "쉬는 날"), DayTodo.mon(todo: "장보기"), DayTodo.tue(todo: "알바"), DayTodo.wen(todo: "친구 약속"), DayTodo.thu(todo: "알바"), DayTodo.fri(todo: "우편 보내기"), DayTodo.sat(todo: "영화 보기")]
    }
}

var mondayTodo: DayTodo = DayTodo.mon(todo: "장보기")
print(mondayTodo)    //mon(todo: "장보기")

print(DayTodo.allCases)    //[DayTodo.sun(todo: "쉬는 날"), DayTodo.mon(todo: "장보기"), DayTodo.tue(todo: "알바"), DayTodo.wen(todo: "친구 약속"), DayTodo.thu(todo: "알바"), DayTodo.fri(todo: "우편 보내기"), DayTodo.sat(todo: "영화 보기")]

enum Calculator {
    case number(Int)    //Integer type 연관값
    indirect case add(Calculator, Calculator)    //Calculator type 연관값
    indirect case mul(Calculator, Calculator)
}

let two: Calculator = .number(2)
let five: Calculator = .number(5)
let sum: Calculator = .add(two, five)
let multiply: Calculator = .mul(two, five)

func operate(_ express: Calculator) -> Int {
    switch express {
    case .number(let value):    //let binding
        return value
    case .add(let left, let right):
        return operate(left) + operate(right)
    case .mul(let left, let right):
        return operate(left) * operate(right)
    }
}

print(operate(sum))    //7
print(operate(multiply))    //5

enum AppleSilicon: Comparable {
    case m1
    case m1Pro(core: Int)
    case m1Max(core: Int)
    case m1Ultra
}

let mac: AppleSilicon = .m1
let myMac: AppleSilicon = .m1Pro(core: 8)
let myMacBook: AppleSilicon = .m1Pro(core: 10)
let yourMac: AppleSilicon = .m1Max(core: 10)
let yourMacStudio: AppleSilicon = .m1Ultra

var device: [AppleSilicon] = [mac, myMac, myMacBook, yourMac, yourMacStudio]
device.sort()
print(device)    //[AppleSilicon.m1, AppleSilicon.m1Pro(core: 8), AppleSilicon.m1Pro(core: 10), AppleSilicon.m1Max(core: 10), AppleSilicon.m1Ultra]

