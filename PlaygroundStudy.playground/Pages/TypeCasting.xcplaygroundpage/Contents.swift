//타입캐스팅 (TypeCasting)
class Music {
    let name: String
    
    var play: String {
        return "\(name)(이)가 재생중입니다."
    }
    
    init(name: String) {
        self.name = name
    }
}

class Classic: Music {
    let instrument: String
    
    override var play: String {
        return "\(instrument)로 \(name)을 연주중 입니다."
    }
    
    init(name: String, instrument: String) {
        self.instrument = instrument
        super.init(name: name)
    }
    
}

class Pop: Music {
    let singer: String
    
    override var play: String {
        return "\(singer)가 \(name)을 노래중 입니다."
    }
    
    init(name: String, singer: String) {
        self.singer = singer
        super.init(name: name)
    }
}

let music: Music = Music(name: "한국 노래")
let myClassic: Classic = Classic(name: "체르니", instrument: "피아노")
let yourPop: Pop = Pop(name: "강남 스타일", singer: "psy")

print(music.play)
print(myClassic.play)
print(yourPop.play)

//타입 확인
print(music is Music)       //true
print(myClassic is Music)   //true
print(yourPop is Music)     //true

print(music is Classic)     //false
print(myClassic is Classic) //true
print(yourPop is Classic)   //false


print(music is Pop)     //false
print(myClassic is Pop) //false
print(yourPop is Pop)   //true

//다운캐스팅
if let test: Classic = music as? Classic {
    print("Classic 타입으로 캐스팅 가능합니다.")
}
else {
    print("Classic 타입으로 캐스팅 불가능합니다.")
}

if let test: Classic = myClassic as? Classic {
    print("Classic 타입으로 캐스팅 가능합니다.")
}
else {
    print("Classic 타입으로 캐스팅 불가능합니다.")
}

if let test: Classic = yourPop as? Classic {
    print("Classic 타입으로 캐스팅 가능합니다.")
}
else {
    print("Classic 타입으로 캐스팅 불가능합니다.")
}

//강제 타입캐스팅
let test: Music = music as! Music

//AnyObject 타입캐스팅
func typecastingOfAnyObject(object: AnyObject) -> Void {
    if let test: Pop = object as? Pop {
        print("Pop 음악입니다.")
    } else if let test: Classic = object as? Classic {
        print("Classic 음악입니다.")
    } else if let test: Music = object as? Music {
        print("음악입니다.")
    } else {
        print("알 수 없는 음악입니다.")
    }
}

typecastingOfAnyObject(object: music)
typecastingOfAnyObject(object: myClassic)
typecastingOfAnyObject(object: yourPop)

//Any 타입캐스팅
func checkAny(of object: Any) -> Void {
    if let test: Music = object as? Music {
        print("음악 입니다.")
    } else if let number: Int = object as? Int {
        print(number)
    } else if let string: String = object as? String {
        print("\(string)")
    } else if let stringToString: (String) -> String = object as? (String) -> String {
        print(stringToString("Hello"))
    } else {
        print("Unkown type")
    }
}

checkAny(of: myClassic)
checkAny(of: 123)
checkAny(of: "안녕하세요!")
checkAny(of: { (greet: String) -> String in "\(greet)! nice to meet you"})
