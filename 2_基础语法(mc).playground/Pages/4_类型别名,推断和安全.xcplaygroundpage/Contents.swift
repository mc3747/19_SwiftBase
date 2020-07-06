//: [Previous](@previous)

import Foundation

//1_typealias类型别名
typealias AudioSample = UInt16

print(AudioSample.min) //0


//2_类型安全:编译你的代码时进行类型检查
var varA = 42
// varA = "This is hello" //此处会报错
print(varA)

//3_类型推断
var varB = 3.14159
print(varB) //推断为double

