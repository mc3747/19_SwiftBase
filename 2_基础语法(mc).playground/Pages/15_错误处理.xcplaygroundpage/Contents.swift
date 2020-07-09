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
    //Swift 中的错误处理并不涉及解除调用栈，这是一个计算代价高昂的过程
    //throw 语句的性能特性是可以和 return 语句相媲美的
//3.1_用 throwing 函数传递错误
    
