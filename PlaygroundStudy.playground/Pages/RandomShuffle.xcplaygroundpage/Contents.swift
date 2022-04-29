var array: [Int] = [1, 2, 3, 4, 5]
var set: Set<Int> = [1, 2, 3, 4, 5]
var dictionary: [String: Int] = ["korea": 82, "USA": 1, "japan": 81]
var string: String = "swift"

//randomElement(): 컬렉션의 임의의 요소를 추출
//shuffle(): 컬렉션 자체를 무작위 섞음
//shuffled(): 기존 컬렉션은 그대로 둔 채 새로운 컬렉션을 무작위 섞음

print(array.randomElement())
print(array.shuffled()) //기존은 배열은 그대로
print(array)

array.shuffle()
print(array)    //기존의 배열 자체를 섞음

print(set.shuffled())   //세트를 섞어서 배열로 반환
//세트는 순서가 없기에 세트 자체를 섞는것은 불가능
print(string.shuffled())
