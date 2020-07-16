//
//  DesignerPatternVC.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/7/16.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
/*
 设计模式:
 框架
 RXSwift
*/
class DesignStyleVC: CommonTableViewVC {

    override func viewDidLoad() {
         super.viewDidLoad()
         self.title = "设计模式"
         self.titleItems = ["设计模式","RxSwift"]
         self.vcItems = ["DesignPatternVC","RxSwiftVC"]
    }
    
   
 

}
