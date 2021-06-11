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


//struct Point {
//    var x :Int,y : Int
//    static func + (p1:Point,p2:Point) -> Point{
//        Point(x: p1.x + p2.x, y: p1.y + p2.y)
//    }
//}
//
//print(Point(x: 4, y: 5) + Point(x: 3, y: 4))
//
//struct Point2{
//    var x = 1
//    var y : Int
//}
//Point2(x: 2, y: 3)
//Point2(y: 4)

//extension Double {
//    var km: Double { return self * 1_000.0 }
//    var m: Double { return self }
//    var cm: Double { return self / 100.0 }
//    var mm: Double { return self / 1_000.0 }
//    var ft: Double { return self / 3.28084 }
//}
//let oneInch = 25.4.mm
//print("One inch is \(oneInch) meters")

//struct Size {
//    var width = 0.0, height = 0.0
//}
//struct Point {
//    var x = 0.0, y = 0.0
//}
//struct Rect {
//    var origin = Point()
//    var size = Size()
//}
//extension Rect {
//    init(center: Point, size: Size) {
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.height / 2)
//        self.init(origin: Point(x: originX, y: originY), size: size)
//    }
//}
//let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
//                      size: Size(width: 3.0, height: 3.0))
//// centerRect 的 origin 是 (2.5, 2.5) 并且它的 size 是 (3.0, 3.0)
//print(centerRect)

//extension Int {
//    func repetitions(task: () -> Void) {
//        for _ in 0..<self {
//            task()
//        }
//    }
//}
//3.repetitions {
//    print("Hello!")
//}

extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
print(746381295[0])
// 返回 5
print(746381295[1])
// 返回 9

