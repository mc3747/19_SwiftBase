//
//  SnapKitVC_3.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
import SnapKit
/*
✅:snapkit约束的优先级
    通过 priority() 方法我们可以设置任意的优先级，接受的参数是0-1000的数字。比如：priority(600)。
    如果不设置的话，默认的优先级是1000。
 snapkit约束的动画效果
*/
class SnapKitVC_3: UIViewController {
    lazy var box = UIView()
    var scacle = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapSingle=UITapGestureRecognizer(target:self,action:#selector(tapSingleDid))
        tapSingle.numberOfTapsRequired=1
        tapSingle.numberOfTouchesRequired=1
        self.view.addGestureRecognizer(tapSingle)
         
        box.backgroundColor = UIColor.orange
        self.view.addSubview(box)
         
        box.snp.makeConstraints { (make) -> Void in
            //视图居中
            make.center.equalTo(self.view)
            //初始宽、高为100（优先级低）
            make.width.height.equalTo(100 * self.scacle).priority(250)
            //最大尺寸不能超过屏幕
            make.width.height.lessThanOrEqualTo(self.view.snp.width)
            make.width.height.lessThanOrEqualTo(self.view.snp.height)
        }
    }
    
    //视图约束更新
    override func updateViewConstraints() {
        self.box.snp.updateConstraints{ (make) -> Void in
            //放大尺寸（优先级低）
            make.width.height.equalTo(100 * self.scacle).priority(250)
        }
         
        super.updateViewConstraints()
    }
     
    //点击屏幕
    @objc func tapSingleDid(){
        self.scacle += 0.5
        //告诉self.view约束需要更新
        self.view.setNeedsUpdateConstraints()
        //动画
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
}
