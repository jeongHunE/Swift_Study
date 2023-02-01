//Generic
//Generic function
func swapValues<T>(_ a: inout T, _ b: inout T) {    //T: placeholder
    let tmp: T = a
    a = b
    b = tmp
}

var num1: Int = 3
var num2: Int = 10
swapValues(&num1, &num2)   //type of T is Int
print(num1, num2)    //10 3

var str1: String = "A"
var str2: String = "B"
swapValues(&str1, &str2)    //type of T is String
print(str1, str2)    //B A

//Generic Type
struct Queue<Element: Hashable> {    //type of Element must conform to the Hashable protocol
    var items: [Element] = []
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeFirst()
    }
}

var intQueue: Queue<Int> = Queue<Int>()

intQueue.push(1)
intQueue.push(2)
print(intQueue.items)    //[1, 2]
intQueue.pop()
print(intQueue.items)    //[2]

var strQueue: Queue<String> = Queue<String>()

strQueue.push("A")
strQueue.push("B")
print(strQueue.items)    //["A", "B"]
strQueue.pop()
print(strQueue.items)    //["B"]

/*var anyQueue: Queue<Any> = Queue<Any>()    Any Type does not conform to the Hashable protocol

anyQueue.push(1)
anyQueue.push("A")
print(anyQueue.items)    //[1, "A"]
anyQueue.pop()
print(anyQueue.items)    //["A"]*/

//Generic Type extension
extension Queue {    //do not have to express placeholder
    func dump() {
        for i in 0..<items.count {
            print(items[i])
        }
    }
}

//Associated Type
protocol SomeProtocol {
    associatedtype someType    //associated type
    var count: Int { get }
    mutating func push(_ item: someType)
    mutating func pop() -> someType
    subscript(i: Int) -> someType { get }
}

class AssociatedType_Queue: SomeProtocol {    //associated type is Integer
    typealias someType = Int    //passing the Integer type to the placeholder
    
    var items: [Int] = [Int]()
    var count: Int {
        return items.count
    }
    
    func push(_ item: someType) {
        items.append(item)
    }
    
    func pop() -> Int {
        return items.removeFirst()
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//associated type with generic
struct Generic_Queue<Element>: SomeProtocol {
    //associateed type is Element type
    var items: [Element] = [Element]()
    
    var count: Int {
        return items.count
    }
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeFirst()
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

//subscript Generic
extension Generic_Queue {
    subscript<Seq: Sequence>(indices: Seq) -> [Element] where Seq.Iterator.Element == Int {
        //Seq type must conform the Sequence protocol and it's Iterator Element type is a Integer
        var sliced: [Element] = [Element]()
        for index in indices {
            sliced.append(self[index])
        }
        
        return sliced
    }
}
