//구조체 정의
struct PersonInformation {
    var name: String
    var age: Int
}

//구조체 인스터스 생성 및 초기화
var personInfo: PersonInformation = PersonInformation(name: "joe", age: 24)

personInfo.name = "mark"    //구조체 프로퍼티가 변수로 선언시 변경 가능
personInfo.age = 35
