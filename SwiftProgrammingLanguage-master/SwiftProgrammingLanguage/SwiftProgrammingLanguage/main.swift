//
//  main.swift
//  SwiftProgrammingLanguage
//
//  Created by gl on 16/7/5.
//  Copyright © 2016年 gl. All rights reserved.
//  

import Foundation

//1，泛型案例
//struct Stack<T> {
//    var items = [T]()
//    mutating func push(_ item: T) {
//        items.append(item)
//    }
//    mutating func pop() -> T {
//        return items.removeLast()
//    }
//}
//var stackOfStrings = Stack<String>()
//stackOfStrings.push("undo")
//stackOfStrings.push("dos")
//stackOfStrings.push("tres")
//stackOfStrings.push("cuatro")
//print(stackOfStrings)

//


////彩蛋协议1：不包含associatedtype和Self
//protocol SurpriseEgg1 {
//    var content: Float {get}
//}
//
////定义一个彩蛋类
//struct PuzzleEgg1 : SurpriseEgg1{
//    var content: Float
//}
//struct ToyEgg1 : SurpriseEgg1{
//    var content: Float
//}
//struct FigureEgg1 : SurpriseEgg1{
//    var content: Float
//}
//func pickRandomEgg1() -> SurpriseEgg1 {
//    return PuzzleEgg1(content: 70)
//}
//print(pickRandomEgg1().content)



//
////彩蛋协议2:使用包含associatedtype和Self
//protocol SurpriseEgg2 {
//    associatedtype ContentType
//    var content : ContentType { get }
//    func getSelf() -> Self
//}
////定义一个彩蛋类
//struct PuzzleEgg2 : SurpriseEgg2{
//    var content: Int
//    func getSelf() -> PuzzleEgg2{
//        return self
//    }
//}
//struct ToyEgg2 : SurpriseEgg2{
//    var content: String
//    func getSelf() -> ToyEgg2{
//        return self
//    }
//}
//struct FigureEgg2 : SurpriseEgg2{
//    var content: Bool
//    func getSelf() -> FigureEgg2{
//        return self
//    }
//}

//if #available(macOS 10.15.0, *) {
//    func pickRandomEgg2() -> some SurpriseEgg2 {
//        return PuzzleEgg2(content: 70)
//    }
//    print(pickRandomEgg2().content)
//    print(pickRandomEgg2().getSelf())
//    print(pickRandomEgg2().self)
//} else {
//
//}


//var min = UInt8.min
//print(min)
//print(min &- 1)
//print(min - 1)

//var max = UInt8.max
//print(max)
//print(max &+ 1)
//print(max + 1)


struct Point {
    var x :Int,y : Int
    
}
