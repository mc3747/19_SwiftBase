//
//  BasisLayoutVC.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class BasisLayoutVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let titleArray:[String] = ["1_frame布局","2_snapkit基础","3_snapkit约束更新","4_snapkit约束优先级及动画","5_snapkit案例-登录界面","6_snapkit案例-计算器","7_yoga(flex布局)"]
        let pushVcName:[String] = ["","SnapKitVC_1","SnapKitVC_2","SnapKitVC_3","SnapKitVC_4","SnapKitVC_5",""]
        for (index,value) in titleArray.enumerated() {
            let button2:UIButton = {
                       let button = UIButton.init()
                button.frame = CGRect.init(x: 0, y: 100 + index * 60, width: Int(UIScreen.main.bounds.size.width) , height: 50)
                       button.setTitle(value, for: .normal)
                       button.backgroundColor = UIColor.red;
                       let targetName = "jump" + String(index + 1)
                       button.addTarget(self, action: Selector(targetName), for: .touchUpInside)
                       return button
                   }()
            self.view.addSubview(button2)
        }
        
    }
    
    @objc func jump1(){
        
    }
    @objc func jump2(){
        let vc = SnapKitVC_1()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func jump3(){
        let vc = SnapKitVC_2()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func jump4(){
        let vc = SnapKitVC_3()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func jump5(){
        let vc = SnapKitVC_4()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func jump6(){
        let vc = SnapKitVC_5()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func jump7(){
           
    }

}
