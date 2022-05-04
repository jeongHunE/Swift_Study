//if문

let countryCode: Int = 82
var country: String = String()

if countryCode == 1 {   //소괄호는 선택사항
    country = "USA"
} else if countryCode == 81 {
    country = "Japan"
} else if countryCode == 82 {
    country = "Korea"
} else if countryCode == 86 {
    country = "Chaina"
} else {
    country = "데이터에 없는 국가 코드 입니다."
}

print(country)

//switch-case문
let point:Int = 65

switch point {
case 90...:
    print("VVIP 등급 고객입니다.")     //break문 없이도 switch문 종료 가능
case 80..<90:
    print("Vip 등급 고객입니다.")
    break
case 70..<80:
    print("Gold 등급 고객입니다.")
    break
case 60..<70:
    print("Sliver 등급 고객입니다.")
    fallthrough     //다음 case도 실행
default:
    print("일반 등급 고객입니다.")
}

//tuple형 switch-case문
typealias languageRelease = (name: String, releaseYear: Int)

let tupleValue: languageRelease = ("Swift", 2014)

switch tupleValue {
case ("Swift", 2014):
    print("출시년도가 정확합니다.")
default:
    print("정확하지 않습닌다.")
}

//열거형을 사용한 switch-case문
enum grade {
    case Freshman, Sophomore, Junior, Senior
}

let yourGrade: grade = .Sophomore

switch yourGrade {
case .Freshman:
    print("1학년입니다.")
case .Sophomore:
    print("2학년입니다.")
case .Junior:
    print("3학년입니다.")
case .Senior:
    print("4학년입니다.")
@unknown case _:    //unknown 속성으로 열거형에 case 추가시 논리적 오류 방지
    print("몇학년인지 알 수 없습니다.")
}
