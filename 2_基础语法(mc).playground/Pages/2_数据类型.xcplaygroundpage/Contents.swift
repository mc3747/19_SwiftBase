/*
 swift的数据类型
 1️⃣值类型
     1_基本类型:
     Int 表示整型值；
     Double 和 Float 表示浮点型值；
     Bool 是布尔型值；
     Character 字符类型
     String 是文本型数据
     nil :只能给可选项赋值
          nil 不是指针——它是一个确定的值，用来表示值缺失
     
     2_集合类型:
     Array、Set 和 Dictionary
     
     3_结构体
     Struct
    
     
     4_高阶数据类型
     元组Tuple
     
     5_枚举
     Enum
     
     6_特殊类型
     可选类型Optional
 
2️⃣引用类型
    闭包
    类class
 
 */

import Foundation

//2_整数类型和浮点数(类型的首字母均大写)
/*
 Int:32位下=Int32,64位下=Int64
    Int32
    Int64
 Float,Double
 */

//3_类型别名:typealias
/*
 typealias AudioSample = UInt16
 var a: AudioSample
 */

//4_布尔值
/*
 true 和false
 if后边只能跟bool值,不能跟int等其他类型
 */

//5_字符串
/*
 单行字符串"",
 多行字符串"""回车 字符 回车 """
 将特殊字符转化成普通字符# #
 */
var a = """
字符
"""
var b = #"\(x) \ " \u{2603}"#
var c = "\u{2603}"



