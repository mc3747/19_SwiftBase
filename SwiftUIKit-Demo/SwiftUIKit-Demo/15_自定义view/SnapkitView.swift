//
//  SnapkitView.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2020/11/29.
//  Copyright © 2020 马成. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SnapkitView: UIView {

    var isFirstLayout: Bool = true

    lazy var firstView: UIView = {
        let firstView: UIView = UIView()
        return firstView
    }()

    lazy var secondView: UIView = {
        let secondView: UIView = UIView()
        return secondView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    func commonInit() {
        self.addSubview(self.firstView)
        self.addSubview(self.secondView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if self.isFirstLayout {
            self.firstView.snp.makeConstraints { (make) -> Void in

            }

            self.secondView.snp.makeConstraints { (make) -> Void in

            }

            self.isFirstLayout = false
        }
    }
}
