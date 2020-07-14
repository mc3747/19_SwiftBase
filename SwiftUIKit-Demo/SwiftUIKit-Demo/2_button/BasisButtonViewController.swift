//
//  BasisButtonViewController.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/14.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class BasisButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initBtn();
        
    }
    
    func initBtn(){
        let button1 = UIButton.init(type: .system)
        button1.frame = CGRect.init(x: 0, y: 200, width: 200, height: 100)
        button1.setTitle("这是无参的button", for: .normal)
        button1.addTarget(self, action:  #selector(btnClick1), for: .touchUpInside)
        self.view.addSubview(button1)
        
        let button2 = UIButton.init(type: .system)
        button2.frame = CGRect.init(x: 200, y: 200, width: 200, height: 100)
        button2.setTitle("这是有参的button", for: .normal)
        button2.addTarget(self, action:  #selector(btnClick2(button:)), for: .touchUpInside)
        self.view.addSubview(button2)
    }
   
    //按钮点击
       @objc func btnClick1() {
                print("没有参数");
            }
   //按钮点击
   @objc func btnClick2(button:UIButton) {
            button.tintColor = UIColor.init(red: CGFloat(Double(arc4random() % 255) / 255.0), green: CGFloat(Double(arc4random() % 255) / 255.0), blue: CGFloat(Double(arc4random() % 255) / 255.0), alpha: 1.0)
            print("有参数");
        }
    
    
}
