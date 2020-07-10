//: [Previous](@previous)

import Foundation

//1_类
/*
 与结构体相比，类还有如下的附加功能：
     继承允许一个类继承另一个类的特征
     类型转换允许在运行时检查和解释一个类实例的类型
     析构器允许一个类实例释放任何其所被分配的资源
     引用计数允许对一个类的多次引用
*/

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
let tenEighty = VideoMode()
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

//2_属性观察器
/*
 可以在以下位置添加属性观察器：
     自定义的存储属性
     继承的存储属性
     继承的计算属性
 */
    //willSet 在新的值被设置之前调用
    //didSet 在新的值被设置之后调用
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
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

