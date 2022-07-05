// 프로토콜
protocol info {
    var fullName: String { get }    //프로퍼티 요구(읽기 전용)
    // var age: Int { get set } (읽기 쓰기 전용)
    
    //메서드 요구
    func greet() -> String
}

class Person: info {
    var firstName: String
    var lastName: String
    
    var fullName: String { return "\(firstName) \(lastName)" }  // 프로퍼티 구현
    
    func greet() -> String {    //메서드 구현
        return "안녕하세요! 저의 이름은 \(fullName) 입니다. 잘 부탁합니다!"
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

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

