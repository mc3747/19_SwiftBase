//
//  GridView.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/10/27.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class GridView: UIView {
    
    /** 列数  */
    var colums:Int = 3
    
    /** 左边间距  */
    var leftMargin:CGFloat = 0.0
    
    /** 右边间距  */
    var rightMargin:CGFloat = 0.0
    
    /** 上边间距  */
    var topMargin:CGFloat = 0.0
    
    /** 底部边间距  */
    var bottomMargin:CGFloat = 0.0
    
    /** colums(每一列之间的间距)间距  */
    var columsMargin:CGFloat = 0.0
    
    /** row(每一行之间的间距)间距  */
    var rowMargin:CGFloat = 0.0
    
    /** 单元View的高度  */
    var unitViewHeight:CGFloat = 50.0
    
    /**  数据源  */
    var titleArray:[String]? {
        
        didSet {
            
            //这里我们需要创建UnitView  对象了
            
            for item in titleArray! {
                
                let tempView = UnitView()
                self.addSubview(tempView)
                unitViewArray.append(tempView)
                tempView.text = item
                tempView.backgroundColor = .white
            }
            
        }
        
        
    }
    
    var unitViewArray:[UnitView] = [UnitView]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initData()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let itemW = (self.bounds.size.width - self.leftMargin - self.rightMargin - (self.colums - 1).wd_CGFloat * self.columsMargin) / (self.colums.wd_CGFloat)
        
        let itemH = self.unitViewHeight
        
        var row = 0,colum = 0
        
        
        for i in 0...self.unitViewArray.count - 1 {
            
            row = i / self.colums
            colum = i % self.colums
            
            self.unitViewArray[i].snp.makeConstraints { (make) in
                
                make.leading.equalTo(self).offset((self.leftMargin + (self.columsMargin + itemW) * colum.wd_CGFloat))
                make.top.equalTo(self).offset((self.topMargin + (itemH + self.rowMargin)*row.wd_CGFloat ))
                make.width.equalTo(itemW)
                make.height.equalTo(itemH)
                
                if i == self.unitViewArray.count - 1 {
                    make.bottom.equalTo(self.snp.bottom).offset(-1.wd_CGFloat * self.bottomMargin)
                    
                }
            }
        }
    }
    
}

extension GridView {
    
    func initData() -> () {
        
        self.colums = 3
        self.leftMargin = 10.0
        self.rightMargin = 10.0
        self.topMargin = 10.0
        self.bottomMargin = 10.0
        self.columsMargin = 10.0
        self.rowMargin = 10.0
        
    }
    
}
