//MARK: - where절을 사용한 패턴 매칭
let point: (Int, Int) = (-3, 2)

switch point {
case let (x, y) where x > 0 && y > 0:
    print("(\(x), \(y)): 1사분면")
case let (x, y) where x < 0 && y > 0:
    print("(\(x), \(y)): 2사분면")
case let (x, y) where x < 0 && y < 0:
    print("(\(x), \(y)): 3사분면")
case let (x, y) where x > 0 && y < 0:
    print("(\(x), \(y)): 4사분면")
case (_, _):
    print("(\(point.0), \(point.1)): 선의 경계")
}
//(-3, 2): 2사분면

let heights: [Int?] = [nil, 178, 163, 172, nil, 181, nil]

for case .some(let value) in heights where value > 170 {
    print(value)
}

//178
//172
//181

//MARK: - protocol extension에서 where절
protocol PrintCharacter {
    func printCharacter()
}

extension String: PrintCharacter {}
//extension Int: PrintCharacter {}

extension PrintCharacter where Self: CustomStringConvertible, Self: Collection {
    func printCharacter() {
        for char in description {
            print(char)
        }
    }
}

String("Hello").printCharacter()
//H
//e
//l
//l
//o
//Int(19).printCharacter()

//MARK: - Generic에서 where절
func compareTwoItems<T1, T2>(first: T1, second: T2) where T1: Comparable, T2: Comparable, T1 == T2 {
    if first > second {
        print("\(first)(이)가 \(second)보다 큽니다.")
    } else if first < second {
        print("\(second)(이)가 \(first)보다 큽니다.")
    } else {
        print("두 값이 같습니다.")
    }
}

compareTwoItems(first: 3, second: 5)    //5(이)가 3보다 큽니다.
compareTwoItems(first: "b", second: "a")    //b(이)가 a보다 큽니다.

protocol IntegerStack {
    associatedtype ItemType where ItemType: BinaryInteger
    
    var items: [ItemType] {get}
    mutating func push(item: ItemType) -> Void
    mutating func pop() -> ItemType
    
    subscript(i: Int) -> ItemType {get}
    subscript<Indices: Sequence>(indices: Indices) -> [ItemType] where Indices.Iterator.Element == Int {get}
}
