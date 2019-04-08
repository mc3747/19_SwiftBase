//: Playground - noun: a place where people can play

import UIKit
/*
 Swift 数组
 Swift 数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
 Swift 数组会强制检测元素的类型，如果类型不同则会报错，Swift 数组应该遵循像Array<Element>这样的形式，其中Element是这个数组中唯一允许存在的数据类型。
 如果创建一个数组，并赋值给一个变量，则创建的集合就是可以修改的。这意味着在创建数组后，可以通过添加、删除、修改的方式改变数组里的项目。如果将一个数组赋值给常量，数组就不可更改，并且数组的大小和内容都不可以修改。
*/

//1,数组：创建数组
    //1⃣️，空数组：
    var someArray1 = [Int]()
    //2⃣️，元素值一样的数组
    var someArray2 = [Int](repeating: 0, count: 3)
    //3⃣️，元素不一样的数组
    var someArray3:[Int] = [10, 20, 30]

//2,数组：访问数组：下标访问
    var someVar = someArray3[0]

//3,数组：修改数组
    //1⃣️，使用 append() 方法或者赋值运算符 += 在数组末尾添加元素
    var someInts = [Int]()
    someInts.append(20)
    someInts.append(30)
    someInts += [40]

    //2⃣️，也可以通过索引修改数组元素的值：
    someInts[2] = 50
//    print( "第三个元素的值 \(someInts[2])" )

//4,数组：遍历数组
    var someStrs = [String]()
    someStrs.append("Apple")
    someStrs.append("Amazon")
    someStrs.append("Runoob")
    someStrs += ["Google"]
    //1⃣️，使用for-in循环来遍历
    for item in someStrs {
        print(item)
    }
    //2⃣️，使用enumerate() 方法来进行数组遍历
    for (index, item) in someStrs.enumerated() {
        print("在 index = \(index) 位置上的值为 \(item)")
    }

//5,数组：合并数组：使用加法操作符（+）来合并两种已存在的相同类型数组
    var intsA = [Int](repeating: 2, count:2)
    var intsB = [Int](repeating: 1, count:3)
    var intsC = intsA + intsB


//6,数组：count 属性
    print("intsC 元素个数为 \(intsC.count)")

//7,数组：isEmpty 属性：可以通过只读属性 isEmpty 来判断数组是否为空，返回布尔值：
    var intsD = [Int]()
    print("intsA.isEmpty = \(intsA.isEmpty)")
    print("intsB.isEmpty = \(intsD.isEmpty)")


/*
 Swift 字典
 Swift 字典用来存储无序的相同类型数据的集合，Swift 字典会强制检测元素的类型，如果类型不同则会报错。
 Swift 字典每个值（value）都关联唯一的键（key），键作为字典中的这个值数据的标识符。
 和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。
 Swift 字典的key没有类型限制可以是整型或字符串，但必须是唯一的。
 如果创建一个字典，并赋值给一个变量，则创建的字典就是可以修改的。这意味着在创建字典后，可以通过添加、删除、修改的方式改变字典里的项目。如果将一个字典赋值给常量，字典就不可修改，并且字典的大小和内容都不可以修改。
*/
//7,字典：创建字典
    // 空字典
    var someDict1 = [Int: String]()
    // 键值对
    var someDict2:[Int:String] = [1:"One", 2:"Two", 3:"Three"]

//8,字典：访问字典:通过key来访问
    var someVar2 = someDict2[1]

//9,字典：修改字典
    //1⃣️，可以使用 updateValue(forKey:) 增加或更新字典的内容。如果 key 不存在，则添加值，如果存在则修改 key 对应的值
    var oldVal = someDict2.updateValue("One 新的值", forKey: 1)
    var newVal = someDict2.updateValue("One 新的值", forKey: 4)

    for (key, value) in someDict2 {
    print("字典 key \(key) -  字典 value \(value)")
    }
    //2⃣️，也可以通过指定的 key 来修改字典的值

//10,字典：移除 Key-Value 对

//11,字典：遍历字典

//12,字典：字典转换为数组

//13,字典：count 属性

//14,数字典：isEmpty 属性