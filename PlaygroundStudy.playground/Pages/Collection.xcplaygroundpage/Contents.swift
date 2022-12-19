//Array
var programming: Array<String> = ["jeunghun", "Python", "Java", "Swift"]
//var names: [String] = ["jeunghun", "Python", "Java", "Swift"]와 같음

var emptyArray: [Any] = [Any]()    //Any형을 요소로 가지는 빈 배열 생성
//var emptyArray: [Any] = Array<Any>()와 같음
//var emptyArray: [Any] = [] 타입을 정화히 명시한 경우 가능
print(emptyArray.isEmpty)
print(programming.count)

programming[2] = "Kotlin"  //names 배열 2번째 요소값 변경
print(programming[2])

programming.append("C++")  //배열 마지막에 "C++" 추가
programming.append(contentsOf: ["HTML", "Objective-C"])   //배열 마지막에 두 가지 요소 추가
programming.insert("C#", at: 2)
programming.insert(contentsOf: ["CSS", "JavaScript"], at: 3)

print(programming[4])
print(programming.firstIndex(of: "Swift"))   //"Swift"가 나오는 첫번째 위치
print(programming.firstIndex(of: "R language")) //존재하지 않는 요소는 nil 반환
print(programming.first) //첫번째 요소값
print(programming.last)  //마지막 요소값

let firstElement: String = programming.removeFirst()  //배열의 0번째 요소 삭제 후 변수에 저장
let lastElement: String = programming.removeLast()   //배열의 마지막 요소 삭제 후 변수에 저장
let indexElement: String = programming.remove(at: 1) //배열의 1번째 요소 삭제 후 변수에 저장

print(firstElement)
print(lastElement)
print(indexElement)

//slicing
print(programming[...3])    //처음부터 3까지 slicing
print(programming[1...2])    //1부터 2까지 slicing
print(programming[1..<3])    //1이상 3미만까지 slicing

//Dictionary
var dictionary: Dictionary<String, Int> = Dictionary<String, Int>() //빈 Dictionary 선언
    //var dictionary: [String: Int] = [String, Int]()와 같음
    //var dictionary: StringIntDictionary = StringIntDictionary()도 같음
    //Dictioinary의 key와 value를 명시하였다면 다음도 가능 var releaseDay: [String: Int] = [:]

var releaseDay: [String: Int] = ["Java": 1995, "Python": 1991, "Swift": 2014, "Kotlin": 2011]
print(releaseDay)
print(releaseDay.isEmpty)
print(releaseDay.count)

print(releaseDay["Java"])
print(releaseDay["HTML"])   //존재하지 않는 key값은 nil 반환

releaseDay["JavaScript"] = 1995     //새로운 key:value 추가
print(releaseDay["JavaScript"])

print(releaseDay.removeValue(forKey: "Python")) //key를 제거하고 value 반환
print(releaseDay["Python", default: 0])   //key값이 없으면 기본값으로 0을 반환

//Set
var set: Set<String> = Set<String>() // 빈 Set 생성
//var set: Set<String> = [] 위와 같은 표현

var language: Set<String> = ["Swift", "Java", "Python"]  //Set 생성
print(language.isEmpty)
print(language.count)

language.insert("Kotlin")
print(language)

print(language.remove("Java"))
print(language.remove("Objective-C")) //존재 하지 않는 값은 nil 반환

//세트의 활용(집합의 연산)
let englishClassStudent: Set<String> = ["Lee", "Kim", "Park", "Choi"]
let mathClassStudent: Set<String> = ["Lee", "Kim", "Son", "Hwang"]

//교집합
let intersectSet: Set<String> = englishClassStudent.intersection(mathClassStudent)
print(intersectSet)

//교집합의 여집합
let symmetricDiffSet: Set<String> = englishClassStudent.symmetricDifference(mathClassStudent)
print(symmetricDiffSet)

//합집합
let unionSet: Set<String> = englishClassStudent.union(mathClassStudent)
print(unionSet)

//차집합
let subtractSet: Set<String> = englishClassStudent.subtracting(mathClassStudent)
print(subtractSet)

print(symmetricDiffSet.sorted())    //세트 정렬

//randomElement(), shuffled(), shuffle() method
var array: [Int] = [0, 1, 2, 3, 4]
var numberSet: Set<Int> = [0, 1, 2, 3, 4]
var numberDictionary: [String: Int] = ["one": 1, "two": 2, "three": 3]
var string: String = "string"

print(array.randomElement())    //임의의 요소 반환
print(array.shuffled())    //shuffled된 배열 반환(array는 그대로)
array.shuffle()    //array 자체 shuffle
print(array)

print(numberSet.randomElement())    //임의의 요소 반환
print(numberSet.shuffled())    //shuffled된 set Array 타입으로 반환(set은 그대로, set은 순서가 없기때문에 스스로 shuffle 불가능)

print(numberDictionary.randomElement())    //임의의 요소 tuple로 반환
print(numberDictionary.shuffled())    //key: value의 tuple을 요소로 가지는 Array 반환

print(string.shuffled())    //문자의 순서를 shuffle한 Arrray 반환
