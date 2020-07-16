//
//  CommonTabBarVC.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/7/16.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class CommonTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewController(controller: BasisPointVC(), title: "基础", defaultImg: UIImage(named:"shouye")!, selectorImg: UIImage(named:"shouyes")!)
        
        self.addChildViewController(controller: DesignStyleVC(), title: "模式", defaultImg: UIImage(named:"wode")!, selectorImg: UIImage(named:"wodes")!)
        
        self.addChildViewController(controller: DifficultPointVC(), title: "难点", defaultImg: UIImage(named:"shuju")!, selectorImg: UIImage(named:"shujus")!)
        
        self.addChildViewController(controller: AdvancedPointVC(), title: "拔高", defaultImg: UIImage(named:"zhibiao")!, selectorImg: UIImage(named:"zhibiaos")!)
    }
    
    func addChildViewController(controller: UIViewController, title: String, defaultImg: UIImage, selectorImg: UIImage){
         
         controller.tabBarItem = UITabBarItem(title: title, image: defaultImg.withRenderingMode(.alwaysOriginal), selectedImage: selectorImg.withRenderingMode(.alwaysOriginal))
        
        controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hexString: "357EE4"), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30)], for: .selected)
         
         let nav = UINavigationController(rootViewController: controller)
        
         self.addChild(nav)
     }
  

}
