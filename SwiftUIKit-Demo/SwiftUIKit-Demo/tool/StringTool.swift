//
//  StringTool.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit
extension String{

    //创建一个函数来将控制器的名字转成具体的类
    func stringToVC() -> UIViewController? {
     //获取命名空间
     guard let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
      print("获取失败")
      return nil
     }
     //拼接完整的类
     guard let vcClass = NSClassFromString(namespace + "." + self) else {
      print("拼接失败")
      return nil
     }
     //转换成UIViewController
     guard let vcType = vcClass as? UIViewController.Type else {
      print("转换失败")
      return nil
     }
     //根据类型创建对应的控制器
     let vc = vcType.init()
     return vc
    }
}
