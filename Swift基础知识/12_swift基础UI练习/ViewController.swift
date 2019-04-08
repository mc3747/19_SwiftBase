//
//  ViewController.swift
//  12_swift基础UI练习
//
//  Created by gjfax on 2017/10/11.
//  Copyright © 2017年 macheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "0"
        let redView = UIView.init()
        redView.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
//        let redView = UIView(frame:CGRect(x:10,y:10,width:100,height:100))
        redView.backgroundColor = UIColor.red
        
        self.view.addSubview(redView)
        
        self .creatUI();
        
      
    }
    
// MARK:  - 创建视图UI
    func creatUI() {
        //在一个视图上,添加多个子视图的时候,子视图之间如果有公共部分.那么后添加的子视图会覆盖先添加的.
        //一般情况下,如果想要将一个视图显示在最下面,就最先添加.想要显示在最上面就最后添加
        //创建视图
        let view1 = self.creatView(frame: CGRect(x: 50, y: 100, width: 100, height: 100),backColor: UIColor.red)
        let view2 = self.creatView(frame:CGRect(x:100, y:150, width:100, height:100), backColor: UIColor.yellow)
        let view3 = self.creatView(frame:CGRect(x:150, y:200, width:100, height:100), backColor: UIColor.green)
        _ = self.creatView(frame:CGRect(x:180, y:130, width:100, height:100), backColor: UIColor.purple)
        
        //2.将指定的视图放到最上层
        self.view.bringSubview(toFront: view2)
        //3.将指定的视图放到最下层
        self.view.sendSubview(toBack: view2)
        //4.将指示的视图插入到另一个视图的上面
        self.view.insertSubview(view2,aboveSubview:view3)
        //5.将指定的视图插入到另外一个视图的下面
        self.view.insertSubview(view2,belowSubview:view1)

    }
    
// MARK:  - 创建控件UI
    func creatView(frame:CGRect,backColor:UIColor) -> UIView{
        //创建视图对象
        let subView = UIView.init(frame:frame)
        //设置背景颜色
        subView.backgroundColor = backColor
        //添加到界面上
        self.view.addSubview(subView)
        //将创建的视图返回
        return subView
        
        
    }
    
    
   

}

