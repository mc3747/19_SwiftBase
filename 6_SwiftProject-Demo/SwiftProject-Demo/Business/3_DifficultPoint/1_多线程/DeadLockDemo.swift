//
//  DeadLockDemo.swift
//  SwiftProject-Demo
//
//  Created by kk on 2021/8/11.
//  Copyright © 2021 马成. All rights reserved.
//

import Foundation
class DeadLockDemo {
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
    func deadLock1(){
        //会引起死锁
        let mainQueue = DispatchQueue.main
        mainQueue.async(execute: item1)
        mainQueue.async(execute: item2)
        mainQueue.async(execute: item3)
        mainQueue.sync(execute: item4)//同步任务
        
    }
    func deadLock2(){
        //依然会引起死锁
        let mainQueue = DispatchQueue.main
        mainQueue.sync(execute: item1)//同步任务
        mainQueue.async(execute: item2)
        mainQueue.async(execute: item3)
        mainQueue.async(execute: item4)
        
    }
    func deadLock3(){
        let serialQueue = DispatchQueue(label: "serial")
        //死锁
        serialQueue.sync {
            print("同步执行  thread: \(Thread.current)")
            serialQueue.sync {
                print("同步执行  thread: \(Thread.current)")
            }
        }
        //死锁
        serialQueue.async {
            print("异步执行  thread: \(Thread.current)")
            serialQueue.sync {
                print("同步执行  thread: \(Thread.current)")
            }
        }
        //不会引起死锁
        serialQueue.sync {
            print("同步执行  thread: \(Thread.current)")
            serialQueue.async {
                print("异步执行  thread: \(Thread.current)")
            }
        }
        //不会引起死锁
        serialQueue.async {
            print("异步执行  thread: \(Thread.current)")
            serialQueue.async {
                print("异步执行  thread: \(Thread.current)")
            }
        }
        
    }
    
}
