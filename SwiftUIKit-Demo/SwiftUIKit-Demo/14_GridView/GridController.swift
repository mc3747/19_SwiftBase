//
//  GridController.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/10/27.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit

class GridController: UIViewController {

    let currentView = GridView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.view.addSubview(currentView)
        
        currentView.backgroundColor = .red
        currentView.titleArray = ["你好吗","你好吗","你好吗","你好吗","你好吗","你好吗","你好吗","你好吗","你好吗","你好吗"];
        currentView.leftMargin = 10
        currentView.colums = 3
        currentView.topMargin = 10
        currentView.bottomMargin = 10
        currentView.columsMargin = 10
        currentView.rowMargin = 10
        
        currentView.snp.makeConstraints { (make) in
            
            make.leading.equalTo(self.view).offset(20)
            make.top.equalTo(self.view).offset(100)
            make.trailing.equalTo(self.view).offset(-20)
            
        }

    }

}
