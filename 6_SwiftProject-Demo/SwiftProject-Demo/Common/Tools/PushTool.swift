//
//  PushTool.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/7/16.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class PushTool: NSObject {
//    指定字符串VC跳转,设置title
      static func pushVcByVcNameAndTitle(pushVcNameStr:String, pushVcTitleStr:String? = nil, weakVc:UIViewController?){
          guard let namespace = Bundle.main.infoDictionary?["CFBundleExecutable"]as? String else{
              return debugPrint("JYGetPushVc 调用 pushVcByVcNameAndTitle, namespace不存在")
          }
          let clsName = namespace + "." + pushVcNameStr
          guard let cls = NSClassFromString(pushVcNameStr) as? UIViewController.Type else{
              return debugPrint("JYGetPushVc 调用 pushVcByVcNameAndTitle, 项目中没有控制器 === \(pushVcNameStr)")
          }
          let vc = cls.init()
          if let titleStr = pushVcTitleStr{
              vc.title = titleStr
          }
          weakVc?.navigationController?.pushViewController(vc, animated: true)
      }
       
//     根据字符串获得对应控制器，使用的时候as, 传递参数
      static func getVc(pushVcNameStr:String) -> UIViewController?{
           
          guard let namespace = Bundle.main.infoDictionary?["CFBundleExecutable"]as? String else{
              debugPrint("JYGetPushVc 调用 getVc, namespace不存在")
              return nil
          }
          let clsName = namespace + "." + pushVcNameStr
         guard let cls = NSClassFromString(pushVcNameStr) as? UIViewController.Type else{
              debugPrint("JYGetPushVc调用getVc项目中没有 控制器 === \(pushVcNameStr)")
              return nil
          }
          return cls.init()
      }
    
}
