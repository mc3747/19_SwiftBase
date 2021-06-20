//
//  SnapKitVC_2.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
import SnapKit
/*
✅:snapkit约束的删除,更新,重做
*/
class SnapKitVC_2: UIViewController {
    var sizeConstraint1 : Constraint?
    var sizeConstraint2 : Constraint?
    var box1 : UIView?
    var box2 : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //点击按钮
        let titleArray:[String] = ["1_删除约束","2_更新约束1","3_更新约束2","4_重做约束"]
          for (index,value) in titleArray.enumerated() {
              let button2:UIButton = {
                         let button = UIButton.init()
                         button.frame = CGRect.init(x: 0, y: 100 + index * 60, width: 150, height: 50)
                         button.setTitle(value, for: .normal)
                         button.backgroundColor = UIColor.red;
                         let targetName = "jump" + String(index + 1)
                         button.addTarget(self, action: Selector(targetName), for: .touchUpInside)
                         return button
                     }()
              self.view.addSubview(button2)
          }
        
        self.deleteConstraintDemo()
        self.updateConstraintDemo1()
        self.updateConstraintDemo2()
        self.remakeConstraintDemo()
    }
    
//1_删除约束
    func deleteConstraintDemo(){
        let  box = UIView()
        box.backgroundColor = UIColor.red
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) in
            self.sizeConstraint1 = make.width.height.equalTo(100).constraint
            make.center.equalTo(self.view)
        }
    }
//2_更新约束1
    func updateConstraintDemo1(){
        let  box = UIView()
        box.backgroundColor = UIColor.yellow
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) -> Void in
           make.width.height.equalTo(150)
           make.centerX.equalTo(self.view)
           self.sizeConstraint2 = make.top.equalTo(self.view).offset(40).constraint
        }
    }
//3_更新约束2
    func updateConstraintDemo2(){
        let  box = UIView()
        box.backgroundColor = UIColor.green
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self.view)
            make.height.equalTo(150)
            make.bottom.equalTo(self.view)
        }
        self.box1 = box
        
    }
//4_重做约束
    func remakeConstraintDemo(){
        let  box = UIView()
        box.backgroundColor = UIColor.orange
        self.view.addSubview(box)
        box.snp.makeConstraints { (make) -> Void in
              make.width.height.equalTo(150)
              make.centerX.equalTo(self.view)
        }
        self.box2 = box
    }
    
    
    //移除约束
    @objc func jump1(){
        self.sizeConstraint1?.deactivate()
    }
    //更新约束1
    @objc func jump2(){
        self.sizeConstraint2?.update(offset: 200)
    }
    //更新约束2
    @objc func jump3(){
        self.box1?.snp.updateConstraints{ (make) -> Void in
             //视图宽度与屏幕等宽
             make.width.equalTo(200)
         }
         super.updateViewConstraints()
    }
    //重做约束
    @objc func jump4(){
        self.box2?.snp.remakeConstraints { (make) -> Void in
                 make.width.height.equalTo(100)
        }
    }
}
