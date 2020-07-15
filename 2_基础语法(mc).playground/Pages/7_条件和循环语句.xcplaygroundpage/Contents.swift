//: [Previous](@previous)

import Foundation

//1_条件语句if,switch,guard
    //switch
        //switch不用break,也会停止
        //用了fallthrough,则会继续执行
        //case 分支的模式可以使用 where 语句来判断额外的条件
    //guard
        //一个 guard 语句总是有一个 else 从句，如果条件不为真则执行 else 从句中的代码
        //如果 guard 语句的条件被满足，则继续执行 guard 语句大括号后的代码。将变量或者常量的可选绑定作为 guard 语句的条件，都可以保护 guard 语句后面的代码。
        //如果条件不被满足，在 else 分支上的代码就会被执行。这个分支必须转移控制以退出 guard 语句出现的代码段。它可以用控制转移语句如 return、break、continue 或者 throw 做这件事，或者调用一个不返回的方法或函数，例如 fatalError()。

//2_循环语句
    //2.1_for - in
    //2.2_while
    //2.3_repeat while:判断循环条件之前，先执行一次循环的代码块

//循环关键字
    /*
     continue 语句
        告诉一个循环体立刻停止本次循环迭代，重新开始下次循环迭代。
     break 语句
        中断当前循环。
     fallthrough 语句
        如果在一个case执行完后，继续执行下面的case，需要使用fallthrough(贯穿)关键字
     */


