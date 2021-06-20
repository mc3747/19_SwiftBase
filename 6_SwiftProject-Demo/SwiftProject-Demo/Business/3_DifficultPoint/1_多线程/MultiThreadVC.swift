//
//  MultiThreadVC.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/11/22.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit
@objc (MultiThreadVC)
class MultiThreadVC: CommonViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        GCDTest1()
//        GCDTest2()
        GCDTest3()
    }
    // MARK: - 1_开线程异步执行完耗时代码，返回主线程刷新UI
    func GCDTest1() {
            DispatchQueue.global().async {//并行、异步
                 print("开一条全局队列异步执行任务")
                DispatchQueue.main.async {//串行、异步
                    print("在主队列执行刷新界面任务")
                }
            }
       }
    // MARK: - 2_等待异步执行多个任务后, 再执行下一个任务
    func GCDTest2() {
        let myQueue = DispatchQueue(label: "com.myQueue", qos: .default, attributes: .concurrent, autoreleaseFrequency: .workItem, target: nil)//并行队列
        myQueue.async {//任务一
            for _ in 0...10 {
                 print("任务1......")
            }
        }
        myQueue.async {
            for _ in 0...5 {
                print("任务2++++++")
            }
        }
        // barrier 会等待上面执行完毕再执行下面的，会阻塞当前线程
        myQueue.async(group: nil, qos: .default, flags: .barrier, execute: {//2.
            print("000000")
        })
        
        myQueue.async {
            print("111111")
        }
    }
    // MARK: - 3_使用线程组，多个任务执行完毕后，再执行后面
    func GCDTest3(){
        let group = DispatchGroup()
        for item in [1,2,3] {
            DispatchQueue.global().async {
                print("子任务'\(item)'")
            }
        }
        group.notify(queue: DispatchQueue.main) {
            //更新列表
            print("结果：")
        }
    }
}
