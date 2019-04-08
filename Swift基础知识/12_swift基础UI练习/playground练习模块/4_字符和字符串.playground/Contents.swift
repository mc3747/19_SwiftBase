//: Playground - noun: a place where people can play

import UIKit

//1,字符：字符变量
    // Swift 的字符是一个单一的字符字符串字面量，数据类型为 Character。
    // Swift 中以下赋值会报错:let char: Character = "AB"
    // Swift 中不能创建空的 Character（字符） 类型变量或常量： Swift 中以下赋值会报错 let char1: Character = ""

let char1: Character = "A"
let char2: Character = "B"

print("char1 的值为 \(char1)")
print("char2 的值为 \(char2)")


//2,字符：遍历字符串中的字符
for ch in "Runoob".characters {
    print(ch)
}


//3,字符：字符串连接字符
var varA:String = "Hello "
let varB:Character = "G"
varA.append( varB )
print("varC  =  \(varA)")

//4,字符串：创建字符串：你可以通过使用字符串字面量或 String 类的实例来创建一个字符串
if char1 == "A"{
    // 使用字符串字面量
    var stringA = "Hello, World!"
    print( stringA )
    // String 实例化
    var stringB = String("Hello, World!")
    print( stringB )

}


//5,字符串：空字符串：你可以使用空的字符串字面量赋值给变量或初始化一个String类的实例来初始值一个空的字符串。 我们可以使用字符串属性 isEmpty 来判断字符串是否为空：
if char1 == "A"{
    // 使用字符串字面量创建空字符串
    var stringA = ""
    
    if stringA.isEmpty {
        print( "stringA 是空的" )
    } else {
        print( "stringA 不是空的" )
    }
    
    // 实例化 String 类来创建空字符串
    let stringB = String()
    
    if stringB.isEmpty {
        print( "stringB 是空的" )
    } else {
        print( "stringB 不是空的" )
    }
}
//6,字符串：字符串常量：你可以将一个字符串赋值给一个变量或常量，变量是可修改的，常量是不可修改的。
if char1 == "A"{
    // stringA 可被修改
    var stringA = "菜鸟教程："
    stringA += "http://www.runoob.com"
    print( stringA )
    
    // stringB 不能修改
    let stringB = String("菜鸟教程：")
//    stringB += "http://www.runoob.com"
//    print( stringB )
    
}

//7,字符串：字符串中插入值：字符串插值是一种构建新字符串的方式，可以在其中包含常量、变量、字面量和表达式。 您插入的字符串字面量的每一项都在以反斜线为前缀的圆括号中
if char1 == "A"{
    var varA   = 20
    let constA = 100
    var varC:Float = 20.0
    
    var stringA = "\(varA) 乘于 \(constA) 等于 \(varC * 100)"
    print( stringA )
}

//8,字符串：字符串连接：字符串可以通过 + 号来连接
if char1 == "A"{
    let constA = "菜鸟教程："
    let constB = "http://www.runoob.com"
    
    var stringA = constA + constB
    
    print( stringA )
}
//9,字符串：字符串长度：字符串长度使用 String.characters.count 属性来计算
if char1 == "A"{
    var varA   = "www.runoob.com"
    
    print( "\(varA), 长度为 \(varA.characters.count)" )
}

//10,字符串：字符串比较：你可以使用 == 来比较两个字符串是否相等
if char1 == "A"{
    var varA   = "Hello, Swift!"
    var varB   = "Hello, World!"
    
    if varA == varB {
        print( "\(varA) 与 \(varB) 是相等的" )
    } else {
        print( "\(varA) 与 \(varB) 是不相等的" )
    }
}
//11,字符串：Unicode 字符串：Unicode 是一个国际标准，用于文本的编码，Swift 的 String 类型是基于 Unicode建立的。你可以循环迭代出字符串中 UTF-8 与 UTF-16 的编码，
if char1 == "A"{
    var unicodeString   = "菜鸟教程"
    
    print("UTF-8 编码: ")
    for code in unicodeString.utf8 {
        print("\(code) ")
    }
    
    print("\n")
    
    print("UTF-16 编码: ")
    for code in unicodeString.utf16 {
        print("\(code) ")
    }
}

