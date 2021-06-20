//: [Previous](@previous)

import Foundation

//1_存储属性
    //存储属性只能用于类和结构体
    //属性声明前使用 lazy 来标示一个延时加载存储属性
    class DataImporter {
        /*
        DataImporter 是一个负责将外部文件中的数据导入的类。
        这个类的初始化会消耗不少时间。
        */
        var fileName = "data.txt"
        // 这里会提供数据导入功能
    }

    class DataManager {
        lazy var importer = DataImporter()
        var data = [String]()
        // 这里会提供数据管理功能
    }

    let manager = DataManager()
    manager.data.append("Some data")
    manager.data.append("Some more data")
    print(manager.importer.fileName)

//2_计算属性
    //计算属性可以用于类、结构体和枚举

//3_属性观察器

//4_属性包装器

//5_类型属性(类似于静态属性)
