//
//  DifficultPointVC.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/7/16.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
/*
 3.难点
    webview
    多线程
    持久化(磁盘缓存和内存缓存)
    文件问题
    网络(加密,数据解析,字典转模型,网络)
    
    
*/

class DifficultPointVC: CommonTableViewVC {

    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "难点"
        self.titleItems = ["多线程","定时器"]
        self.vcItems = ["MultiThreadVC","TimerSummaryVC"]
    }
    


}
