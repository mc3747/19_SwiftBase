//: Playground - noun: a place where people can play

import UIKit

var varA:Int = 100;
var varB:Int = 200;

// 1，条件语句：if
    if varA < 200 {
        
        print("varA 小于 20");
    }


// 2，条件语句：if 。。。else
    if varA < 20 {
        
        print("varA 小于 20");
    } else {
        
        print("varA 大于 20");
    }

// 3，条件语句：if 。。。else if 。。。else
    if varA == 20 {
        
        print("varA 的值为 20");
    } else if varA == 50 {
        
        print("varA 的值为 50");
    } else {
        
        print("没有匹配条件");
    }

// 4，条件语句：嵌套：if 。。。if
    if varA == 100 {
        
        print("第一个条件为 true");
        
        if varB == 200 {
            
            print("第二个条件也是 true");
        }
    }

// 5，循环语句：for in循环
if varA == 100 {
    // 实例1
    for index in 1...5 {
        print("\(index) 乘于 5 为：\(index * 5)")
    }
    // 实例2
    var someInts:[Int] = [10, 20, 30]
    for index in someInts {
        print( "index 的值为 \(index)")
    }
}

// 6，循环语句：while循环
if varA == 100 {
    var index = 10
    while index < 20
    {
        print( "index 的值为 \(index)")
        index = index + 1
    }
}

// 7，循环语句：repeat。。。while循环
if varA == 100 {
    var index = 15
        if varA == 100 {
        repeat{
            print( "index 的值为 \(index)")
            index = index + 1
        }while index < 20
    }
}
// 8，循环控制语句：continue 语句：告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。
if varA == 100 {
    var index = 10
    
    repeat{
        index = index + 1
        
        if( index == 15 ){ // index 等于 15 时跳过
            continue
        }
        print( "index 的值为 \(index)")
    }while index < 20
    
}

// 9，循环控制语句：break ：语句中断当前循环。
if varA == 100 {
    var index = 10
    
    repeat{
        index = index + 1
        
        if( index == 15 ){  // index 等于 15 时终止循环
            break
        }
        print( "index 的值为 \(index)")
    }while index < 20
}

// 10，循环控制语句：fallthrough 语句：如果在一个case执行完后，继续执行下面的case，需要使用fallthrough(贯穿)关键字。

    // Swift 中的 switch 不会从上一个 case 分支落入到下一个 case 分支中。只要第一个匹配到的 case 分支完成了它需要执行的语句，整个switch代码块完成了它的执行。
if varA == 100 {
    var index = 10
    
    switch index {
    case 100  :
        print( "index 的值为 100")
    case 10,15  :
        print( "index 的值为 10 或 15")
    case 5  :
        print( "index 的值为 5")
    default :
        print( "默认 case")
    }
}
    // Swift fallthrough 语句让 case 之后的语句会按顺序继续运行，且不论条件是否满足都会执行。
if varA == 100 {
    var index = 10
    
    switch index {
    case 100  :
        print( "index 的值为 100")
        fallthrough
    case 10,15  :
        print( "index 的值为 10 或 15")
        fallthrough
    case 5  :
        print( "index 的值为 5")
    default :
        print( "默认 case")
    }
}
