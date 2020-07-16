//
//  CommonViewController.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/7/16.
//  Copyright © 2020 马成. All rights reserved.
//


import UIKit

class CommonViewController: UIViewController {
    //添加一个字符串常量，作为项目中所有服务器请求地址的开头部分。
    let baseUrl = "https://www.cnblogs.com/strengthen/"
    //添加按钮对象：作为页面左上角的后退按钮
    var backBt : UIButton!
    //添加按钮对象：作为页面左上角的关闭
    var dismissBt : UIButton!
    //添加颜色对象，作为所有页面中的文字的深灰色
    let fontColorDarkGray = UIColor(red: 74.0/255, green: 74.0/255, blue: 74.0/255, alpha: 1.0)
    //添加颜色对象，作为所有页面中的文字的浅灰色
    let fontColorLightGray = UIColor(red: 229.0/255, green: 229.0/255, blue: 229.0/255, alpha: 1.0)
    //添加颜色对象，作为文字的红色
    let fontColorRed = UIColor(red: 255.0/255, green: 89.0/255, blue: 95.0/255, alpha: 1.0)
     //添加颜色对象，作为文字的绿色
    let fontColorGreen = UIColor(red: 0.0/255, green: 126.0/255, blue: 125.0/255, alpha: 1.0)
     //添加颜色对象，作为文字的蓝色
    let fontColorBlue = UIColor(red: 74.0/255, green: 144.0/255, blue: 226.0/255, alpha: 1.0)
     //添加颜色对象，作为分割线的颜色
    let fontColorSplit = UIColor(red: 230.0/255, green: 230.0/255, blue: 230.0/255, alpha: 0.5)
    //添加四个字体对象，作为正文、标题等项目的文字大小
    let fontName : String = "PingFang SC"
    let font14 : UIFont = UIFont(name: "PingFang SC", size: 14)!
    let font17 : UIFont = UIFont(name: "PingFang SC", size: 17)!
    let font20 : UIFont = UIFont(name: "PingFang SC", size: 20)!
    let font24 : UIFont = UIFont(name: "PingFang SC", size: 24)!
    //添加四个变量
    //作为标签、文本框等组件的宽度、高度的基准数值
    var width40 : Int = 0
    var widthFull : Int = 0
    var heightFull : Int = 0
    var startPoint : CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        //由于页面的底色比较深。所以设置状态栏的风格为亮色，
        //同时隐藏导航控制器的后退按钮。
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        //隐藏导航控制器的控制按钮
        self.navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
        //对组件常见的高度和宽度进行初始化
        self.width40 = Int(self.view.frame.size.width) - 40
        self.heightFull = Int(self.view.frame.size.height)
        self.widthFull = Int(self.view.frame.size.width)
        //应用程序的所有页面都使用相同渐变类型的背景颜色，在基类中创建背景颜色。
        //这样所有继承自该基类的视图控制器，也都自动具有相同的背景。
        let gradientLayer = CAGradientLayer()

