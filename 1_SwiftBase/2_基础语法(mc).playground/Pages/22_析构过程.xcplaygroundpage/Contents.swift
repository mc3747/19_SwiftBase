//: [Previous](@previous)

import Foundation

// 7,析构函数，在一个类的实例被释放之前，析构函数被立即调用，类似于dealloc。
var counter = 0;  // 引用计数器
class BaseClass {
    init() {
        counter += 1;
    }
    deinit {
        counter -= 1;
    }
}

var show: BaseClass? = BaseClass()
print(counter)
show = nil
print(counter)
