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
    
    subscript(key: Int) -> Student? {   //key로 value를 반환하는 서브스크립트
        if key < self.number {
            return students[key]
        }
        return nil
    }
}

let highSchool: School = School()

var studentLee: Student = Student(name: "이철수")
var studentKim: Student = Student(name: "김영희")
var studentSon: Student = Student(name: "손민준")
var studentPark: Student = Student(name: "박현우")

highSchool.addStudents(students: studentLee, studentKim, studentSon, studentPark)

let aStudent: Student? = highSchool[1]
print(aStudent)
