//: [Previous](@previous)

import Foundation

//1_枚举
    //没有默认值
    //该值的类型可以是字符串、字符，或是一个整型值或浮点数
    //枚举类型是一等（first-class）类型。它们采用了很多在传统上只被类（class）所支持的特性

//2_定义
    //方式1
enum CompassPoint {
    case north
    case south
    case east
    case west
}
    //方式2
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//3_使用
    //初始化使用
    var directionToHead = CompassPoint.west
    //推断使用:可以省略枚举
    directionToHead = .east

print(directionToHead)

//4_使用 Switch 语句匹配枚举值
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

//5_枚举成员的遍历
    //令枚举遵循 CaseIterable 协议。Swift 会生成一个 allCases 属性，用于表示一个包含枚举所有成员的集合
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
for beverage in Beverage.allCases {
    print(beverage)
}

//6_枚举的关联值
    //把其他类型的值和成员值一起存储起来会很有用。这额外的信息称为关联值
    //一个成员值是具有 (Int，Int，Int，Int) 类型关联值的 upc，
    //另一个成员值是具有 String 类型关联值的 qrCode
enum Barcode {
        //条形码
    case upc(Int, Int, Int, Int)
        //二维码
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

//7_枚举的原始值
    //原始值是在定义枚举时被预先填充的值
    //关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//8_枚举原始值的隐式赋值
    //当使用整数作为原始值时，隐式赋值的值依次递增 1
    //如果第一个枚举成员没有设置原始值，其原始值将为 0
    //rawValue 属性可以访问该枚举成员的原始值
enum Planet1: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
print(Planet1.earth.rawValue)

//9_使用原始值初始化枚举实例
    //自动获得一个初始化方法，
    //这个方法接收一个叫做 rawValue 的参数，参数类型即为原始值类型
    //返回值则是枚举成员或 nil(在范围内就是枚举值,不在就为nil)
let possiblePlanet = Planet1(rawValue: 17)

//10_递归枚举
    //有一个或多个枚举成员使用该枚举类型的实例作为关联值
    //在枚举成员前加上 indirect 来表示该成员可递归
    //在枚举类型开头加上 indirect 关键字来表明它的所有成员都是可递归的
indirect enum ArithmeticExpression {
    //纯数字
    case number(Int)
    //求和
    case addition(ArithmeticExpression, ArithmeticExpression)
    //求积
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
//该函数如果遇到纯数字，就直接返回该数字的值。如果遇到的是加法或乘法运算，则分别计算左边表达式和右边表达式的值，然后相加或相乘
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))

