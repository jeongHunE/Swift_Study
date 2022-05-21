//인스턴스 메서드
class CalculateClass {
    var result: Int = 0 {
        didSet {
            print("result: \(result)")
        }
    }
    //메서드
    func add(_ a: Int, _ b: Int) {
        result = a + b
    }
    func sub(_ a: Int, _ b: Int) {
        result = a - b
    }
    func mul(_ a: Int, _ b: Int) {
        result = a * b
    }
    func div(_ a: Int, _ b: Int) {
        if b == 0 {
            print("0으로 나눌 수 없습니다.")
        }
        else {
            result = a / b
        }
    }
}

var calculator1: CalculateClass = CalculateClass()
calculator1.add(5, 2)
calculator1.sub(5, 2)
calculator1.mul(5, 2)
calculator1.div(5, 2)
print()

//구조체에서의 인스턴스 메서드
struct CalculateStruct {
    var result: Int = 0 {
        didSet {
            print("result: \(result)")
        }
    }
    //메서드
    mutating func add(_ a: Int, _ b: Int) {
        result = a + b
    }
    mutating func sub(_ a: Int, _ b: Int) {
        result = a - b
    }
    mutating func mul(_ a: Int, _ b: Int) {
        result = a * b
    }
    mutating func div(_ a: Int, _ b: Int) {
        if b == 0 {
            print("0으로 나눌 수 없습니다.")
        }
        else {
            result = a / b
        }
    }
}

var calculator2: CalculateStruct = CalculateStruct()
calculator2.add(5, 2)
calculator2.sub(5, 2)
calculator2.mul(5, 2)
calculator2.div(5, 2)

//타입 메서드
class AClass {
    static func staticTypeMethod() {    //static 타입 메서드
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {      //class 타입 메서드
        print("AClass classTypeMethod")
    }
}

class BClass: AClass {  //상속
    //class 타입 메서드 재정의
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}

AClass.staticTypeMethod()
AClass.classTypeMethod()
BClass.classTypeMethod()

//self 프로퍼티
struct PhotoSize {
    static var size: Int = 100
    
    static func zoomIn() {
        self.size =  200    //self -> PhotoSize
    }
}

class Photo {
    var originalSize: Int = 100
    
    func enlarge() {
        PhotoSize.zoomIn()
    }
    
    func reset() {
        PhotoSize.size = self.originalSize    //self -> 인스턴스
    }
}

let myPhoto: Photo = Photo()
myPhoto.enlarge()
print(PhotoSize.size)
myPhoto.reset()
print(PhotoSize.size)



