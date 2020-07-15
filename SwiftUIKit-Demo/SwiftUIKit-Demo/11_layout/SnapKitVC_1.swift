//
//  SnapKitVC.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
import SnapKit

/*
 ✅:snapkit基本使用
1_视图属性:
 | 视图属性（ViewAttribute） | 布局属性（NSLayoutAttribute） |
 | view.snp.left | NSLayoutAttribute.Left |
 | view.snp.right | NSLayoutAttribute.Right |
 | view.snp.top | NSLayoutAttribute.Top |
 | view.snp.bottom | NSLayoutAttribute.Bottom |
 | view.snp.leading | NSLayoutAttribute.Leading |
 | view.snp.trailing | NSLayoutAttribute.Trailing |
 | view.snp.width | NSLayoutAttribute.Width |
 | view.snp.height | NSLayoutAttribute.Height |
 | view.snp.centerX | NSLayoutAttribute.CenterX |
 | view.snp.centerY | NSLayoutAttribute.CenterY |
 | view.snp.baseline | NSLayoutAttribute.Baseline |
2_视图方法
    2.1_先添加再约束
  使用 snp.makeConstraints 方法的元素必须事先添加到父元素的中，例如：self.view.addSubview(view)
    2.2_基本使用
 .equalTo：等于
 .lessThanOrEqualTo：小于等于
 .greaterThanOrEqualTo：大于等于
 语法一般是： make.equalTo 或 make.greaterThanOrEqualTo 或 make.lessThanOrEqualTo + 倍数和位移修正。
    2.3_简略写法
 make.left.greaterThanOrEqualTo(label)相当于make.left.greaterThanOrEqualTo(label.snp.left)
    2.4_设置width、height属性为常量
        make.height.equalTo(20)
    2.5_设置left、right、top、centerX、centerY等其他属性为常量,表示他们相对于父容器的相对约束条件
        make.left.equalTo(20)
    2.6_edge边缘
        make.edges.equalTo(view2)
    2.7_size尺寸
        make.size.greaterThanOrEqualTo(titleLabel)
    2.8_center
        make.center.equalTo(button1)
    2.9_内位修正
        make.edges.equalTo(boxOutter).inset(UIEdgeInsetsMake(10, 15, 20, 25))
    2.10_外位修正
        make.size.equalTo(boxOutter).offset(-50)
    2.11_倍率修正
        make.center.equalTo(boxOutter)
        make.size.equalTo(boxOutter).multipliedBy(0.5)
*/
class SnapKitVC_1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.outDemo();
        self.inDemo();
        self.mutiDemo();
    }
//外部修正_top,bottom等
    func outDemo()  {
        //外部方块
        let boxOutter = UIView()
        //内部方块
        let boxInner = UIView()
        //添加
        boxOutter.backgroundColor = UIColor.orange
        self.view.addSubview(boxOutter)
        boxInner.backgroundColor = UIColor.green
        boxOutter.addSubview(boxInner)
        //约束
        boxOutter.snp.makeConstraints { (make) -> Void in
                   make.width.height.equalTo(200)
                   make.top.equalTo(self.view)
               }
       boxInner.snp.makeConstraints { (make) -> Void in
           make.width.height.equalTo(100)
           make.right.equalTo(0)
           make.bottom.equalTo(0)
       }
    }
//内部修正:edges
     func inDemo(){
        //外部方块
        let boxOutter = UIView()
        //内部方块
        let boxInner = UIView()
        boxOutter.backgroundColor = UIColor.orange
        self.view.addSubview(boxOutter)
        boxInner.backgroundColor = UIColor.green
        boxOutter.addSubview(boxInner)
        
       boxOutter.snp.makeConstraints { (make) -> Void in
           make.width.height.equalTo(200)
        make.top.equalTo(self.view).offset(210)
       }
        
       boxInner.snp.makeConstraints { (make) -> Void in
        make.edges.equalTo(boxOutter).inset(UIEdgeInsets(top: 10, left: 15, bottom: 20, right: 25))
       }
    }
//倍率修正
    func mutiDemo(){
        //外部方块
        let boxOutter = UIView()
        //内部方块
        let boxInner = UIView()
        boxOutter.backgroundColor = UIColor.orange
        self.view.addSubview(boxOutter)
        boxInner.backgroundColor = UIColor.green
        boxOutter.addSubview(boxInner)
               
        boxOutter.snp.makeConstraints { (make) -> Void in
              make.width.height.equalTo(200)
            make.top.equalTo(self.view).offset(420)
        }
               
        boxInner.snp.makeConstraints { (make) -> Void in
              make.center.equalTo(boxOutter)
              // make width = superview.width - 50, height = superview.height - 50
              make.size.equalTo(boxOutter).offset(-50)
        }
    }
    
}
