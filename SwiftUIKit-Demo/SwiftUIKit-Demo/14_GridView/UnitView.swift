//
//  UnitView.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/10/27.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit

class UnitView: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textAlignment = .center
        self.textColor = .red
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
