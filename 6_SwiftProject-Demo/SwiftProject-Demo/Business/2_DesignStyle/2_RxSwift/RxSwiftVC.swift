//
//  RxSwiftVC.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/7/16.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
@objc (RxSwiftVC)
class RxSwiftVC: CommonTableViewVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        self.title = "RxSwift"
        self.titleItems = ["1_RxSwift概念","2_RxSwift操作符","3_RxSwift的UI","4_RxSwift案例"]
        self.vcItems = ["RxSwift1_ConceptVC","RxSwift2_OperatorVC","RxSwift3_UIVC","RxSwift4_DemoVC"]
    }
    

   

}
