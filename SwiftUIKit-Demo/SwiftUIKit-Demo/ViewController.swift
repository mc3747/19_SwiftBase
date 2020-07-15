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
        let titleArray:[String] = ["1_view","2_button","3_imageView","4_text","5_alert","6_stack",
        "7_tableview","8_collectionView","9_tabBar","10_naviBar","11_layout","12_动画"]
        
        for (index,title) in titleArray.enumerated() {
            let screenSize = UIScreen.main.bounds.size
            let jumpBtn = UIButton(type: .system)
            jumpBtn.setTitle(title, for: .normal)
            jumpBtn.frame = CGRect(x:  50, y: 100 + index * 45, width: Int(screenSize.width)  - 100, height: 40);
            jumpBtn.backgroundColor = UIColor(red: 50 / 255, green: 123 / 255, blue:  255 / 255, alpha: 1)
            jumpBtn.setTitleColor(UIColor.white, for: .normal)
            //按钮绑定事件，点击时执行
                //2种绑定事件的方法
//            jumpBtn.addTarget(self, action: #selector(pageJump2), for: .touchUpInside)
            let targetName = "pageJump" + String(index + 1)
            jumpBtn.addTarget(self, action: Selector(targetName), for: .touchUpInside)
            self.view.addSubview(jumpBtn)
            
        }
    }
    
     //1_present到view
     @objc func pageJump1() {
         let destination = BasisViewController()
         destination.message = "传递的信息"
         self.present(destination, animated: true, completion: nil)
     }
    
    //2_push到button
     @objc func pageJump2() {
          let destination = BasisButtonViewController()
          self.navigationController?.pushViewController(destination, animated: true)
    }
    //7_push到button
    @objc func pageJump7() {
//           let str = "BasisTableViewViewController"
//            if let vc=str.stringToVC(){
//                self.present(vc, animated: true, completion: nil)
//           }
         let destination = BasisTableViewViewController()
         self.navigationController?.pushViewController(destination, animated: true)
     }
    //11_push到layout
    @objc func pageJump11(){
        let destination = BasisLayoutVC()
        self.navigationController?.pushViewController(destination, animated: true)
    }
}

