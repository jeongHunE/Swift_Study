//옵셔널 체이닝
class Major {                       //전공
    var field: String               //전공 분야
    
    init(field: String) {
        self.field = field
    }
}

struct University {                 //학교
    var name: String                //학교 이름
    var location: String            //학교 위치
    var major: Major?               //전공 관련 정보
    var summary: String?            //학교 소개
}

class Student {                     //학생
    var grade: String               //학년
    var university: University?     //학교 관련 정보
    
    init(grade: String) {
        self.grade = grade
    }
}

class Person {                      //사람
    var name: String                //이름
    var student: Student?           //학생 관련 정보
    
    init(name: String) {
        self.name = name
    }
}

let personLee: Person = Person(name: "이철수")

var yourField: String? = nil

//옵셔널 바인딩을 이용한 프로퍼티 접근
if let personStudent: Student = personLee.student {     //옵셔널 바인딩으로 nil이 아닌지 판별
    if let personUniversity: University = personStudent.university {
        if let personMajor: Major = personUniversity.major {
            yourField = personMajor.field
        }
    }
}

if let field: String = yourField {
    print(field)
} else {
    print("전공에 대한 정보가 없습니다.")
}

//옵셔널 체이닝을 이용한 프로퍼티 접근
if let yourFiled: String = personLee.student?.university?.major?.field {
    print(yourFiled)
} else {
    print("전공에 대한 정보가 없습니다.")
}

//옵셔널 체이닝을 이용한 값 할당
personLee.student = Student(grade: "sophomore")
personLee.student?.university = University(name: "한국대학교", location: "대한민국", summary: nil)
personLee.student?.university?.major = Major(field: "nil")
personLee.student?.university?.major?.field = "컴퓨터공학"

print(personLee.student?.university?.major?.field)
