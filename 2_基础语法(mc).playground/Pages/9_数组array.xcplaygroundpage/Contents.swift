//: [Previous](@previous)

import Foundation

//1_创建数组
//方法1_先创建空数组,再添加
var someInts1 = [Int]()
someInts1.append(3)

//方法2_定义后赋值
var someInts2 : [Int] = [3,4,5]
//可以简化成 var someInts2  = [3,4,5]

//方法3_使用Array的数据项数量（count）和适当类型的初始值（repeating）
var someInts3 = Array(repeating: 2, count: 3)

//方法4_使用2个数组相加
var someInts4 = someInts1 + someInts2 + someInts3


//2_数组的属性和方法
//count属性:
//isEmpty属性:布尔属性,检查count是否是0
//

//3_添加元素的方法
//append(_:)方法
//+=方法

//4_插入元素
//insert(_:at:) 方法在某个指定索引值之前添加数据项

//5_删除元素
//使用 remove(at:) 方法来移除数组中的某一项。这个方法把数组在特定索引值中存储的数据项移除并且返回这个被移除的数据项
//使用 removeLast() 方法把数组中的最后一项移除

//6_数组的遍历
//6.1 for - in:只能得到value,没有索引index
var shoppingList = [3,4,5]
for item in shoppingList {
    print(item)
}
//6.2 enumerated():有value和index
for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}


