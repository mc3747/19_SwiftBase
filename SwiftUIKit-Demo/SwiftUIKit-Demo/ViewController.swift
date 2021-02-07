//
//  ViewController.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/7/14.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let titleArray:[String] = ["1_view","2_button","3_imageView","4_text","5_alert","6_stack",
                               "7_tableview","8_collectionView","9_tabBar","10_naviBar","11_layout","12_尺寸适配","13_无数据","14_九宫格","15_自定义view","16_绘图","17_快速写UI","18_刷新组件","19_动画相关"]
    
    let vcNameArray:[String] = ["BasisViewController","BasisButtonViewController","","","","",
                                "BasisTableViewViewController","","","","BasisLayoutVC","","NoDataTableviewDemo","GridController","","DrawingViewVC","","MJRefreshVC","AnimationVC"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "kkk")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "kkk")
        }
        cell?.textLabel?.text = titleArray[indexPath.row]
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
        var name = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String//这是获取项目的名称，
        /**
         * 如果你的工程名字中带有“-” 符号  需要加上 replacingOccurrences(of: "-", with: "_") 这句代码把“-” 替换掉  不然还会报错 要不然系统会自动替换掉 这样就不是你原来的包名了 如果不包含“-”  这句代码 可以不加
         */
        name = name?.replacingOccurrences(of: "-", with: "_")
        let className = name! + "." + vcNameArray[indexPath.row]
        guard let cls = NSClassFromString(className) as? UIViewController.Type else{
            fatalError("类名错误")
        }
        let vc = cls.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

