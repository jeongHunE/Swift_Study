//변수 선언

var name: String = "jeunghun"
var age: Int = 24
var job: String = "student developer"
var height = 173    //타입 추론

print("\(type(of: height))")
print("나의 이름은 \(name)이고, 나이는 \(age)세이며, 직업은 \(job)입니다. 사실, 키는 \(height)cm 입니다.")

//상수 선언
let userName: String = "jeunghun" //변하지 않는 값은 상수로 선언
age = 24    //위에서 변수로 선언 하여 값 변경 가능
job = "student developer"
let userHeight = 173    //타입 추론
print("나의 이름은 \(name)이고, 나이는 \(age)세이며, 직업은 \(job)입니다. 사실, 키는 \(height)cm 입니다.")

