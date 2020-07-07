//: [Previous](@previous)


import Foundation

//1_错误的表示
    //错误用遵循 Error 协议的类型的值来表示

enum VendingMachineError: Error {
    case invalidSelection                     //选择无效
    case insufficientFunds(coinsNeeded: Int) //金额不足
    case outOfStock                             //缺货
}

//2_错误抛出
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)


//3_错误处理
    
