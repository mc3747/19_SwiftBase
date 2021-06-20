//
//  MJRefreshDemo.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2021/1/5.
//  Copyright © 2021 马成. All rights reserved.
//

import Foundation
import UIKit
import MJRefresh

class MJRefreshVC: BaseViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView!
    var index = 0
    var data = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "RefreshLoadDemo"
        self.view.backgroundColor = .white

        tableView = UITableView(frame: self.view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        self.tableView.mj_header = RefreshHeader(refreshingBlock: {
            [weak self] () -> Void in
            self?.headerRefresh()
        })
        self.tableView.mj_footer = RefreshFooter(refreshingBlock: {
            [weak self] () -> Void in
            self?.footerRefresh()
        })

        // 默认刷新一下数据
        self.tableView.mj_header?.beginRefreshing()
    }

    @objc func headerRefresh() {
        self.data.removeAll()
        index = 0
        self.tableView.mj_footer?.resetNoMoreData()
        for _ in 0..<20 {
            data.append(Int(arc4random()))
        }
        Thread.sleep(forTimeInterval: 1)
        self.tableView.reloadData()
        self.tableView.mj_header?.endRefreshing()
    }

    @objc func footerRefresh() {
        for _ in 0..<10 {
            data.append(Int(arc4random()))
        }
        Thread.sleep(forTimeInterval: 1)
        self.tableView.reloadData()
        self.tableView.mj_footer?.endRefreshing()
        index = index + 1
        if index > 2 {
            self.tableView.mj_footer?.endRefreshingWithNoMoreData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(data[indexPath.row])
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
