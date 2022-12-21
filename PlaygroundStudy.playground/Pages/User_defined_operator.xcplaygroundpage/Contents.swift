prefix operator **    //전위 연산자 overloading
postfix operator **    //후위 연산자 overloading
infix operator **: MultiplicationPrecedence    //중위 연산자 overloading

class Car {
    var modelYear: Int?
    var modelName: String?
}

prefix func ** (value: Int) -> Int {
    return value * value
}

postfix func ** (value: Int) -> Int {
    return value + 10
}

func ** (left: String, right: String) -> Bool {
    return left.contains(right)
}

func == (left: Car, right: Car) -> Bool {
    return left.modelName == right.modelName
}

let two: Int = 2
let five: Int = 5
let hello: String = "Hello World!"
let world: String = "World!"
let sqrtTwo: Int = **two
let twoPlusTen: Int = two**
let fivePlusTen: Int = **five**    //후위 연산자 먼저 수행
let myCar: Car = Car()
myCar.modelName = "S"
let yourCar: Car = Car()
yourCar.modelName = "S"

print(sqrtTwo)        //4
print(twoPlusTen)     //12
print(fivePlusTen)    //225
print(hello ** world)    //true
print(myCar == yourCar)    //true
