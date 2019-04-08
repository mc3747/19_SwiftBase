//: Playground - noun: a place where people can play

import UIKit

//1,函数的定义和调用：func funcname(形参) -> returntype
    // 1⃣️，带参数
        func runoob(name: String, site: String) -> String {
            return name + site
        }
        print(runoob(name: "菜鸟教程：", site: "www.runoob.com"))
        print(runoob(name: "Google：", site: "www.google.com"))
    // 2⃣️，不带参数
        func sitename() -> String {
            return "菜鸟教程"
        }
        print(sitename())

//2,函数参数：
    // 1⃣️，局部参数
        func sample(number: Int) {
            print(number)
        }
        sample(number: 1)
        sample(number: 2)
        sample(number: 3)
    // 2⃣️，多个参数（求a的立方）
        func pow(firstArg a: Int, secondArg b: Int) -> Int {
            var res = a
            for _ in 1..<b {
                res = res * a
            }
            print(res)
            return res
        }
        pow(firstArg:5, secondArg:3)
    // 3⃣️，可变参数：参数的数量不固定
        func vari<N>(members: N...){
            for i in members {
                print(i)
            }
        }
        vari(members: 4,3,5)
        vari(members: 4.5, 3.1, 5.6)
        vari(members: "Google", "Baidu", "Runoob")
    // 4⃣️，可变参数：参数的值不固定：可以在参数定义前加 inout 关键字，这样就可以改变这个参数的值了
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            let temporaryA = a
            a = b
            b = temporaryA
        }


        var x = 1
        var y = 5
        swapTwoInts(&x, &y)
        print("x 现在的值 \(x), y 现在的值 \(y)")
//3,函数返回值：
    // 1⃣️，无返回值
        func runoob(site: String) {
            print("菜鸟教程官网：\(site)")
        }
        runoob(site: "http://www.runoob.com")
    // 2⃣️，一个返回值：见上边函数的定义和调用

    // 3⃣️，多个返回值:元组概念很重要
        /*
         函数返回值类型可以是字符串，整型，浮点型等。
         元组与数组类似，不同的是，元组中的元素可以是任意类型，使用的是圆括号。
         你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回。
         下面的这个例子中，定义了一个名为minMax(_:)的函数，作用是在一个Int数组中找出最小值与最大值。
        */
        func minMax(array: [Int]) -> (min: Int, max: Int)? {
            if array.isEmpty { return nil }
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count] {
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
        if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
            print("最小值为 \(bounds.min)，组大值为 \(bounds.max)")
        }

//4,函数类型：在 Swift 中，使用函数类型就像使用其他类型一样。例如，你可以定义一个类型为函数的常量或变量，并将适当的函数赋值给它：
        // 1⃣️，函数类型作为返回值

        func sum(a: Int, b: Int) -> Int {
            return a + b
        }
        var addition: (Int, Int) -> Int = sum
        print("输出结果: \(addition(40, 89))")

        // 2⃣️，函数类型作为参数
        func sum1(a: Int, b: Int) -> Int {
            return a + b
        }
        var addition1: (Int, Int) -> Int = sum1
        print("输出结果: \(addition1(40, 89))")

        func another(addition1: (Int, Int) -> Int, a: Int, b: Int) {
            print("输出结果: \(addition1(a, b))")
        }
        another(addition1: sum1, a: 10, b: 20)






