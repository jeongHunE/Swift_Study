// 프로토콜
protocol SomeProtocol {
    //프로토콜 요구 사항은 반드시 변수로 선언
    //읽기 전용은 구현부에서 상수 저장 프로퍼티, 읽기 전용 연산 프로퍼티로 구현 가능
    //읽기 전용 프로퍼티를 읽기, 쓰기 전용 프로퍼티로 구현 가능
    //읽기, 쓰기가 모두 가능한 프로퍼티를 읽기 전용으로 구현 불가능
    var settableProperty: String { get set }    //읽기, 쓰기 전용 프로퍼티 요구
    var notNeedToBeSettableProperty: String { get }    //읽기 전용 프로퍼티 요구
    
    //타입 프로퍼티는 static으로 선언
    //구현부에서 class 혹은 static으로 선언해도 상관 없음
    static var someTypeProperty: Int { get set }
    static var anotherProperty: Int { get }
}

protocol info {
    var fullName: String { get }    //읽기 전용 프로퍼티 요구
    var age: Int { get }    //읽기 전용 프로퍼티 요구
    
    //메서드 요구
    func greet(to: Any)
}

class Person: info {
    let age: Int
    var firstName: String
    var lastName: String
    
    // 프로퍼티 구현
    var fullName: String {
        firstName + lastName
    }
    
    //메서드 구현
    func greet(to: Any) {
        if let person: info = to as? info {    //info protocol를 준수하는 인스턴스인지 확인
            print("\(person.fullName)씨, 안녕하세요! 저의 이름은 \(self.fullName)이고 나이는 \(self.age)입니다. 잘 부탁합니다!")
        } else {
            print("대화 상대가 없습니다.")
        }
    }
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

let personKim: Person = Person(firstName: "Kim", lastName: " cheolsu", age: 22)
let personPark: Person = Person(firstName: "Park", lastName: " younghee", age: 19)

personKim.greet(to: personPark)
personPark.greet(to: personKim)

//프로토콜 상속
protocol SwiftProgramming {
    func swift()
}

protocol PythonProgramming {
    func python()
}

protocol Programming: SwiftProgramming, PythonProgramming {
    func coding()
}

class Programmer: Programming {
    func coding() {
        print("I can Coding")
    }
    
    func swift() {
        print("I can use Swift!")
    }
    
    func python() {
        print("I can use Python!")
    }
}

//프로토콜 준수 확인
var personLee: Programmer = Programmer()
print(personLee is Programming)     //true

if let test: Programming = personLee as? Programming {
    print("Programming 프로토콜을 준수합니다.")   //Programming 프로토콜을 준수합니다.
}
