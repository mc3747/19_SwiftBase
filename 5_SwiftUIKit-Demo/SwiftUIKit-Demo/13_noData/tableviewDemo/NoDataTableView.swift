//
//  NoDataTableView.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/9/10.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
protocol TableEmptable {

    /// 列表是否为空
    var isEmptyData: Bool { get }
    /// 提供占位view,该view将占据tableView的tableFooterView
    var placeHolderView: UIView { get }
    /// 建议在reloadData前,调用该方法
    func setPlaceholderIfNeed()
}

extension TableEmptable where Self : UITableViewController {

    var isEmptyData: Bool  {
        let sectionCount: Int = numberOfSections(in: self.tableView)
        if sectionCount == 0 { return true }
        for section in 0 ..< sectionCount {
            if tableView(tableView, numberOfRowsInSection: section) != 0 { return false }
        }
        return true
    }
    
    var placeHolderView: UIView {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 375))
        imgView.image = UIImage(named: "image")
        return imgView
    }
    
    func setPlaceholderIfNeed() {
        if self.isEmptyData {
            self.tableView.tableFooterView = placeHolderView
        } else {
            self.tableView.tableFooterView = UIView()
        }
    }
}
