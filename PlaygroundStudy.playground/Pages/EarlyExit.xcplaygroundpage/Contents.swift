//빠른 종료(Early Exit)
for i in 1...10 {
    guard i % 2 == 0 else {     //guard 조건에 맞지 않으면 else문 실행
        continue
    }
    print(i)
}

//옵셔널 바인딩을 사용한 guard 구문
func introduce1(_ person: [String: String]) -> Void {
    guard let name: String = person["name"] else {
        return
    }
    
    print("저의 이름은 \(name) 입니다.")
    
    guard let residence: String = person["residence"] else {
        return
    }
    
    print("저는 \(residence)에 거주중 입니다.")
    
    guard let job: String = person["job"] else {
        return
    }
    
    print("저의 직업은 \(job) 입니다.")
}

var person: [String: String] = [String: String]()   //새로운 딕셔너리 생성
person["name"] = "이철수"      //딕셔너리에 새로운 Key: Value 추가
person["residence"] = "대한민국"
person["job"] = "개발자"

introduce1(person)

//guard문에 구체적인 조건 추가
func introduce2(name: String?, age: Int?, job: String?) {
    guard let name: String = name, let age: Int = age, age > 19, let job: String = job else {
        print("성인이 아닙니다.")  //age가 19 이하일 경우 else문 실행
        return
    }
    print("저의 이름은 \(name)입니다.")
    print("저는 성인입니다.")
    print("저의 직업은 \(job)입니다.")
}

introduce2(name: "이철수", age: 99, job: "개발자")
