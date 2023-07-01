//ARC
class Student {
    var name: String
    weak var subject: Subject?    //약한 참조
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Student 해제")
    }
}

class Subject {
    var name: String
    weak var student: Student?    //약한 참조
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Subject 해제")
    }
}

//강한 참조
var studentLee: Student? = Student(name: "이순신")
var swiftProgramming: Subject? = Subject(name: "스위프트프로그래밍")

studentLee?.subject = swiftProgramming
swiftProgramming?.student = studentLee

studentLee = nil    //메모리 해제
swiftProgramming = nil    //메모리 해제
