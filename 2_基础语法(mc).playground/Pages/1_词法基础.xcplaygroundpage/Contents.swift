//: [Previous](@previous)

import Foundation
//1_常量,变量
/*
 1_直接赋值字面量var a = 5
 2_定义要带上类型var a:Int ; a = 5
 */

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

//6_运算符
/*
 ++字符串不能用
 但可以用a += 1
 */
var d = 1
d+=1




