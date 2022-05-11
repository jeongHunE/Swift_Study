//optional 변수 선언
var studentID: Int? = 1234567
print(studentID)

studentID = nil     //nil 대입
print(studentID)

//switch문을 이용한 optional 변수 값 확인
func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("optional의 값이 nil입니다.")
    case .some(let value):
        print("optional의 값은 \(value)입니다.")
    }
}

var myID: Int? = 1234567
checkOptionalValue(value: myID)

var yourID: Int? = nil
checkOptionalValue(value: yourID)

//optional 강제 추출
var myName: String? = "jeunghun"

var name_Value: String = myName!    //optional값 강제 추출
print(name_Value)

//optional 바인딩
var studentName: String? = "jeunghun"

if let name = studentName {
    //변수도 상관 없음
    print("학생의 이름은 \(name)입니다.")
} else {
    print("studentName == nil")
}

//암시적 옵셔널 추출
var personName: String! = "jeunghun"
print(personName)
personName = nil    //String!도 optional이므로 nil 대입 가능
print(personName)
