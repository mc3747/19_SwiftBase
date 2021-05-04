//: [Previous](@previous)

import Foundation

//1_函数的定义
    //关键字 + 函数名 + 形参 + 返回值
func greet(person: String) -> String {
    return "Hello again, " + person + "!"
}

//2_函数的调用
    //函数名 + 形参 + 实参
print(greet(person: "Anna"))


//3_无参数,多参数,不定参数,参数标签,忽略参数标签,默认参数,输入输出参数(默认是常量)
//有参数
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())
//多参数
func greet1(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloWorld()
    } else {
        return greet(person: person)
    }
}
print(greet1(person: "Tim", alreadyGreeted: true))
//不定参数,类型后边加...
    //返回平均数
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

//参数标签:函数的参数标签和参数名称
    //参数标签在调用函数的时候使用
    //参数名称在函数的实现中使用
    //默认情况下，函数参数使用参数名称来作为它们的参数标签
func demo3(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(demo3(person: "Bill", from: "Cupertino"))

//忽略参数标签:使用下划线_
func demo4(_ firstParameterName: Int, secondParameterName: Int) {
     // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    print(firstParameterName + secondParameterName)
}
demo4(1, secondParameterName: 2)

//默认参数值
func demo5(_ firstParameterName: Int = 15, secondParameterName: Int) {
     // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    print(firstParameterName + secondParameterName)
}
demo5(secondParameterName: 2)

//输入输出参数
    //形参默认为常量,如果想改动,参数前加inout
    //输入输出参数不能有默认值，
    //而且可变参数不能用 inout 标记
    //传入的参数前都加了 & 的前缀
func demo6(a: inout Int) -> Int{
    a = 9
    return a + 5
}
var m = 7
print(demo6(a:&m))
print(m)

//4_无返回值,多返回值,可选返回,隐式返回
//无返回值
func greet2(person: String) {
    print("Hello, \(person)!")
}
greet2(person: "Dave")
//多返回值
func minMax1(array: [Int]) -> (min: Int, max: Int) {
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
let bounds = minMax1(array: [8, -6, 2, 109, 3, 71])
print("最大值是\(bounds.max) and 最小值是 \(bounds.min)")
//可选返回,返回值加?
    //可选元组类型如 (Int, Int)? 与元组包含可选类型如 (Int?, Int?) 是不同的。可选的元组类型，整个元组是可选的，而不只是元组中的每个元素值
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
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
if let bounds2 = minMax2(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds2.min) and max is \(bounds2.max)")
}

//隐式返回
    //省略return:任何一个可以被写成一行 return 语句的函数都可以忽略 return
func demo1(content:String)->String{
    return content + "!"
}
func demo2(content:String)->String{
     content + "!!!!"
}
demo1(content: "我们")
demo2(content: "我们")

//5_函数类型
    //函数的类型由函数的参数类型和返回类型组成
    //求和函数addTwoInts和求积函数multiplyTwoInts的函数类型相同
    //
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
print("求和: \(mathFunction(2, 3))")
mathFunction = multiplyTwoInts
print("求积: \(mathFunction(2, 3))")

//6_函数类型作为返回值
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
//函数作为返回值 + 1
var currentValue = 3
var moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print(moveNearerToZero(5))
//函数作为返回值 - 1
currentValue = -3
moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print(moveNearerToZero(5))

//7_嵌套函数
    //嵌套函数是对外界不可见的，但是可以被它们的外围函数（enclosing function）调用。
    //一个外围函数也可以返回它的某一个嵌套函数，使得这个函数可以在其他域中被使用
func chooseStepFunction1(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue1 = -4
let moveNearerToZero1 = chooseStepFunction1(backward: currentValue > 0)

while currentValue1 != 0 {
    print("\(currentValue1)... ")
    currentValue1 = moveNearerToZero1(currentValue1)
}
print("zero!")

