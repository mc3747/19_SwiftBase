//: [Previous](@previous)

import Foundation
//1_闭包
        //也叫回调函数
        //闭包是自包含的函数代码块
        //闭包的应用场景:
            //全局函数是一个有名字但不会捕获任何值的闭包
            //嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包
            //闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包
//2_闭包表达式
/*
 2.1_语法
    { (parameters) -> return type in
     statements
    }
    //大括号
    //小括号参数
    //返回值 ->
    //in 后跟函数体
 注意:
    闭包调用不用写参数名称
 
    
    
 */
let demo1 = {
    print("学习iOS")
}
demo1();
let demo2 = {
    (language:String) in
    print("学习\(language)")
}
demo2("swift");
let demo3 = {
    (language:String) -> String in
    "学习\(language)"
}
let a = demo3("swift");

//2.1_展示示例
//使用函数的形式
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames1 = names.sorted(by: backward)
//使用闭包表达式
var reversedNames2 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

//2.2_根据上下文推断类型
    //推断出闭包的类型:(String, String) -> Bool 类型的函数
var reversedNames3 = names.sorted(by: { s1, s2 in return s1 > s2 } )

//2.3_单表达式闭包的隐式返回
    //单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果
var reversedNames4 = names.sorted(by: { s1, s2 in s1 > s2 } )

//2.4_参数名称的缩写
    //可以直接通过 $0，$1，$2 来顺序调用闭包的参数
var reversedNames5 = names.sorted(by: { $0 > $1 } )

//2.5_运算符方法
var reversedNames6 = names.sorted(by: >)

//2.6_尾随闭包
    //尾随闭包是一个书写在函数圆括号之后的闭包表达式，函数支持将其作为最后一个参数调用
    //长的闭包表达式作为最后一个参数传递给函数，将这个闭包替换成为尾随闭包的形式很有用
var reversedNames7 = names.sorted() { $0 > $1 }
    //如果闭包表达式是函数或方法的唯一参数,可以把 () 省略掉
var reversedNames8 = names.sorted { $0 > $1 }

//2.7_逃逸闭包
    //当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行
    //在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的
    //传递到 someFunctionWithEscapingClosure(_:) 中的闭包是一个逃逸闭包，这意味着它需要显式地引用 self
    //传递到 someFunctionWithNonescapingClosure(_:) 中的闭包是一个非逃逸闭包，这意味着它可以隐式引用 self
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

//2.8_自动闭包
    //自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式
    //这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值
    var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    print(customersInLine.count)
    // 打印出“5”

    let customerProvider = { customersInLine.remove(at: 0) }
    print(customersInLine.count)
    // 打印出“5”

    print(customersInLine.count)
    // 打印出“4”


print(reversedNames1,reversedNames2,reversedNames3,reversedNames4,reversedNames5,reversedNames6,reversedNames7,reversedNames8)
