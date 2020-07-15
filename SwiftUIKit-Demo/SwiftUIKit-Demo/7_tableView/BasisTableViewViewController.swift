//
//  BasisTableViewViewController.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class BasisTableViewViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1:UIButton = {
            let button = UIButton.init()
            button.frame = CGRect.init(x: 0, y: 100, width: 200, height: 50)
            button.setTitle("1_默认Tableview", for: .normal)
            button.backgroundColor = UIColor.red;
            button.addTarget(self, action: #selector(jump1), for: .touchUpInside)
            return button
        }()
        self.view.addSubview(button1)
        
        let button2:UIButton = {
                   let button = UIButton.init()
                   button.frame = CGRect.init(x: 0, y: 170, width: 200, height: 50)
                   button.setTitle("2_自定义Tableview", for: .normal)
                   button.backgroundColor = UIColor.red;
                   button.addTarget(self, action: #selector(jump2), for: .touchUpInside)
                   return button
               }()
        self.view.addSubview(button2)
        
    }
    
    @objc func jump1(){
        //创建一个页面
        let destination = DefaultTableviewVC()
        //跳转
        self.navigationController?.pushViewController(destination, animated: true)
    }
   @objc func jump2(){
         //创建一个页面
         let destination = CustomizeTableviewVC()
         //跳转
         self.navigationController?.pushViewController(destination, animated: true)
     }

}
