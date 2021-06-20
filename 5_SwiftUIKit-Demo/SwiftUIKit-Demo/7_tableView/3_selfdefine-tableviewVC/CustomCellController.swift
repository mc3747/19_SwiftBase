//
//  CustomCellController.swift
//  YYTableView
//
//  Created by Domo on 2018/6/27.
//  Copyright © 2018年 知言网络. All rights reserved.
//

import UIKit
/*
 nodata的思路

 通过判断 UITableViewDataSource数据源方法 numberOfSection 和 numberOfRowsInSection来判断是否有cell要被加载.
 当有cell时,设置tableView的tableFooterView = UIView(),不显示footer;当cell为空时,设置tableFooterView = CustomPlaceHolderView()

 */
class CustomCellController: UITableViewController,TableEmptable {
    var data:[String] = ["kk0","kk1"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let addE:UIBarButtonItem = UIBarButtonItem.init(title: "加", style: .plain, target: self, action: #selector(add))
        let minusE:UIBarButtonItem  = UIBarButtonItem.init(title: "减", style: .plain, target: self, action: #selector(minus))
        self.navigationItem.rightBarButtonItems = [addE,minusE]
        /// 设置占位图
        setPlaceholderIfNeed()
    }
    @objc func add(){
        self.data.append("kk\(data.count)")
         setPlaceholderIfNeed()
        self.tableView.reloadData()
    }
    @objc func minus(){
        if self.data.count > 0 {
             self.data.remove(at: data.count - 1)
        }
         setPlaceholderIfNeed()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CustomCell"
        let cell = CustomTableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: identifier)
        cell.setValueForCell()
        return cell
    }
    
    
}
