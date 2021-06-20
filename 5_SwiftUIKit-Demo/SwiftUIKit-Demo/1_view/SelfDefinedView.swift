//
//  SelfDefinedView.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/14.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
/*
1_视图隐藏相关
    alpha
    isHidden是否隐藏
    isOpaque是否不透明(优化性能使用:View不透明时，isOpaque需要设置为true，来优化性能，有透明度时，isOpaque需要设置为false)
 2_tintColor && tintAdjustmentMode && tintColorDidChange
    tintColor会影响到以视图为根视图的整个视图层次结构。主要是改变系统的某些控件
    tintColorDidChange:假如想要更改label的文字颜色，或者某些View的背景颜色等，可以监听 tintColorDidChange
    tintAdjustmentMode
            // 视图的着色调整模式与父视图一致
           case automatic
           // 视图的tintColor属性返回UIExtendedSRGBColorSpace 颜色空间的颜色
           case normal
           // 视图的tintColor属性返回 UIExtendedGrayColorSpace 颜色空间的颜色
           case dimmed
 3_mask属性
 4_事件相关
    // 设置视图的可交互性
    open var isUserInteractionEnabled: Bool
    // 设置是否支持多点触控
    open var isMultipleTouchEnabled: Bool
    // 设置控件接受事件时的排他性
    open var isExclusiveTouch: Bool
//5_位置属性:frame && bounds && center
//6_变换属性:transform
//7_自动布局
    // 控制autoresizingMask模式的开启与关闭
    open var autoresizesSubviews: Bool
    // 子视图相对于父视图的调整模式
    open var autoresizingMask: UIViewAutoresizing
    // 视图计算最合适的size（容纳子视图）并返回
    open func sizeThatFits(_ size: CGSize) -> CGSize
    // 计算合适Size，并更改本视图的size去包含子视图
    open func sizeToFit()
    // 当一个view的bounds变化的时候用于决定其内容怎么变化(变化模式)
    open var contentMode: UIViewContentMode

 
*/
class TestView : UIView {
    
    // 纯代码走这个
    override init(frame: CGRect) {
        super.init(frame: frame);
        print("执行了 init(frame: CGRect)")
    }
        
    // 使用 Interface Builder 构造界面走这个
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        print("执行了 init?(coder aDecoder: NSCoder)")
    }
    
    // 重写布局
    override func layoutSubviews() {
//        self.showImageView?.frame = self.frame
    }

}
