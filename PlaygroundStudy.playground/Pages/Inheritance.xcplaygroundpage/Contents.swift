//상속
//부모 클래스
class Person {
    final var name: String = ""   // final로 선언된 저장 프로퍼티
    var age: Int = 0 {
        willSet {
            print("변수의 값이 \(newValue)로 변경될 예정입니다.(Person)")
        }
        
        didSet {
            print("변수의 값이 \(self.age)로 변경 되었습니다.(Person)")
        }
    }
    
    var born: Int {
        return 2022 - self.age + 1
    }
    
    var greet: String {     // 연산 프로퍼티(읽기 전용)
        get {
            return "나의 이름은 \(name)이고, 나이는 \(age)입니다. 반갑습니다!"
        }
    }
    
    func today() -> Void {     // 메서드
        print("오늘도 힘찬 하루를 보냅니다!")
    }
    
    class func goal() -> String {   //재정의가 가능한 타입 메서드
        return "목표를 달성하기 위하여 노력합니다."
    }
}

//상속 받은 자식 클래스
class Student: Person {
    var major: String = ""  //새로운 프로퍼티
    
    override var age: Int {     //프로퍼티 감시자 재정의
        didSet {
            print("변수의 값이 \(self.age)(으)로 변경 되었습니다.(Student)")
        }
    }
    
    override var born: Int {
        get {
            return 2022 - self.age + 1
        }
        
        set {
            self.age = 2022 - newValue + 1
        }
    }
    
    override var greet: String {    //연산 프로퍼티 재정의
        get {
            return "나의 이름은 \(name)이고, \(major)를 공부하고 있습니다. 반갑습니다!"
        }
    }
    
    func study() -> Void {
        print("열심히 공부합니다.")
    }
    
    override func today() -> Void {     //부모 클래스의 today 메서드 재정의
        super.today()   //부모 클래스를 호출하는 super 키워드
        print("오늘은 프로젝트 발표가 있는 날입니다.")
    }
    
    override class func goal() -> String {  //타입 메서드 재정의
        return "좋은 성적을 받기 위하여 항상 노력합니다."
    }
}

let personLee: Person = Person()
personLee.name = "이철수"
personLee.age = 50      //나이가 50로 변경될 예정입니다.(Person)
                        //나이가 50로 변경 되었습니다.(Person)
print(personLee.greet)  //나의 이름은 이철수이고, 나이는 50입니다. 반갑습니다!
personLee.today()       //오늘도 힘찬 하루를 보냅니다!
print(Person.goal())    //목표를 달성하기 위하여 노력합니다.
print(personLee.born)   //1973

let personKim: Student = Student()
personKim.name = "김영희"
personKim.major = "Computer Science"
print(personKim.greet)  //나의 이름은 김영희이고, 나이는 20입니다. 반갑습니다!
personKim.today()       //오늘도 힘찬 하루를 보냅니다!
                        //오늘은 프로젝트 발표가 있는 날입니다.
personKim.study()       //열심히 공부합니다.
print(Student.goal())   //좋은 성적을 받기 위하여 항상 노력합니다.
personKim.born = 2003   //나이가 20로 변경될 예정입니다.(Person)
                        //나이가 20로 변경 되었습니다.(Person)
                        //나이가 20(으)로 변경 되었습니다.(Student)
print(personKim.age)    //20

//서브스크립트 재정의
class Customer {
    var guest: [Person] = [Person]()
    
    subscript(num: Int) -> Person {
        print("일반 고객입니다.")
        return guest[num]
    }
}

class VIPCustomer: Customer {
    var VIPguest: [Person] = [Person]()
    
    override subscript(index: Int) -> Person {
        print("VIP 고객입니다.")
        return VIPguest[index]
    }
}

let customerInfo: Customer = Customer()
customerInfo.guest.append(Person())
customerInfo[0] //일반 고객입니다.

let VIPInfo: VIPCustomer = VIPCustomer()
VIPInfo.VIPguest.append(Person())
VIPInfo[0]  //VIP 고객입니다.
