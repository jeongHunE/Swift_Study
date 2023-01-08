class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {    //지정 이니셜라이저
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {    //편의 이니셜라이저
        self.init(name: name, age: 0)     //지정 이니셜라이저 호출
    }
}

class Student: Person {
    var major: String
    
    //프로퍼티 기본값이 존재하고 이니셜라이저가 구현되어 있지 않을떄 부모 클래스의 이니셜라이저 자동 상속
    
    //프로퍼티 기본값이 없을 경우 이니셜라이저 상속 x
    override init(name: String, age: Int) {    //이니셜라이저 override
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    /*프로퍼티 기본값이 존재하거나 이니셜라이저 재정의로 부모 클래스와 동일한 이니셜라이저를 사용할 수 있다면
     편의 이니셜라이저 자동 상속*/
    
    required init(name: String) {    //요구 이니셜라이저
        self.major = "Swift"
        super.init(name: name, age: 0)
    }
}

class UniversityStudent: Student {
    var grade: String
    
    required init(name: String) {    //요구 이니셜라이저 재정의
        self.grade = "F"
        super.init(name: name, age: 0)
    }
}

let person: Person = Person(name: "Lucas", age: 99)
let student: Student = Student(name: "john")
print(person.name)
print(student.name)
print(person.age)
print(student.age)
print(student.major)

let universityStudent: UniversityStudent = UniversityStudent(name: "mark")
print(universityStudent.name)
print(universityStudent.age)
print(universityStudent.major)
print(universityStudent.grade)
