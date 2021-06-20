//: [Previous](@previous)

import Foundation

// 构造过程是为了使用某个类、结构体或枚举类型的实例而进行的准备过程。这个过程包含了为实例中的每个属性设置初始值和为其执行必要的准备和初始化任务。
// 1,存储型属性不带参数的构造方法
struct rectangle {
    var length: Double
    var breadth: Double
    init() {
        length = 6
        breadth = 12
    }
}
var area = rectangle()
print("矩形面积为 \(area.length*area.breadth)")

// 2,存储型属性带参数的构造方法
struct Rectangle {
    var length: Double
    var breadth: Double
    var area: Double
    
    init(fromLength length: Double, fromBreadth breadth: Double) {
        self.length = length
        self.breadth = breadth
        area = length * breadth
    }
    
    init(fromLeng leng: Double, fromBread bread: Double) {
        self.length = leng
        self.breadth = bread
        area = leng * bread
    }
}

let ar = Rectangle(fromLength: 6, fromBreadth: 12)
print("面积为: \(ar.area)")

let are = Rectangle(fromLeng: 36, fromBread: 12)
print("面积为: \(are.area)")

// 3,存储型属性内部和外部参数的构造方法
struct Rectangle1 {
    var length: Double
    
    init(frombreadth breadth: Double) {
        length = breadth * 10
    }
    
    init(frombre bre: Double) {
        length = bre * 30
    }
    //不提供外部名字（用_代替参数名称）
    init(_ area: Double) {
        length = area
    }
}

    // 调用提供外部名字
    let rectarea1 = Rectangle1(frombreadth :30)
    print("面积为: \(rectarea1.length)")
    // 调用不提供外部名字
    let rectarea2 = Rectangle1(180.0)
    print("面积为: \(rectarea2.length)")
// 4,默认构造器
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()


print("名字为: \(item.name)")
print("数理为: \(item.quantity)")
print("是否付款: \(item.purchased)")

// 5,便利构造器：（只有一个参数，构造器可以调用构造器，就是所谓的构造器代理，不能继承）
class mainClass {
    var no1 : Int // 局部存储变量
    init(no1 : Int) {
        self.no1 = no1 // 初始化
    }
}
class subClass : mainClass {
    var no2 : Int
    init(no1 : Int, no2 : Int) {
        self.no2 = no2
        super.init(no1:no1)
    }
    // 便利方法只需要一个参数
    override convenience init(no1: Int)  {
        self.init(no1:no1, no2:0)
    }
}
let res = mainClass(no1: 20)
let res2 = subClass(no1: 30, no2: 50)

print("res 为: \(res.no1)")
print("res2 为: \(res2.no1)")
print("res2 为: \(res2.no2)")

// 6,构造器继承和重载：Swift 中的子类不会默认继承父类的构造器。父类的构造器仅在确定和安全的情况下被继承。当你重写一个父类指定构造器时，你需要写override修饰符。

class SuperClass {
    var corners = 4
    var description: String {
        return "\(corners) 边"
    }
}
let rectangle1 = SuperClass()
print("矩形: \(rectangle1.description)")

class SubClass: SuperClass {
    override init() {  //重载构造器
        super.init()
        corners = 5
    }
}

let subClass1 = SubClass()
print("五角型: \(subClass1.description)")


