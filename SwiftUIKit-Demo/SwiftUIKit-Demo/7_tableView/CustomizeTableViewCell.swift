//
//  CustomizeTableViewCell.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class CustomizeTableViewCell: UITableViewCell {
    
       static let reuseIdentifier = "TestTableViewCell"
        let indicateLabel = UILabel()
        let dataLabel = UILabel()
        var data: String! {
            didSet {
                display()
            }
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
                
        indicateLabel.frame = CGRect(x: 0, y: 30, width: 100, height: 40)
        dataLabel.frame = CGRect(x: 100, y: 30, width: 100, height: 40)
        
        contentView.addSubview(indicateLabel)
        contentView.addSubview(dataLabel)
    }
    
  func display() {
        
        //需注意的是在data为空的情况下并没有对dataLabel进行赋值
        if data == "" {
            indicateLabel.text = "暂无数据"
        } else {
            indicateLabel.text = "有数据"
            dataLabel.text = data
        }
    }
}
