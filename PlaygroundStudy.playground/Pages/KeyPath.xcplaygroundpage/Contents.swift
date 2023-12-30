//KeyPath
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Car {
    var model: String
    var owner: Person
}

let personLee: Person = Person(name: "이순신")
var myCar: Car = Car(model: "Model3", owner: personLee)

//keyPath: 프로퍼티의 위치만 참조
//키 경로를 사용하여 특정 타입의 특정 프로퍼티를 가리켜야 되는지 지정할 수 있음
let ownerKeyPath = \Car.owner
let carModelPath = \Car.model
let ownerNamePath = ownerKeyPath.appending(path: \.name)    // \Car.owner.name과 동일
let personNamePath = \Person.name

//keyPath subscript를 통해 경로에 지정되어 있는 프로퍼티 값을 읽을 수 있음
print(personLee[keyPath: personNamePath])    //이순신
print(myCar[keyPath: carModelPath])    //Model3
print(myCar[keyPath: ownerKeyPath])    //personLee
print(myCar[keyPath: ownerNamePath])    //이순신

//keyPath subscript를 통해 프로퍼티에 접근하여 값 변경 가능
myCar[keyPath: carModelPath] = "ModelX"
//personLee[keyPath: personNamePath] = "이성계"    상수 or read-only property는 keypath subscript를 통해 변경 불가

let personKim: Person = Person(name: "김유신")
myCar[keyPath: ownerKeyPath] = personKim

print(myCar[keyPath: carModelPath])    //ModelX
print(myCar[keyPath: ownerKeyPath])    //personKimm
print(myCar[keyPath: ownerNamePath])    //김유신
