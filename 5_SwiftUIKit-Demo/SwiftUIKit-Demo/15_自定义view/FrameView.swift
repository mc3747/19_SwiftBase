//
//  FrameView.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/11/27.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit

class FrameView: UIView {
    private var isFirstLayout: Bool = true
    private var containerView : UIView = UIView()
    
    //MARK: - 1_init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    //MARK: - 2_private method
    ///公共初始化(只创建，不管位置，这里不要调用self的布局属性，是不准确的)
    fileprivate func commonInit() -> Void {
        containerView.backgroundColor = UIColor.yellow
        self.addSubview(containerView)
    }
    
    //MARK: - 3_private method
    override func layoutSubviews() {
        super.layoutSubviews()
        if isFirstLayout{ //保证只初始化布局一次
            containerView.frame = self.bounds  //这里的bounds是准确的
        }
        isFirstLayout = false
    }
    
}
