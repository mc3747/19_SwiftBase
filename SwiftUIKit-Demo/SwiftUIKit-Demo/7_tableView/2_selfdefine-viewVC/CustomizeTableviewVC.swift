//
//  CustomizeTableviewVC.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class CustomizeTableviewVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var tableView = UITableView()
    let dataSourse = ["","","","","test","test","test","test","test","test","test","test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableview();
        tableView.register(CustomizeTableViewCell.self, forCellReuseIdentifier: CustomizeTableViewCell.reuseIdentifier)
        }
    
    func initTableview(){
      self.tableView = UITableView.init(frame: self.view.frame, style: .plain)
      self.tableView.delegate = self;
      self.tableView.dataSource = self;
        self.view.addSubview(self.tableView)
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomizeTableViewCell.reuseIdentifier) as? CustomizeTableViewCell

        print("--------cell" + String(indexPath.row) + "被添加到视图中了")

        cell!.data = dataSourse[indexPath.row]
        
        print(cell!.description)
        
        return cell!
    }
        
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }

  
}
