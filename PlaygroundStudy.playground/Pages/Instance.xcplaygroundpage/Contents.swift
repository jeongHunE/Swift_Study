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

//구조체 멤버와이즈 이니셜라이저
struct Point {
    var x: Int = 1
    var y: Int = 1
}

let point1: Point = Point()
let point2: Point = Point(x: 10, y: 20)
let point3: Point = Point(y: 15)    //기본값이 있을 경우 필요한 프로퍼티만 초기화 가능

// 초기화 위임과 실패 가능한 이니셜라이저
enum Customer {
    case Silver, Gold, VIP
    
    init?(point: Int) {
        switch point {
        case 1...49:
            self = .Silver
        case 50...79:
            self = .Gold
        case 80...100:
            self = .VIP
        default:
            return nil
        }
    }
    
    init?(currentPoint: Int, earnPoint: Int) {   //초기화 위임
        self.init(point: currentPoint + earnPoint)
    }
}

var customerLee: Customer? = Customer(point: 77)
print(customerLee)
var customerKim: Customer? = Customer(currentPoint: 75, earnPoint: 6)
print(customerKim)
var customerSon: Customer? = Customer(point: -100)
print(customerSon)

//디이니셜라이저
class TestClass {
    deinit {
        print("인스턴스가 메모리에서 해제 됩니다.")
    }
}

var testInstance: TestClass? = TestClass()
testInstance = nil
