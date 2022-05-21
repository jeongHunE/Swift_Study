//인스턴스 이니셜라이저 매개변수
struct Circle {
    var radius: Double
    
    init(_ radius: Double) {    //이니셜라이저로 프로퍼티 초기화
        self.radius = radius
    }
    
    func area() -> Double {     //원의 넓이 구하는 메서드
        return radius * radius * 3.14
    }
}

let myCircle: Circle = Circle(5)   //반지름 길이 5인 인스턴스 생성
print(myCircle.area())

//옵셔널 프로퍼티 타입
class Student {
    let studentName: String //상수 프로퍼티
    var studentID: Int?     //옵셔널 프로퍼티
    
    init(studentName: String) {
        self.studentName = studentName
    }
}

let studentLee: Student = Student(studentName: "이철수")
studentLee.studentID = 12345    //옵셔널 프로퍼티 값 할당
print(studentLee.studentName)
print(studentLee.studentID)

