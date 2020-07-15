//
//  BasisLayoutVC.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class BasisLayoutVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let titleArray:[String] = ["1_frame布局","2_snapkit","3_yoga(flex布局)"]
        for (index,value) in titleArray.enumerated() {
            let button2:UIButton = {
                       let button = UIButton.init()
                       button.frame = CGRect.init(x: 0, y: 100 + index * 60, width: 200, height: 50)
                       button.setTitle(value, for: .normal)
                       button.backgroundColor = UIColor.red;
                       button.addTarget(self, action: #selector(jump2), for: .touchUpInside)
                       return button
                   }()
            self.view.addSubview(button2)
        }
        
    }
    
    @objc func jump1(){
        
    }
    @objc func jump2(){
        let vc = SnapKitVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func jump3(){
        
    }
   

}
