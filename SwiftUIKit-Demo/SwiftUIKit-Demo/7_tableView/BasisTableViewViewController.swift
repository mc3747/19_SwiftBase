//
//  BasisTableViewViewController.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/15.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class BasisTableViewViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         1_tableView的写法
         2_重用cell的写法:
            直接写id的方法/
            自己写分类/
            第三方:OC版本的 DZNEmptyDataSet
         3_无数据页面
            类似界面预加载,骨架屏:https://github.com/daomoer/SkeletonDemo
            无数据
            无网络
            点击刷新
            下拉刷新
         4_封装好的基类
         */
        
        
        let button1:UIButton = {
            let button = UIButton.init()
            button.frame = CGRect.init(x: 0, y: 100, width: 200, height: 50)
            button.setTitle("1_默认Tableview", for: .normal)
            button.backgroundColor = UIColor.red;
            button.addTarget(self, action: #selector(jump1), for: .touchUpInside)
            return button
        }()
        self.view.addSubview(button1)
        
        let button2:UIButton = {
            let button = UIButton.init()
            button.frame = CGRect.init(x: 0, y: 170, width: 200, height: 50)
            button.setTitle("2_自定义Tableview-UIViewController", for: .normal)
            button.backgroundColor = UIColor.red;
            button.addTarget(self, action: #selector(jump2), for: .touchUpInside)
            return button
        }()
        self.view.addSubview(button2)
        
        let button3:UIButton = {
                  let button = UIButton.init()
                  button.frame = CGRect.init(x: 0, y: 250, width: 200, height: 50)
                  button.setTitle("3_自定义Tableview-UITableViewController", for: .normal)
                  button.backgroundColor = UIColor.red;
                  button.addTarget(self, action: #selector(jump3), for: .touchUpInside)
                  return button
              }()
              self.view.addSubview(button3)
        
    }
    
    @objc func jump1(){
        //创建一个页面
        let destination = DefaultTableviewVC()
        //跳转
        self.navigationController?.pushViewController(destination, animated: true)
    }
    @objc func jump2(){
        //创建一个页面
        let destination = CustomizeTableviewVC()
        //跳转
        self.navigationController?.pushViewController(destination, animated: true)
    }
    @objc func jump3(){
        //创建一个页面
        let destination = CustomCellController()
        //跳转
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
}
