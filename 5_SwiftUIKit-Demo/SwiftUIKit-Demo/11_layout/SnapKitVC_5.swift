//
//  SnapKitVC_5.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
/*
案例:计算器
*/
class SnapKitVC_5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

   //申明区域，keyboardView是键盘区域
       let keyboardView =  UIView()
       keyboardView.backgroundColor = UIColor(red:212/255, green:213/255, blue:216/255,
                                              alpha:1)
       self.view.addSubview(keyboardView)
        
       //键盘区域约束
       keyboardView.snp.makeConstraints { (make) -> Void in
            
           make.bottom.equalTo(self.view.snp.bottom)
           make.left.right.equalTo(self.view)
           make.height.equalTo(self.view.snp.width).multipliedBy(1.25)
       }
        
       //displayView是显示区
       let displayView =  UIView()
       displayView.backgroundColor = UIColor.black
       self.view.addSubview(displayView)
        
       //显示区域约束
       displayView.snp.makeConstraints { (make) -> Void in
           make.top.equalTo(self.view.snp.top)
           make.bottom.equalTo(keyboardView.snp.top)
           make.left.right.equalTo(self.view)
       }
        
       //设置显示位置的数字为0
       let displayNum =  UILabel()
       displayNum.text = "0"
       displayNum.font = UIFont(name:"HeiTi SC", size:70)
       displayNum.textColor = UIColor.white
       displayNum.textAlignment = .right
       displayView.addSubview(displayNum)
        
       //数字标签约束
       displayNum.snp.makeConstraints { (make) -> Void in
           make.left.right.equalTo(displayView).offset(-10)
           make.bottom.equalTo(displayView).offset(-10)
       }
        
       //定义键盘键名称（？号是占位符，代表合并的单元格）
       let keys = ["AC","+/-","%","÷"
           ,"7","8","9","x"
           ,"4","5","6","-"
           ,"1","2","3","+"
           ,"0","?",".","="]
        
       //保存所有的按钮
       var keyViews = [UIButton]()
        
       //循环添加按钮
       for i in 0..<5{
           for j in 0..<4 {
               let indexOfKeys = i * 4 + j
               let key = keys[indexOfKeys]
                
               //键样式
               let keyView =  UIButton(type:.custom)
               keyboardView.addSubview(keyView)
               keyViews.append(keyView)
               keyView.setTitleColor(UIColor.black, for: .normal)
               keyView.setTitle(key, for: .normal)
               keyView.layer.borderWidth = 0.5
               keyView.layer.borderColor = UIColor.black.cgColor
               keyView.titleLabel?.font = UIFont(name:"Arial-BoldItalicMT", size:30)
                
               //处理合并单元格(不用添加到界面上，也不用添加约束)
               if key == "?"{
                   keyView.removeFromSuperview()
                   continue
               }
                
               //设置按键约束
               keyView.snp.makeConstraints { (make) -> Void in
                   //添加高度约束
                   make.height.equalTo(keyboardView.snp.height).multipliedBy(0.2)
                    
                   //添加宽度约束
                   if key == "0" {
                       //处理 0
                       make.width.equalTo(keyboardView.snp.width).multipliedBy(0.5)
                   }else {
                       //正常的单元格
                       make.width.equalTo(keyboardView.snp.width).multipliedBy(0.25)
                   }
                    
                   //添加垂直位置约束
                   if i == 0{
                       make.top.equalTo(0)
                       keyView.backgroundColor = UIColor(red:201/255, green:202/255,
                                                         blue:204/255, alpha:1)
                   }else{
                       make.top.equalTo(keyViews[indexOfKeys-4].snp.bottom)
                   }
                    
                   //添加水平位置约束
                   switch (j) {
                   case 0:
                       make.left.equalTo(keyboardView.snp.left)
                   case 1:
                       make.right.equalTo(keyboardView.snp.centerX)
                   case 2:
                       make.left.equalTo(keyboardView.snp.centerX)
                   case 3:
                       make.right.equalTo(keyboardView.snp.right)
                       keyView.backgroundColor = UIColor(red:249/255, green:138/255,
                                                         blue:17/255, alpha:1)
                   default:
                       break
                   }
               }
           }
       }
   }
    

}
