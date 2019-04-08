//
//  AppDelegate.swift
//  12_swift基础UI练习
//
//  Created by gjfax on 2017/10/11.
//  Copyright © 2017年 macheng. All rights reserved.
//

import UIKit


@UIApplicationMain  //调用了OC中的UIApplicationMain函数;
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 
        //定义4个视图
        let zeroview = ViewController()
        let oneview = OneViewController()
        let twoview = TwoViewController()
        let threeview = ThreeViewController()
        
        //导航栏
        let zeroNav :UINavigationController = UINavigationController(rootViewController: zeroview)
        let oneNav :UINavigationController = UINavigationController(rootViewController: oneview)
        let twoNav :UINavigationController = UINavigationController(rootViewController: twoview)
        let threenav : UINavigationController = UINavigationController(rootViewController: threeview)
       
        //设置导航栏背景颜色
        zeroNav.navigationBar.barTintColor = UIColor.red
        //设置文字颜色
        zeroNav.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.white]
        //修改导航栏返回按钮颜色
        zeroNav.navigationBar.tintColor = UIColor.white
        
        //tabbar
        let zeroItem :UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.bookmarks, tag: 0)
        let oneItem :UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.downloads, tag: 1)
        let twoItem :UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.favorites, tag: 2)
        let treeItem :UITabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.more, tag: 3)
        
        zeroview.tabBarItem = zeroItem
        oneview.tabBarItem = oneItem
        twoview.tabBarItem = twoItem
        threeview.tabBarItem = treeItem
        
        //设置tabbar
        let tc = UITabBarController()
            //底部工具栏背景颜色
        tc.tabBar.barTintColor=UIColor.lightGray;
            //.设置底部工具栏文字颜色（默认状态和选中状态）(选中状态为蓝色)
            // 修改标签栏选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.red, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14.0)], for: .selected)
            // 修改标签栏未选中时文字颜色、字体
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.orange, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 14.0)], for: .normal)
        tc.viewControllers = [zeroNav,oneNav,twoNav,threenav]
        self.window?.rootViewController = tc;
        
//        //1.创建UIWindow对象
////        self.window = UIWindow.init()
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//
//
//        //2.设置根视图控制器
//        self.window?.rootViewController = ViewController()
//
//        //3.设置背景颜色
//        self.window?.backgroundColor = UIColor.yellow
        

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