        gradientLayer.bounds = CGRect(x: 0, y: 0, width: self.widthFull+1, height: self.heightFull+1)
        //设置渐变层的位置和渐变的起始颜色、中间颜色和结束颜色
        gradientLayer.position = CGPoint(x: self.widthFull/2, y: self.heightFull/2)
        gradientLayer.colors = [UIColor(red: 48.0/255, green: 35.0/255, blue: 174.0/255, alpha: 1.0).cgColor, UIColor(red: 126.0/255, green: 67.0/255, blue: 170.0/255, alpha: 1.0).cgColor]
        //设置渐变层的起始点和结束点，从而创建一个45度方向的渐变背景层
        gradientLayer.startPoint = CGPoint(x: 1, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        //对所有页面共有的后退按钮进行初始化，并设置它的图片样式。
        backBt = UIButton(frame: CGRect(x: 11, y: 26, width: 33, height: 33))
        backBt.setImage(UIImage(named:"leftArrow"), for: .normal)
        //给按钮对象添加绑定事件
        backBt.addTarget(self, action: #selector(CommonViewController.backBtTapped(_:)), for: .touchUpInside)
        //并添加到根视图中。
        self.view.addSubview(backBt)
        //接着对关闭按钮进行初始化，并设置它的图片样式
        dismissBt = UIButton(frame: CGRect(x: 13, y: 20, width: 40, height: 40))
        dismissBt.setImage(UIImage(named:"iconCloseBlack"), for: .normal)
        //给按钮对象绑定点击事件
        dismissBt.addTarget(self, action: #selector(CommonViewController.dismissBtTapped(_:)), for: .touchUpInside)
        //默认状态处于隐藏状态
        dismissBt.isHidden = true
        //添加到根视图中
        self.view.addSubview(dismissBt)
    }

    //添加一个方法，用来响应后退按钮的点击事件。当按钮被点击时，使导航控制器返回上一个页面。
    //MARK: back返回

    @objc func backBtTapped(_ sender:UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }

    //添加一个方法，用来响应关闭按钮的点击事件。当按钮被点击时，关闭弹出的窗口。
    //MARK: cancel取消
    @objc func dismissBtTapped(_ sender:UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }

    //添加一个方法，用来获得键盘的高度。
    //MARK: KeyboardHeight键盘高度
    func getKeyboardHeight() -> Int
    {
        //首先获得键盘的输入模式
        let lang = UITextInputMode.activeInputModes[0]
        let primaryLanguage = lang.primaryLanguage
        //判断当键盘的语言为英文时，返回指定的键盘高度。
        if(primaryLanguage == "en-US")
        {
            return 253
        }
        //判断当键盘的语言是中国大陆简体中文时，根据屏幕是否为Plus屏幕，返回不同的键盘高度。
        else if(primaryLanguage == "zh-CN")
        {
            if(self.view.frame.size.width == 414)
            {
                return 256+40
            }
            else
            {
                return 256
            }
        }
         //判断当键盘的语言是通用简体中文时，根据屏幕是否为Plus屏幕，返回不同的键盘高度。
        else if(primaryLanguage == "zh-Hans")
        {
            if(self.view.frame.size.width == 414)
            {
                return 216+40
            }
            else
            {
                return 216
            }

        }
        //最后返回当键盘数据表情键盘或默认状态下的高度
        else if(primaryLanguage == "emoji")
        {
            return 216
        }

        return 253
    }

    //接着实现手指在屏幕上由右向左滑动时，使导航控制器返回上一页的功能。
    //首先重写视图控制器的手指按下的事件
    //MARK: -
    //MARK: touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        //获得触摸手势的第一个触摸点，在当前视图中的坐标
        let touch = touches.first
        startPoint = touch?.location(in: self.view)
    }

    //重写手指滑动时的事件
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        ///获得触摸手势的第一个触摸点的坐标
        let touch = touches.first
        let touchPoint = touch?.location(in: self.view)
        //获得当前点的坐标和刚开始手指按下时的坐标的水平距离和垂直距离。
        let disX = (touchPoint?.x)! - (startPoint?.x)!
        let disY = abs((touchPoint?.y)! - (startPoint?.y)!)
        //处理当手指在水平方向上，从右向左滑动大于50点的情况
        if(disY < 10 && disX > 50)
        {
            //假如当前的视图控制器处于导航控制器的内部，则使导航控制器返回上一个页面。
            if(self.navigationController != nil)
            {
                startPoint = CGPoint(x: 0, y: 0)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    //重写手势的结束事件，恢复起点的坐标
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        startPoint = CGPoint(x: 0, y: 0)
    }

    //最后重写手势的取消事件，同样恢复起点的坐标。
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        startPoint = CGPoint(x: 0, y: 0)
    }

    //添加一个方法，用来隐藏标签控制器底部的标签
    func hideTabBar()
    {
        self.tabBarController?.tabBar.isHidden = true
    }

    //添加一个方法，用来显示签控制器底部的标签
    func showTabBar()
    {
        self.tabBarController?.tabBar.isHidden = false
    }

    //接着打开项目控制器的类文件ViewController.swift
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
