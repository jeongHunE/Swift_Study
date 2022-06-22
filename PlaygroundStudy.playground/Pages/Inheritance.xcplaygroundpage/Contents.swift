//상속
//자식 클래스
class Person {
    var name: String = ""   // 저장 프로퍼티
    var age: Int = 0
    
    var greet: String { // 연산 프로퍼티(읽기 전용)
        get {
            return "나의 이름은 \(name)이고, 나이는 \(age)입니다. 반갑습니다!"
        }
    }
    
    func favorite() -> Void {   //메서드
        print("제가 좋아하는건 영화 보기 입니다.")
    }
}

//부모 클래스
class Student: Person {
    var major: String = ""  //새로운 프로퍼티
    
    func study() -> Void {
        print("열심히 공부합니다.")
    }
}

let personLee: Person = Person()
personLee.name = "이철수"
personLee.age = 50
print(personLee.greet)
personLee.favorite()

let personKim: Student = Student()
personKim.name = "김영희"
personKim.age = 20
personKim.major = "Computer Science"
print(personKim.greet)
personKim.favorite()
personKim.study()
