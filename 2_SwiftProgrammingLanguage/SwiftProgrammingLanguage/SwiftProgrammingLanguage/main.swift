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

//extension Int {
//    subscript(digitIndex: Int) -> Int {
//        var decimalBase = 1
//        for _ in 0..<digitIndex {
//            decimalBase *= 10
//        }
//        return (self / decimalBase) % 10
//    }
//}
//print(746381295[0])
//// 返回 5
//print(746381295[1])
//// 返回 9

//struct Demo<T> {
//    var array1:[T] = []
//    var array2:[Any] = []
//    init() {}
//}
//var demo = Demo<String>()
//demo.array1.append(1)
//demo.array2.append(2)


//func returnSelf1(s:Any) -> Any{
//    return 0
//}
//returnSelf1(s: "a")
//
//func returnSelf2<T>(s:T) -> T{
//    return 0
//}

//let swiftInt: Int = 1
//let swiftString: String = "miao"
//
//var array: [Any] = []
//array.append(swiftInt)
//array.append(swiftString)
//print(array)



////測試程式碼
//class Car { //類
//}
//struct Trunk { //結構體 屬於值型別
//}
////Any測試程式碼
//var arrAny = [Any]()
//arrAny.append(1) //正常
//arrAny.append(1.0) //正常
//arrAny.append("things") //正常
//arrAny.append(Car()) //正常
//arrAny.append(Trunk()) //正常
//
//
//var arrAnyObject:[AnyObject] = []
//arrAnyObject.append(Car()) //正常
//arrAnyObject.append(Trunk()) //報錯

//enum VendingMachineError: Error {
//    case invalidSelection                    //选择无效
//    case insufficientFunds(coinsNeeded: Int) //金额不足
//    case outOfStock                          //缺货
//}
//struct Item {
//    var price: Int
//    var count: Int
//}
//
//class VendingMachine {
//    var inventory = [
//        "Candy Bar": Item(price: 12, count: 7),
//        "Chips": Item(price: 10, count: 4),
//        "Pretzels": Item(price: 7, count: 11)
//    ]
//    var coinsDeposited = 0
//
//    func vend(itemNamed name: String) throws {
//        guard let item = inventory[name] else {
//            throw VendingMachineError.invalidSelection
//        }
//
//        guard item.count > 0 else {
//            throw VendingMachineError.outOfStock
//        }
//
//        guard item.price <= coinsDeposited else {
//            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
//        }
//
//        coinsDeposited -= item.price
//
//        var newItem = item
//        newItem.count -= 1
//        inventory[name] = newItem
//
//        print("Dispensing \(name)")
//    }
//}
//
//let favoriteSnacks = [
//    "Alice": "Chips",
//    "Bob": "Licorice",
//    "Eve": "Pretzels",
//]
//func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
//    let snackName = favoriteSnacks[person] ?? "Candy Bar"
//    try vendingMachine.vend(itemNamed: snackName)
//}
//var vendingMachine = VendingMachine()
//vendingMachine.coinsDeposited = 8
//do {
//    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
//    print("Success! Yum.")
//} catch VendingMachineError.invalidSelection {
//    print("Invalid Selection.")
//} catch VendingMachineError.outOfStock {
//    print("Out of Stock.")
//} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
//    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
//} catch {
//    print("Unexpected error: \(error).")
//}
//// 打印“Insufficient funds. Please insert an additional 2 coins.”

//let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
//// 因为 age < 0，所以断言会触发

//class MediaItem {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//class Movie: MediaItem {
//    var director: String
//    init(name: String, director: String) {
//        self.director = director
//        super.init(name: name)
//    }
//}
//
//class Song: MediaItem {
//    var artist: String
//    init(name: String, artist: String) {
//        self.artist = artist
//        super.init(name: name)
//    }
//}
//
//var a = MediaItem(name: "3")
//print(a is Song)
//print((a as! Song) is Song)

//let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//let reverseNames = names.sorted { (s1 : String, s2 : String) in
//    return s1 > s2
//}
//let reverseNames2 = names.sorted { (s1 : String, s2 : String) in
//     s1 > s2
//}
//print(names)
//print(reverseNames)


//var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//print(customersInLine.count)
//// 打印出“5”
//
//let customerProvider = { customersInLine.remove(at: 0) }
//print(customersInLine.count)
//// 打印出“5”
//
//print("Now serving \(customerProvider())!")
//// 打印出“Now serving Chris!”
//
//print(customersInLine.count)
//// 打印出“4”


class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
var john: Person?
var unit4A: Apartment?

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

//john!.apartment = unit4A
//unit4A!.tenant = john

