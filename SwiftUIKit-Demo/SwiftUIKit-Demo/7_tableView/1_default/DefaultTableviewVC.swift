//
//  DefaultTableviewVC.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit


class DefaultTableviewVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableview01 = UITableView()
    var rowNum = 10//tableView的row的个数
    var cellId = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableview()
    }
    
    func initTableview(){
        self.tableview01 = UITableView.init(frame: self.view.frame, style: .plain)
        self.tableview01.delegate = self;
        self.tableview01.dataSource = self;
        self.view.addSubview(tableview01)
    }
    //行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNum;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //如果使用后边带orIndexPath:indexPath的方法,会崩溃
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if(cell == nil){
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellId);
        }
        cell?.selectionStyle = .none
        cell?.textLabel?.text = "测试"
        return cell!
        
    }
    //高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56.0
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
