class Country {
    var name: String
    var population: Int?
    
    //지정 이니셜라이저
    init(name: String, population: Int?) {
        self.name = name
        self.population = population
    }
    
    //편의 이니셜라이저
    convenience init(name: String) {
        self.init(name: name, population: nil)
    }
    
    init() {
        self.name = "Unkown"
        self.population = nil
    }
}

class Korea: Country {
    var greet: String
    
    //지정 이니셜라이저
    override init(name: String, population: Int?) {
        self.greet = "안녕하세요!"    //super 클래스의 이니셜라이저를 호출하기 전에 자신 클래스가 가지는 프로퍼티를 초기화
        super.init(name: name, population: population)    //지정 이니셜라이저는 super 클래스의 지정 이니셜라이저를 호출
    }
    
    //요구 편의 이니셜라이저
    required convenience init(name: String) {
        self.init(name: name, population: 50000000)    //편의 이니셜라이저는 해당 클래스의 지정 이니셜라이저를 반드시 호출
    }
    
    //재정의한 이니셜라이저를 요구 이니셜라이저로 구현
    required override init() {
        self.greet = ""
        super.init()
    }
}

class Seoul: Korea {
    var landmark: String
    
    //요구 이니셜라이저 구현
    required init() {
        self.landmark = "경복궁"
        super.init(name: "서울", population: 10000000)
    }
    
    //요구 편의 이니셜라이저 구현
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

let country: Country = Country(name: "대한민국")
print(country.name)    //대한민국
print(country.population)    //nil

let rok: Korea = Korea(name: "대한민국")
print(rok.name)    //대한민국
print(rok.greet)    //안녕하세요!
print(rok.population!)    //50000000

let seoul: Seoul = Seoul()
print(seoul.name)    //서울
print(seoul.population!)    //10000000
print(seoul.greet)    //안녕하세요!
print(seoul.landmark)    //경복궁
