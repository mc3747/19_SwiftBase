//
//  ErrorHandleVC.swift
//  SwiftProject-Demo
//
//  Created by kk on 2021/2/7.
//  Copyright © 2021 马成. All rights reserved.
//

import Foundation
@objc (ErrorHandleVC)
/*
 在Swift语言中使用Error表示异常， 作用同Java的Exception类或Object-C的NSError类。
 */
class ErrorHandleVC: CommonViewController {
//1,定义异常
    enum SomeError : Error {
        case illegalArg(String)
        case outOfBounds(Int, Int)
        case outOfMemory
    }
//2，抛出异常
    func divide(_ num1: Int, _ num2: Int) throws -> Int {
        //使用断言
        assert(num2 != 0, "除数不能为 0")
        //使用fatalError强制结束程序
//        fatalError("num2 不能小于 0")
        //抛异常
        if num2 == 0 {
            throw SomeError.illegalArg("0不能作为除数")
        }
        
        //defer结束
        defer {
            print("使用异常结束")
        }
        return num1 / num2
    }
//3，捕捉异常
    //1,使用do-catch捕捉Error
    func getError1(){
        do {
            try divide(20, 0)
        } catch let error {
            switch error {
                case let SomeError.illegalArg(msg): print("参数错误:", msg)
            default: print("其他错误")
            }
        }
    }
    //2,使用try？转成可选类型
    func getError2(){
        var result1 = try? divide(20, 10) // Optional(2), Int?
          var result2 = try? divide(20, 0) // nil
         
    }
    //3,用 throwing 函数传递错误，如上面divide示例的throws关键字
    func getError3(){
        
    }
    //4，禁用错误传递
    func getError4(){
        var result3 = try! divide(20, 10) // 2, Int
    }
    //断言

    // Assertion failed: 除数不能为 0: file
    override func viewDidLoad() {
        super.viewDidLoad()
        getError1()
    }
}
