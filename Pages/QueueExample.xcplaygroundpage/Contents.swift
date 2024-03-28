//: [Previous](@previous)

import Foundation

var accountBalance = 5000
let lock = NSLock()

struct Bank {
    let withdrawMethod: String
    
    func doTransaction(amount: Int) {
        lock.lock()
        
        
        if accountBalance < amount {
            debugPrint("Insufficient method cant withdraw amount \(amount) by \(self.withdrawMethod)")
        } else {
            debugPrint("Processing Transaction")
            Thread.sleep(forTimeInterval: Double.random(in: 0...4))
            accountBalance -= amount
            
            debugPrint("Transaction successfull balance left: \(accountBalance)")
        }
        
        lock.unlock()
    }
}

let queue = DispatchQueue(label: "WithdrawQueue", attributes: .concurrent)

queue.async {
    let bank = Bank(withdrawMethod: "netbanking")
    bank.doTransaction(amount: 2000)
}

queue.async {
    let bank = Bank(withdrawMethod: "atm")
    bank.doTransaction(amount: 8000)
}

queue.async {
    let bank = Bank(withdrawMethod: "atm")
    bank.doTransaction(amount: 2000)
}

//: [Next](@next)
