//: Playground - noun: a place where people can play

import UIKit

// 1,下标：下标脚本 可以定义在类（Class）、结构体（structure）和枚举（enumeration）这些目标中，可以认为是访问对象、集合或序列的快捷方式，不需要再调用实例的特定的赋值和访问方法。
    // 例子：通过 subexample 结构体创建了一个除法运算的实例。数值 100 作为结构体构造函数传入参数初始化实例成员 decrementer。
struct subexample {
    let decrementer: Int
    subscript(index: Int) -> Int {
        return decrementer / index
    }
}
let division = subexample(decrementer: 100)

print("100 除以 9 等于 \(division[9])")
print("100 除以 2 等于 \(division[2])")
// 2,下标：下标脚本是用来访问集合（collection），列表（list）或序列（sequence）中元素的快捷方式。你可以在你自己特定的类或结构体中自由的实现下标脚本来提供合适的功能
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

print(numberOfLegs)

// 3,下标：下标选项
struct Matrix {
    let rows: Int, columns: Int
    var print: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        print = Array(repeating: 0.0, count: rows * columns)
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            return print[(row * columns) + column]
        }
        set {
            print[(row * columns) + column] = newValue
        }
    }
}
// 创建了一个新的 3 行 3 列的Matrix实例
var mat = Matrix(rows: 3, columns: 3)

// 通过下标脚本设置值
mat[0,0] = 1.0
mat[0,1] = 2.0
mat[1,0] = 3.0
mat[1,1] = 5.0

// 通过下标脚本获取值
print("\(mat[0,0])")
print("\(mat[0,1])")
print("\(mat[1,0])")
print("\(mat[1,1])")

// 4,继承：基类
class StudDetails {
    var stname: String!
    var mark1: Int!
    var mark2: Int!
    var mark3: Int!
    init(stname: String, mark1: Int, mark2: Int, mark3: Int) {
        self.stname = stname
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
}
let stname = "swift"
let mark1 = 98
let mark2 = 89
let mark3 = 76

let sds = StudDetails(stname:stname, mark1:mark1, mark2:mark2, mark3:mark3);

print(sds.stname)
print(sds.mark1)
print(sds.mark2)
print(sds.mark3)

// 5,继承：子类
class StudDetails1
{
    var mark1: Int;
    var mark2: Int;
    
    init(stm1:Int, results stm2:Int)
    {
        mark1 = stm1;
        mark2 = stm2;
    }
    
    func show()
    {
        print("Mark1:\(self.mark1), Mark2:\(self.mark2)")
    }
}

class Tom : StudDetails1
{
    init()
    {
        super.init(stm1: 93, results: 89)
    }
}

let tom = Tom()
tom.show()

// 6,继承：重写方法
class SuperClass {
    func show() {
        print("这是超类 SuperClass")
    }
}

class SubClass: SuperClass  {
    override func show() {
        print("这是子类 SubClass")
    }
}

let superClass = SuperClass()
superClass.show()

let subClass = SubClass()
subClass.show()

// 7,继承：重写属性
class Circle {
    var radius = 12.5
    var area: String {
        return "矩形半径 \(radius) "
    }
}

class Rectangle: Circle {
    var print = 7
    override var area: String {
        return super.area + " ，但现在被重写为 \(print)"
    }
}

let rect = Rectangle()
rect.radius = 25.0
rect.print = 3
print("Radius \(rect.area)")

// 8,继承：重写属性观察器
class Circle2 {
    var radius = 12.5
    var area: String {
        return "矩形半径为 \(radius) "
    }
}

class Rectangle2: Circle2 {
    var print = 7
    override var area: String {
        return super.area + " ，但现在被重写为 \(print)"
    }
}


let rect1 = Rectangle2()
rect1.radius = 25.0
rect1.print = 3
print("半径: \(rect1.area)")

class Square: Rectangle2 {
    override var radius: Double {
        didSet {
            print = Int(radius/5.0)+1
        }
    }
}


let sq = Square()
sq.radius = 100.0
print("半径: \(sq.area)")

// 9,继承：防止重写：关键字class前添加final特性（final class）来将整个类标记为 final 的，这样的类是不可被继承的，否则会报编译错误。


