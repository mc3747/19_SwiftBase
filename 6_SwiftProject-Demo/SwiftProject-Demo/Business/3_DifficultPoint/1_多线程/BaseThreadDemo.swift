//
//  BaseThreadVC.swift
//  SwiftProject-Demo
//
//  Created by kk on 2021/8/11.
//  Copyright © 2021 马成. All rights reserved.
//

import Foundation
class BaseThreadDemo{
//定义四个调度任务，打印当前线程数据
let item1 = DispatchWorkItem {
    for i in 0...3{
        print("🍉item1 -> \(i)  thread: \(Thread.current)")
    }
}
let item2 = DispatchWorkItem {
    for i in 0...3{
        print("🍍item2 -> \(i)  thread: \(Thread.current)")
    }
}
let item3 = DispatchWorkItem {
    for i in 0...3{
        print("🎄item3 -> \(i)  thread: \(Thread.current)")
    }
}
let item4 = DispatchWorkItem {
    for i in 0...3{
        print("🎃item4 -> \(i)  thread: \(Thread.current)")
    }
}

 func syncDemo(){
    //主队列追加同步任务，会引起死锁
    let mainQueue = DispatchQueue.main
    mainQueue.sync(execute: item1)
    mainQueue.sync(execute: item2)
    mainQueue.sync(execute: item3)
    mainQueue.sync(execute: item4)

    //全局队列追加同步任务，按顺序打印
    let globalQueue = DispatchQueue.global()
    globalQueue.sync(execute: item1)
    globalQueue.sync(execute: item2)
    globalQueue.sync(execute: item3)
    globalQueue.sync(execute: item4)

    //自定义串行队列追加同步任务，按顺序打印
    let serialQueue = DispatchQueue(label: "serial")
    serialQueue.sync(execute: item1)
    serialQueue.sync(execute: item2)
    serialQueue.sync(execute: item3)
    serialQueue.sync(execute: item4)

    //自定义并行队列追加同步任务，按顺序打印
    let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
    concurrentQueue.sync(execute: item1)
    concurrentQueue.sync(execute: item2)
    concurrentQueue.sync(execute: item3)
    concurrentQueue.sync(execute: item4)

}
func asyncDemo(){
    //主队列追加异步任务，按顺序打印
    let mainQueue = DispatchQueue.main
    mainQueue.async(execute: item1)
    mainQueue.async(execute: item2)
    mainQueue.async(execute: item3)
    mainQueue.async(execute: item4)

    //全局队列追加异步任务，随机打印
    let globalQueue = DispatchQueue.global()
    globalQueue.async(execute: item1)
    globalQueue.async(execute: item2)
    globalQueue.async(execute: item3)
    globalQueue.async(execute: item4)

    //自定义串行队列追加异步任务，按顺序打印
    let serialQueue = DispatchQueue(label: "serial")
    serialQueue.async(execute: item1)
    serialQueue.async(execute: item2)
    serialQueue.async(execute: item3)
    serialQueue.async(execute: item4)

    //自定义并行队列追加异步任务，随机打印
    let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
    concurrentQueue.async(execute: item1)
    concurrentQueue.async(execute: item2)
    concurrentQueue.async(execute: item3)
    concurrentQueue.async(execute: item4)

}
func hybridDemo(){
    //主队列同步异步混合，会引起死锁
    let mainQueue = DispatchQueue.main
    mainQueue.sync(execute: item1)//同步任务
    mainQueue.async(execute: item2)
    mainQueue.async(execute: item3)
    mainQueue.async(execute: item4)

    //全局队列同步异步混合，同步任务按顺序打印，异步任务随机打印
    //本例中同步任务执行完，才会执行后续的异步任务
    let globalQueue = DispatchQueue.global()
    globalQueue.sync(execute: item1)//同步任务
    globalQueue.async(execute: item2)
    globalQueue.async(execute: item3)
    globalQueue.async(execute: item4)

    //自定义串行队列同步异步混合，按顺序打印
    let serialQueue = DispatchQueue(label: "serial")
    serialQueue.sync(execute: item1)//同步任务
    serialQueue.async(execute: item2)
    serialQueue.async(execute: item3)
    serialQueue.async(execute: item4)

    //自定义并行队列同步异步混合，同步任务按顺序打印，异步任务随机打印
    //本例中同步任务执行完，才会执行后续的异步任务
    let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
    concurrentQueue.sync(execute: item1)//同步任务
    concurrentQueue.async(execute: item2)
    concurrentQueue.async(execute: item3)
    concurrentQueue.async(execute: item4)

}

}
