//: [Previous](@previous)

import Foundation

//1_结构体的定义
    //struct关键字
    //大驼峰命名
struct Resolution {
    var width = 0
    var height = 0
}
//2_结构体的实例
let someResolution1 = Resolution()
let someResolution2 = Resolution(width:5,height: 9)

//3_结构体属性访问
print(someResolution1.width);

//4_属性
    //常量结构体实例的存储属性
    //
