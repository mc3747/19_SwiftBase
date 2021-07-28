//
//  GlobalMethod.swift
//  SwiftProject-Demo
//
//  Created by kk on 2021/7/26.
//  Copyright © 2021 马成. All rights reserved.
//

import Foundation

func XWLog<T>(_ messsage : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("💚File(文件名):\(fileName) Function(函数名):\(funcName) Line(行号):\(lineNum) Content(内容):\(messsage)")
        
    #endif
}
