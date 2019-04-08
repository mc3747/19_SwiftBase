//: Playground - noun: a place where people can play

import UIKit

// 1，类：类的应用
    // 类的定义
class studentMarks {
    var mark = 300
}
    // 类的实例化
let marks = studentMarks()
    // 访问属性
print("成绩为 \(marks.mark)")

// 2，类：恒等运算符
    /*
 因为类是引用类型，有可能有多个常量和变量在后台同时引用某一个类实例
 运算符为：===:如果两个常量或者变量引用同一个类实例则返回 true
 运算符为：!==:如果两个常量或者变量引用不同一个类实例则返回 true
    */
class SampleClass: Equatable {
    let myProperty: String
    init(s: String) {
        myProperty = s
    }
}
func ==(lhs: SampleClass, rhs: SampleClass) -> Bool {
    return lhs.myProperty == rhs.myProperty
}

let spClass1 = SampleClass(s: "Hello")
let spClass2 = SampleClass(s: "Hello")

if spClass1 === spClass2 {// false
    print("引用相同的类实例 \(spClass1)")
}

if spClass1 !== spClass2 {// true
    print("引用不相同的类实例 \(spClass2)")
}
// 3，属性：存储属性
struct Number
{
    var digits: Int
    let pi = 3.1415
}

var n = Number(digits: 12345)
n.digits = 67
print("\(n.digits)")
print("\(n.pi)")

// 4，属性：延迟存储属性：延迟存储属性是指当第一次被调用的时候才会计算其初始值的属性。
        //在属性声明前使用 lazy 来标示一个延迟存储属性。
class sample {
    lazy var no = number() // `var` 关键字是必须的
}

class number {
    var name = "Runoob Swift 教程"
}

var firstsample = sample()
print(firstsample.no.name)

// 5，属性：计算属性:除存储属性外，类、结构体和枚举可以定义计算属性，计算属性不直接存储值，而是提供一个 getter 来获取值，一个可选的 setter 来间接设置其他属性或变量的值。
class sample1 {
    var no1 = 0.0, no2 = 0.0
    var length = 300.0, breadth = 150.0
    
    var middle: (Double, Double) {
        get{
            return (length / 2, breadth / 2)
        }
        set(axis){
            no1 = axis.0 - (length / 2)
            no2 = axis.1 - (breadth / 2)
        }
    }
}

var result = sample1()
print(result.middle)
result.middle = (0.0, 10.0)

print(result.no1)
print(result.no2)

// 6，属性：只读计算属性:只有 getter 没有 setter 的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点(.)运算符访问，但不能设置新的值
class film {
    var head = ""
    var duration = 0.0
    var metaInfo: [String:String] {
        return [
            "head": self.head,
            "duration":"\(self.duration)"
        ]
    }
}

var movie = film()
movie.head = "Swift 属性"
movie.duration = 3.09

print(movie.metaInfo["head"]!)
print(movie.metaInfo["duration"]!)

// 7，属性：属性观察器
    /*
     willSet在设置新的值之前调用
     didSet在新的值被设置之后立即调用
     willSet和didSet观察器在属性初始化过程中不会被调用
     */

class Samplepgm {
    var counter: Int = 0{
        willSet(newTotal){
            print("计数器: \(newTotal)")
        }
        didSet{
            if counter > oldValue {
                print("新增数 \(counter - oldValue)")
            }
        }
    }
}
let NewCounter = Samplepgm()
NewCounter.counter = 100
NewCounter.counter = 800

// 8，属性：类型属性
/*
 类型属性是作为类型定义的一部分写在类型最外层的花括号（{}）内。
 使用关键字 static 来定义值类型的类型属性，关键字 class 来为类定义类型属性。
 */
struct StudMarks {
    static let markCount = 97
    static var totalCount = 0
    var InternalMarks: Int = 0 {
        didSet {
            if InternalMarks > StudMarks.markCount {
                InternalMarks = StudMarks.markCount
            }
            if InternalMarks > StudMarks.totalCount {
                StudMarks.totalCount = InternalMarks
            }
        }
    }
}

var stud1Mark1 = StudMarks()
var stud1Mark2 = StudMarks()

stud1Mark1.InternalMarks = 98
print(stud1Mark1.InternalMarks)

stud1Mark2.InternalMarks = 87
print(stud1Mark2.InternalMarks)

// 9，方法：实例方法
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
// 初始计数值是0
let counter = Counter()

// 计数值现在是1
counter.increment()

// 计数值现在是6
counter.incrementBy(amount: 5)
print(counter.count)

// 计数值现在是0
counter.reset()
print(counter.count)

// 10，方法：方法的局部参数名称和外部参数名称
class division {
    var count: Int = 0
    func incrementBy(no1: Int, no2: Int) {
        count = no1 / no2
        print(count)
    }
}

let counter1 = division()
counter1.incrementBy(no1: 1800, no2: 3)
counter1.incrementBy(no1: 1600, no2: 5)
counter1.incrementBy(no1: 11000, no2: 3)

class multiplication {
    var count: Int = 0
    func incrementBy(first no1: Int, no2: Int) {
        count = no1 * no2
        print(count)
    }
}

let counter2 = multiplication()
counter2.incrementBy(first: 800, no2: 3)
counter2.incrementBy(first: 100, no2: 5)
counter2.incrementBy(first: 15000, no2: 3)

// 11，方法：self 属性
class calculations {
    let a: Int
    let b: Int
    let res: Int
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
        res = a + b
        print("Self 内: \(res)")
    }
    
    func tot(c: Int) -> Int {
        return res - c
    }
    
    func result() {
        print("结果为: \(tot(c: 20))")
        print("结果为: \(tot(c: 50))")
    }
}

let pri = calculations(a: 600, b: 300)
let sum = calculations(a: 1200, b: 300)

pri.result()
sum.result()

// 12，方法：在实例方法中修改值类型
struct area {
    var length = 1
    var breadth = 1
    
    func area() -> Int {
        return length * breadth
    }
    
    mutating func scaleBy(res: Int) {
        length *= res
        breadth *= res
        
        print(length)
        print(breadth)
    }
}

var val = area(length: 3, breadth: 5)
val.scaleBy(res: 3)
val.scaleBy(res: 30)
val.scaleBy(res: 300)

// 13，方法：在可变方法中给 self 赋值
struct area1 {
    var length = 1
    var breadth = 1
    
    func area() -> Int {
        return length * breadth
    }
    
    mutating func scaleBy(res: Int) {
        self.length *= res
        self.breadth *= res
        print(length)
        print(breadth)
    }
}
var val1 = area1(length: 3, breadth: 5)
val1.scaleBy(res: 13)

// 14，方法：类型方法
class Math
{
    class func abs(number: Int) -> Int
    {
        if number < 0
        {
            return (-number)
        }
        else
        {
            return number
        }
    }
}

struct absno
{
    static func abs(number: Int) -> Int
    {
        if number < 0
        {
            return (-number)
        }
        else
        {
            return number
        }
    }
}

let no = Math.abs(number: -35)
let num = absno.abs(number: -5)

print(no)
print(num)

