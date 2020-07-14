//
//  BasisViewController.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/14.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class BasisViewController: UIViewController {
    
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //1_直接写view
             let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
             view.backgroundColor = UIColor.red
             self.view.addSubview(view)
        //2_自定义view
              let testView = TestView.init(frame: CGRect.init(x: 200, y: 100, width: 100, height: 100))
             testView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
             self.view.addSubview(testView)
       
        
        //present的按钮
            initBtn()
            print(message!)
    }
    //初始化返回按钮，点击按钮返回主页面。
     func initBtn() {
         let screenSize = UIScreen.main.bounds.size
         let jumpBtn = UIButton(type: .system)
         jumpBtn.setTitle("返回", for: .normal)
        jumpBtn.frame = CGRect(x: screenSize.width / 2 - 50, y: 50 , width: 100, height: 30)
         jumpBtn.backgroundColor = UIColor(red: 50 / 255, green: 123 / 255, blue:  255 / 255, alpha: 1)
         jumpBtn.setTitleColor(UIColor.white, for: .normal)
         //按钮绑定事件
         jumpBtn.addTarget(self, action: #selector(pageReturn), for: .touchDown)
         self.view.addSubview(jumpBtn)
     }
     
     @objc func pageReturn() {
         //返回主页面
         self.dismiss(animated: true, completion: nil)
     }
    

}
