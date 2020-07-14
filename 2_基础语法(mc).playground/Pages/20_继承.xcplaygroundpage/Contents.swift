//: [Previous](@previous)

import Foundation

//1_基类
    //不继承于其它类的类，称之为基类
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做——因为车辆不一定会有噪音
    }
}
let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//2_子类的生成
    //子类继承超类的特性，并且可以进一步完善。你还可以为子类添加新的特性
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 49

//3_重写
    //继承来的实例方法，类方法，实例属性，类属性,或下标提供自己定制的实现
    //override关键字
    //super访问父类
//重写方法
//重写属性的setter和getter方法
//重写属性观察器

//4_防止重写
    //可以通过把方法，属性或下标标记为 final 来防止它们被重写，只需要在声明关键字前加上 final 修饰符即可

