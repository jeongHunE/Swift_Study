//기존 GCD 방식의 비동기 처리
import Foundation

func addNumWithGCD(completion: @escaping (Int) -> ()) {
    DispatchQueue.global().async {
        var result: Int = 0
        
        for i in 1...10 {
            result += i
        }
        
        completion(result)
    }
}

func callGCDFunction() {
    addNumWithGCD(completion: { result in
        print(result)
    })
}

callGCDFunction()    //55

//async + await
func addNumWithAsync() async -> Int {
    var result: Int = 0
    
    for i in 1...10 {
        result += i
    }
    
    return result
}

func callAsyncFunction() async {
    let result = await addNumWithAsync()
    
    print(result)
}

Task {
    await callAsyncFunction()    //55
    print("Hello World!")    //Hello World!
}
