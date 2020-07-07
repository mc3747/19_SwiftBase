//: [Previous](@previous)

import Foundation

//1_字符
let char: Character = "A"

//2_字符数组
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
    //字符数组转字符串
let catString = String(catCharacters)
print(catString)

//3_字符串
let testString: String = "A"

//初始化空字符串的2种方法
var emptyString = ""               // 空字符串字面量
var anotherEmptyString = String()  // 初始化方法

    
//多行字符串"""
    //字符串开启引号之后（"""）或者结束引号（"""）之前都没有换行符号
    //"""和内容直接必须要分隔
    //如果要换行,在后边加\

//转义字符
    //转义字符 \0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。

//字符串的相关方法
    //1_检查是否是空字符串isEmpty:
    //2_遍历字符串中的字符
        for character in "Dog!🐶" {
            print(character)
        }
    //3_字符串的拼接
        //方法1:+ 连接
        //方法2:+= 连接
        //方法3:append() 方法

    //4_字符串中使用变量:对应js的模板字符串
        //反斜线为前缀的圆括号中
            let a = "5"
            print("我是\(a)")
        //如果想全部使用字符串使用#包围
            print(#"我是\(a)"#)
    
    //5_字符串的属性
        //startIndex 属性可以获取一个 String 的第一个 Character 的索引
        //endIndex 属性可以获取最后一个 Character 的后一个位置的索引
        //String 是空串，startIndex 和 endIndex 是相等的
        //index(before:):在具体的字符串下标之前
        //index(after:):在具体的字符串下标之后
        //indices属性会创建一个包含全部索引的范围（Range）
        let string = """
            123
            """;
        
        print(string.count)
        print(string.startIndex)
        print(string.endIndex)
        print(string[string.startIndex])
        print(string[string.index(after: string.startIndex)])
        print(string[string.index(before: string.endIndex)])
        for index in string.indices {
           print("\(string[index]) ", terminator: "")
        }

    //6_字符串的插值
        //insert(_:at:) 方法可以在一个字符串的指定索引插入一个字符
        //insert(contentsOf:at:) 方法可以在一个字符串的指定索引插入一个段字符串
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        // welcome 变量现在等于 "hello!"

        welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
        // welcome 变量现在等于 "hello there!"

    //7_字符串的删除
        //remove(at:) 方法可以在一个字符串的指定索引删除一个字符
        //removeSubrange(_:) 方法可以在一个字符串的指定索引删除一个子字符串
        welcome.remove(at: welcome.index(before: welcome.endIndex))
            // welcome 现在等于 "hello there"

        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
            // welcome 现在等于 "hello"

    //8_字符串的子字符串
        //8.1获取子字符串的方法
            //使用下标
            //使用类似于prefix(_:)的方法

        //8.2字符串和子字符串的区别
            //Substring 可以重用原 String 的内存空间，或者另一个 Substring 的内存空间
            //只有在短时间内需要操作字符串时，才会使用 Substring。当你需要长时间保存结果时，就把 Substring 转化为 String 的实例
        
        //8.3子字符串转字符串,进行长期保存,利用String()函数

            let greeting = "Hello, world!"
            let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
            let beginning = greeting[..<index]
            // beginning 的值为 "Hello"

            // 把结果转化为 String 以便长期存储。
            let newString = String(beginning)
    
    //9_字符串的比较:==和!=
        if ("a" == "\u{61}") {
            print("相等")
        }
        
    //10_前缀或者后缀:hasPrefix(_:)/hasSuffix(_:)

    //11_字符串的utf-8,utf-16表示
        print("3".utf8)
        print("3".utf16)
