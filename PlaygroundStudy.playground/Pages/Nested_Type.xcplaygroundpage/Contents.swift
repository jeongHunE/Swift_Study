//Nested Type(중첩 타입)
class Person {
    enum Sex {
        case male, female
    }
    
    let sex: Sex
    var name: String
    
    init(name: String, sex: Sex) {
        self.name = name
        self.sex = sex
    }
}

let personLee: Person = Person(name: "이순신", sex: .male)
print(personLee.name)

switch personLee.sex {
case .male:
    print("남성입니다.")
case .female:
    print("여성입니다.")
}
