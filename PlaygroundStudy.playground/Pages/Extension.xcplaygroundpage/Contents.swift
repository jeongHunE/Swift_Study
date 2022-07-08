//익스텐션(extension)
extension Int {
    var multipleOfTwo: Bool {   //2의 배수인지 확인하는 연산 프로퍼티 추가
        return self % 2 == 0
    }
    
    var multipleOfFive: Bool {  //5의 배수인지 확인하는 연산 프로퍼티 추가
        return self % 5 == 0
    }
    
    func squared() -> Int {    //제곱을 만들어주는 메서드 추가
        return self * self
    }
    
    static func isIntTypeInstance(_ instance: Any) -> Bool {
        return instance is Int
    }
}

var number: Int = 6
print(number.multipleOfTwo)     //true
print(number.multipleOfFive)    //false
print(number.squared())         //36
print(Int.isIntTypeInstance(number))    //true

number = 10
print(number.multipleOfTwo)     //true
print(number.multipleOfFive)    //true
print(Int.isIntTypeInstance(number))    //true

//이니셜라이저 추가
extension String {      //이니셜라이저 추가
    init(name: String) {
        self = name + "님"
    }
}

let personLeeName: String = String(name: "이철수")
print(personLeeName)

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Person {
    convenience init() {    // 편의 이니셜라이저 추가
        self.init(name: "Unkown")
    }
}

let somePerson: Person = Person()
print(somePerson.name)

//서브 스크립트 추가
extension String {
    subscript(repeatCount: Int) -> String {
        var str: String = ""
        for _ in 0..<repeatCount {
            str += self
        }
        return str
    }
}

print("hello"[3])

//중첩 타입
extension Int {
    enum Kind {
        case negative, positive, zero
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

print(1.kind)
print(0.kind)
print((-1).kind)
