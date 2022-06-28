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
