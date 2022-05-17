//클래스 정의
class Person {
    var name: String = "jeunghun"
    var age: Int = 24
    var height: Double = 0.0
    var weight: Double = 0.0
    
    //디이니셜라이저
    deinit {
        print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}

var jeunghun: Person = Person()     //인스턴스 생성
print(jeunghun.name)
print(jeunghun.age)
jeunghun.height = 173.3
jeunghun.weight = 60.8
print(jeunghun.height)
print(jeunghun.weight)

var joe: Person? = Person()
joe = nil   //메모리 해제

//식별 연산자 사용
var mark: Person = Person()
let friend: Person = mark
let anotherFriend: Person = Person()

print(mark === friend)
print(mark === anotherFriend)
print(friend !== anotherFriend)
