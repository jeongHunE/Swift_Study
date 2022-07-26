//저장 프로퍼티, 연산 프로퍼티
struct Position {
    var x: Int = 1      //저장 프로퍼티
    var y: Int = 1      //저장 프로퍼티
    
    //연산 프로퍼티
    var oppositePosition: Position {
        get {
            return Position(x: -x, y: -y)
        }
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var personLeePosition: Position = Position()
let personKimPosition: Position = Position(x: 5, y: 7) //이니셜라이저 사용
print("personLee의 위치: \(personLeePosition.x), \(personLeePosition.y)")
print("personKim의 위치: \(personKimPosition.x), \(personKimPosition.y)")
print(personLeePosition.oppositePosition)   //대칭 좌표
personLeePosition.oppositePosition = Position(x: 10, y: 20) //대칭좌표 재설정
print(personLeePosition)

//프로퍼티 감시자
class Student {
    var studentCount: Int = 10 {
        willSet {
            print("수강 인원이 \(studentCount)명에서 \(newValue)명으로 변경될 예정입니다.")
        }
        didSet {
            print("수강 인원이 \(oldValue)명에서 \(studentCount)명으로 변경 되었습니다.")
        }
    }
    //연산 프로퍼티
    var doubleValue: Int {
        get {
            return studentCount
        }
        set {
            studentCount = newValue
            print("수강 인원을 \(newValue)로 변경 중입니다.")
        }
    }
}

class MoreStudent: Student {
    override var doubleValue: Int {
        willSet {
            print("수강인원이 \(doubleValue)명에서 \(newValue)명으로 변경 예정입니다.")
        }
        
        didSet {
            print("수강인원이 \(oldValue)명에서 \(doubleValue)명으로 변경 되었습니다.")
        }
    }
}

let school: MoreStudent = MoreStudent()
school.studentCount = 15
print()
school.doubleValue = 30

//전역변수와 지역변수
var studentName: String = "이철수"
var studentID: Int = 12345
var studentInfo: String {
    get {   //get 메서드로 읽기 전용 상태로 구현
        "이름: \(studentName) 학번: \(studentID)"   //한 줄짜리 접근자는 return 생략 가능
    }
}
print(studentInfo)

//타입 프로퍼티
class Customer {
    static let price: Double = 15000    //저장 타입 프로퍼티(상수)
    static var discountRate:Double = 0  //저장 타입 프로퍼티(변수)
    
    static var setDiscountRate: Double {  //연산 타입 프로퍼티
        get {
            return discountRate
        }
        set {
            discountRate = newValue
        }
    }
    
    func discountPrice() -> Double {
        return Self.price * Self.discountRate
    }
}

var normalCustomer: Customer = Customer()
Customer.setDiscountRate = 0.95     //일반 고객 할인 비율 설정
print(normalCustomer.discountPrice())

var VIPCustomer: Customer = Customer()
Customer.setDiscountRate = 0.90     //VIP 고객 할인 비율 설정
print(VIPCustomer.discountPrice())
