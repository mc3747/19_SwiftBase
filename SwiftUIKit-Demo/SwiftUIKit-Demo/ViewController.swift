//
//  ViewController.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/14.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds.size
        initBtn(frame: CGRect(x: screenSize.width / 2 - 50, y: screenSize.height - 50, width: 100, height: 30))
    }
    
   //初始化按钮，点击按钮跳转页面
    func initBtn(frame:CGRect) {
         let jumpBtn = UIButton(type: .system)
         jumpBtn.setTitle("跳转", for: .normal)
        jumpBtn.frame = frame;
         jumpBtn.backgroundColor = UIColor(red: 50 / 255, green: 123 / 255, blue:  255 / 255, alpha: 1)
         jumpBtn.setTitleColor(UIColor.white, for: .normal)
         //按钮绑定事件，点击时执行
         jumpBtn.addTarget(self, action: #selector(pageJump2), for: .touchUpInside)
         self.view.addSubview(jumpBtn)
     }
     
     @objc func pageJump1() {
         //创建一个页面
         let destination = BasisViewController()
         //取目标页面的一个变量进行赋值，以属性的方式进行传值。
         destination.message = "传递的信息"
         //跳转
         self.present(destination, animated: true, completion: nil)
     }
    
     @objc func pageJump2() {
          //创建一个页面
          let destination = BasisButtonViewController()
          //跳转
          self.navigationController?.pushViewController(destination, animated: true)
//        self.navigationController?.show(destination, sender: self)
    }
}

