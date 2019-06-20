//: Playground - noun: a place where people can play

import UIKit
//import Cocoa

var str = "Hello, playground"

// 1,语句不用分号；字符串不用加@
print("hello")

// 2,运算符两侧的空格要对称；不对称也要两侧都有一个空格以上
let a =  1+2


// 3,打印输出：带连接符号和结束符号
print(23,"women", separator:"-")

print(21,24, separator: "++", terminator: "end")

// 4，常量：在字符串中可以使用括号与反斜线来插入常量

3

3.14

true

"C"

"char"

let name = "菜鸟教程"
let site = "http://www.runoob.com"
print("\(name)的官网地址为：\(site)")

// 5,自定义类型（swift的Int与c语言的int容易混淆）
typealias selfDefineType = Int
var distance:selfDefineType = 300
print(distance)

// 6,变量的定义
var distance1:Float

var distance2 = 3.1454

// 6,变量的可选类型,以下两种等效（可能为该类型，也可能为nil）;访问可以用加！来访问，如果为nil，就会报警
var optionalInteger1: Int?
var optionalInteger2: Optional<Int>
var optionalInteger3:Int

optionalInteger1 = 42
optionalInteger2 = nil

print(optionalInteger1!)
//print(optionalInteger2!)


// 7,强制解析：当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值
var myString1:String?
myString1 = "Hello, Swift!"
print(myString1)

var myString2:String?
myString2 = "Hello, Swift!"
print(myString2!)


// 8,可选绑定：可以用在if和while语句中来对可选类型的值进行判断并把值赋给一个常量或者变量
var myString:String?
myString = "Hello, Swift!"

if let yourString = myString {
    print("你的字符串值为 - \(yourString)")
}else{
    print("你的字符串没有值")
}


