//
//  TimerSummaryVC.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/12/27.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit
class TimerSummaryVC: CommonViewController {
    lazy private var timerLabel:UILabel = {
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        $0.backgroundColor = .orange
        return $0
    }(UILabel())
    
    lazy private var gcdLabel:UILabel = {
        $0.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        $0.backgroundColor = .systemPink
        return $0
    }(UILabel())
    
    var killTimer:ZJKillTimer!
    
    //基本使用
    
    //Timer的封装
    //seconds根据实际计算（活动结束时间减去当前时间得出的var killTimer:ZJKillTimer!秒数）
    
    //GCD的封装
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(timerLabel)
        self.view.addSubview(gcdLabel)
        
        self.killTimer =  ZJKillTimer(seconds: 43200, callBack: {[weak self] (text) in
            self?.timerLabel.text = text
        })
        
        MCGCDTimer.shared.scheduledDispatchTimer(WithTimerName: "GCDTimer", timeInterval: 1, queue: .main, repeats: true) {
            self.doSomething()
        }
    }
    //打印当前时间
    @objc private func doSomething() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "zh-Hans")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let currentTime = dateFormatter.string(from: Date())
        gcdLabel.text = currentTime
    }
}
