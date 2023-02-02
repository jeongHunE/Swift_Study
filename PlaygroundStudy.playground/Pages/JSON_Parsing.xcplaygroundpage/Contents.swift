import Foundation

struct Person: Codable {    //encoding과 decoding에 사용되는 타입은 반드시 Codable 프로토콜 채택
    var name: String
    var age: Int
    var mail: String
    var address: String
}

func jsonEncoder(_ data: Codable) -> String? {
    var encoder = JSONEncoder()
    
    do {
        let jsonData = try encoder.encode(data)
        return String(data: jsonData, encoding: .utf8)    //String 타입으로 인코딩
    } catch {
        print("encoding error")
    }
    
    return nil
}

func jsonDecoder(_ data: String) -> Person? {
    var decoder = JSONDecoder()
    guard let jsonData = data.data(using: .utf8) else { return nil }    //String 타입을 다시 Data 타입으로 디코딩
    
    do {
        let decoded: Person = try decoder.decode(Person.self, from: jsonData)
        return decoded
    } catch {
        print("decoding error")
    }
    
    return nil
}

//sample data
let personKim: Person = Person(name: "김철수", age: 99, mail: "kim@mail.com", address: "서울특별시 종로구")
let personLee: Person = Person(name: "이영희", age: 20, mail: "lee@mail.com", address: "부산광역시 연제구")

print(jsonEncoder(personKim)!)

let JSONData = jsonEncoder(personLee)!
let decoded = jsonDecoder(JSONData)
print(decoded!.name)
