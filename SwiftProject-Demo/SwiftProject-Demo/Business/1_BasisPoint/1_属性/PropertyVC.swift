//
//  PropertyVC.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/11/29.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit

/*
 MARK: - 1.1 存储属性和计算属性
 
 1_存储属性会将常量和变量存储为实例的一部分，而计算属性则是直接计算（而不是存储）值
 2_计算属性可以用于类、结构体和枚举，而存储属性只能用于类和结构体。
 
 属性的修饰
 1.常量和变量:var和let
 2.延时加载:使用lazy,并且只能是var
    只有在第一次被访问的时候才被创建
 
 MARK: - 1.2 实例属性和类型属性
 1.类型属性为类型本身定义属性,只有唯一一份
 2.必须给存储型类型属性指定默认值，因为类型本身没有构造器，也就无法在初始化过程中使用构造器给类型属性赋值。
 */

// MARK: - 2.1计算属性:完整写法
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
//2.2计算属性:简写setter
    //如果计算属性的 setter 没有定义表示新值的参数名，则可以使用默认名称 newValue
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
//2.3计算属性:简写getter
    //如果整个 getter 是单一表达式，getter 会隐式地返回这个表达式结果,省略return
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//MARK: - 3.1属性观察器
    //willSet 在新的值被设置之前调用
    //didSet 在新的值被设置之后调用
    //willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue。
    //didSet可以带一个oldName的参数，表示旧的属性，不带的话默认命名为oldValue。
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
//MARK: - 4.1属性包装器
/*
统一约束
 @propertyWrapper来定义包装器
 */
@propertyWrapper
struct TwelveOrLess {
    private var number: Int
    init() { self.number = 0 }
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12) }
    }
}
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

// MARK: - 注释
class PropertyVC: CommonViewController {
    override func viewDidLoad() {
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
    }
    
}
