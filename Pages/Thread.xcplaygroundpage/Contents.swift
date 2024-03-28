//: [Previous](@previous)

import Foundation

class CustomThread {
    
    var thread: Thread?
    
    func createThread() {
        thread = Thread(target: self, selector: #selector(startThread), object: nil)
        thread?.start()
    }
    
    @objc private func startThread() {
        print("Thread started")
        thread?.cancel()
        print("Thread execution cancelled")
    }
}

let customThread = CustomThread()
customThread.createThread()

//: [Next](@next)
