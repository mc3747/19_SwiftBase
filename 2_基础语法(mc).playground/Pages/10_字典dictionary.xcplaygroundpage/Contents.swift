
//: [Previous](@previous)

import Foundation

//1_创建方法
    //1,新建空字典,再添加
    var namesOfIntegers1 = [Int: String]()
    namesOfIntegers1[1] = "4"
    namesOfIntegers1[2] = "45"
    print(namesOfIntegers1)

    //2,新建字典的时候,就赋值
    var namesOfIntegers2 : [Int: String] = [3:"a",4:"b",5:"c"];

//2_字典的属性
    //count
    //isEmpty

//3_修改
    //方法1:下标语法
    namesOfIntegers2[3] = "A";
    //方法2:updateValue(_:forKey:)
    namesOfIntegers2[4] = "B";
    print(namesOfIntegers2)

//4_删除某个key
    //removeValue(forKey:)

//5_字典的遍历
    //for-in遍历:key和value
        for (airportCode, airportName) in namesOfIntegers2 {
            print("\(airportCode): \(airportName)")
        }
    //也可以单独遍历key:for airportCode in airports.keys
    //单独遍历value:for airportName in airports.values
