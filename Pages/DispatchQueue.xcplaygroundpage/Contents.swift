import UIKit
import PlaygroundSupport


var counter = 1

DispatchQueue.main.async {
    for i in 0...3 {
        counter = i
        print("\(counter)")
    }
}

for i in 4...9 {
    counter = i
    print(counter)
}

DispatchQueue.main.async {
    counter = 9
    print(counter)
    
}


