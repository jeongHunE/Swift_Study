//서브스크립트(subscript)
struct Student {
    var name: String    //학생 이름을 저장할 변수
}

class School {
    var number: Int = 0
    var students: [Int: Student] = [Int: Student]()   //학생의 정보를 저장할 딕셔너리[번호: 학생]
    
    func addStudent(student: Student) {
        students[number] = student
        number += 1
    }
    
    func addStudents(students: Student...) {
        for student in students {
            self.addStudent(student: student)
        }
    }
    
    //첫번째 서브스크립트
    subscript(key: Int) -> Student? {   //key값에 해당하는 value를 반환
        get {
            if key < self.number {
                return students[key]
            }
            return nil
        }
        
        //새로운 학생 추가
        set {
            //newValue의 타입은 subscript의 반환 값과 일치
            guard var newStudent: Student = newValue else {
                return
            }
            
            var number = key
            
            if number > self.number {
                number = self.number
                self.number += 1
            }
            
            students[number] = newStudent
        }
    }
    
    //두번째 서브스크립트(읽기 전용)
    subscript(name: String) -> Int? {   //name에 해당하는 인스턴스의 key값 반환
        get {
            return self.students.filter { $0.1.name == name }.first?.key
        }
    }
    
    //세번째 서브스크립트(읽기 전용)
    subscript(key: Int, name: String) -> Student? { //key값과 name값에 해당하는 Student 인스턴스 반환
        return self.students.filter { $0.0 == key && $0.1.name == name }.first?.value
    }
    
}

let highSchool: School = School()

var studentLee: Student = Student(name: "이철수")
var studentKim: Student = Student(name: "김영희")
var studentSon: Student = Student(name: "손민준")
var studentPark: Student = Student(name: "박현우")
var studentHong: Student = Student(name: "홍수민")

highSchool.addStudents(students: studentLee, studentKim, studentSon, studentPark)

let aStudent: Student? = highSchool[1]  //첫번째 서브스크립트 사용
print(aStudent)

highSchool[8] = studentHong     //첫번째 서브스크립트의 set 메서드 사용

print(highSchool["홍수민"])        //두번째 서브스크립트 사용
print(highSchool["이철수"])        //두번째 서브스크립트 사용
print(highSchool[1, "김영희"])     //세번째 서브스크립트 사용

//타입 서브스크립트
enum BaekjoonTier: Int {
    case bronze = 1
    case silver, gold
    
    static subscript(tier: Int) -> BaekjoonTier? {  //타입 서브스크립트
        return Self(rawValue: tier) //원시 값에 해당하는 항목 반환
    }
}

let myTier: BaekjoonTier? = BaekjoonTier[2]
print(myTier)
