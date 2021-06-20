//
//  NoDataTableviewDemo.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/9/10.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
class NoDataTableviewDemo: BaseViewController,UITableViewDelegate,UITableViewDataSource,HZTableViewPlaceHolderDelegate {
    
    //遵守协议,返回
    func makePlaceHolderView() -> UIView? {
        return HZPlaceHolderView.createWithoutButton("空数据", image: UIImage.init(named: "image") as Any)
    }
    
    var data:[String] = ["kk0","kk1"]
    
    private lazy var tableView: UITableView = {
        let item = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .plain)
        self.view.addSubview(item)
        item.delegate = self
        item.dataSource = self
        item.tableFooterView = UIView()
        item.separatorStyle = .none
        return item
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addE:UIBarButtonItem = UIBarButtonItem.init(title: "加", style: .plain, target: self, action: #selector(add))
        let minusE:UIBarButtonItem  = UIBarButtonItem.init(title: "减", style: .plain, target: self, action: #selector(minus))
        self.navigationItem.rightBarButtonItems = [addE,minusE]
        self.view.addSubview(tableView)
        self.title = "无数据-tableview"
    }
    @objc func add(){
        self.data.append("kk\(data.count)")
        self.tableView.hz_reloadData()
    }
    @objc func minus(){
        if self.data.count > 0 {
            self.data.remove(at: data.count - 1)}
        
        self.tableView.hz_reloadData()
    }
    // MARK: - tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = NSStringFromClass(type(of: self))
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellId) ?? UITableViewCell.init(style: .value1, reuseIdentifier: cellId)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
