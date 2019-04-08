//: Playground - noun: a place where people can play

import UIKit
/*
 相关值与原始值的区别
 相关值                                 原始值
 不同数据类型                            相同数据类型
 实例: enum {10,0.8,"Hello"}            实例: enum {10,35,50}
 值的创建基于常量或变量                    预先填充的值
 相关值是当你在创建一个基于枚举成员的新常量或变量时才会被设置，并且每次当你这么做得时候，它的值可以是不同的。原始值始终是相同的
 */

//1,枚举：定义以及使用
    // 注意： 和 C 和 Objective-C 不同，Swift 的枚举成员在被创建时不会被赋予一个默认的整型值。在上面的DaysofaWeek例子中，Sunday，Monday，……和Saturday不会隐式地赋值为0，1，……和6。相反，这些枚举成员本身就有完备的值，这些值是已经明确定义好的DaysofaWeek类型。
enum DaysofaWeek {
    case Sunday
    case Monday
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case Saturday
}

var weekDay = DaysofaWeek.THURSDAY
weekDay = .THURSDAY //简写语法
switch weekDay
{
case .Sunday:
    print("星期天")
case .Monday:
    print("星期一")
case .TUESDAY:
    print("星期二")
case .WEDNESDAY:
    print("星期三")
case .THURSDAY:
    print("星期四")
case .FRIDAY:
    print("星期五")
case .Saturday:
    print("星期六")
}



//2,枚举：相关值：以下实例中我们定义一个名为 Student 的枚举类型，它可以是 Name 的一个字符串（String），或者是 Mark 的一个相关值（Int，Int，Int）
enum Student{
    case Name(String)
    case Mark(Int,Int,Int)
}
var studDetails = Student.Name("Runoob")
var studMarks = Student.Mark(98,97,95)
switch studMarks {
case .Name(let studName):
    print("学生的名字是: \(studName)。")
case .Mark(let Mark1, let Mark2, let Mark3):
    print("学生的成绩是: \(Mark1),\(Mark2),\(Mark3)。")
}
//3,枚举：原始值：原始值可以是字符串，字符，或者任何整型值或浮点型值。每个原始值在它的枚举声明中必须是唯一的。在原始值为整数的枚举时，不需要显式的为每一个成员赋值，Swift会自动为你赋值。例如，当使用整数作为原始值时，隐式赋值的值依次递增1。如果第一个值没有被赋初值，将会被自动置为0。
enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}

let yearMonth = Month.May.rawValue
print("数字月份为: \(yearMonth)。")

//4,结构体：定义和使用
/*
 我们可以为结构体定义属性（常量、变量）和添加方法，从而扩展结构体的功能。
 与 C 和 Objective C 不同的是：
 结构体不需要包含实现文件和接口。
 结构体允许我们创建一个单一文件，且系统会自动生成面向其它代码的外部接口。
 结构体总是通过被复制的方式在代码中传递，因此它的值是不可修改的。
 */
struct studentMarks {
    var mark1 = 100
    var mark2 = 78
    var mark3 = 98
}
let marks = studentMarks()
print("Mark1 是 \(marks.mark1)")
print("Mark2 是 \(marks.mark2)")
print("Mark3 是 \(marks.mark3)")

struct MarksStruct {
    var mark: Int
    
    init(mark: Int) {
        self.mark = mark
    }
}
var aStruct = MarksStruct(mark: 98)
var bStruct = aStruct // aStruct 和 bStruct 是使用相同值的结构体！
bStruct.mark = 97
print(aStruct.mark) // 98
print(bStruct.mark) // 97

//5,结构体：应用
/*
 结构体的主要目的是用来封装少量相关简单数据值。
 有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
 任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
 结构体不需要去继承另一个已存在类型的属性或者行为。
 */
struct markStruct{
    var mark1: Int
    var mark2: Int
    var mark3: Int
    
    init(mark1: Int, mark2: Int, mark3: Int){
        self.mark1 = mark1
        self.mark2 = mark2
        self.mark3 = mark3
    }
}

print("优异成绩:")
var marks0 = markStruct(mark1: 98, mark2: 96, mark3:100)
print(marks0.mark1)
print(marks0.mark2)
print(marks0.mark3)

print("糟糕成绩:")
var fail = markStruct(mark1: 34, mark2: 42, mark3: 13)
print(fail.mark1)
print(fail.mark2)
print(fail.mark3)