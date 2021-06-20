//
//  DrawRectView.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/11/29.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit

class MColorArrow : UIView {
    public var pageNum: Int = 0{
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // 1、 获取上下文对象
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // 2、 绘制路径（相当于前面创建路径并添加路径到图形上下文两步操作）
        if pageNum == 0 {
            context.move(to: CGPoint(x: rect.maxX / 2, y: rect.maxY / 6))
            context.addLine(to: CGPoint(x: (rect.maxX * 3 / 4 ), y: rect.maxY / 2))
            context.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY * 5 / 6))
            
        }else{
            context.move(to: CGPoint(x: rect.maxX / 2, y: rect.maxY / 6))
            context.addLine(to: CGPoint(x: (rect.maxX  / 4 ), y: rect.maxY / 2))
            context.addLine(to: CGPoint(x: rect.maxX / 2, y: rect.maxY * 5 / 6))
            
        }
        //封闭路径:直接调用路径封闭方法
//        context.closePath()
        
        // 3、 设置图形上下文属性
        UIColor.red.setStroke()
        UIColor.clear.setFill()
        
        // 4、 绘制路径
        context.drawPath(using: CGPathDrawingMode.fillStroke)
        
    }
}
