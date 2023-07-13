//GCD with concurrency programming

import Foundation

DispatchQueue.main.async {
    for _ in 0..<10 {
        print("🐱")
    }
}

DispatchQueue.main.async {
    for _ in 0..<5 {
        print("🐶")
    }
}

//🐱
//🐱
//🐱
//🐱
//🐱
//🐱
//🐱
//🐱
//🐱
//🐱
//🐶
//🐶
//🐶
//🐶
//🐶

DispatchQueue.global().async {
    for _ in 0..<10 {
        print("🐷")
    }
}

DispatchQueue.global().async {
    for _ in 0..<5 {
        print("🐻")
    }
}

//🐻
//🐷
//🐷
//🐻
//🐷
//🐷
//🐷
//🐻
//🐷
//🐻
//🐷
//🐻
//🐷
//🐷
//🐷

DispatchQueue.global().sync {
    for _ in 0..<5 {
        print("🐼")
    }
}

DispatchQueue.global().async {
    for _ in 0..<5 {
        print("🐮")
    }
}

//🐼
//🐼
//🐼
//🐼
//🐼
//🐮
//🐮
//🐮
//🐮
//🐮
