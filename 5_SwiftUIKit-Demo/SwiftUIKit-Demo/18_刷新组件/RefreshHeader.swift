//
//  RefreshHeader.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2021/1/5.
//  Copyright © 2021 马成. All rights reserved.
//

import Foundation
import UIKit
import MJRefresh

class RefreshHeader: MJRefreshHeader {

    // 转圈的菊花
    var loadingView: UIActivityIndicatorView?
    // 下拉的icon
    var arrowImage: UIImageView?

    // 处理不同刷新状态下的组件状态
    override var state: MJRefreshState {
        didSet {
            switch state {
            case .idle:
                self.loadingView?.isHidden = true
                self.arrowImage?.isHidden = false
                self.loadingView?.stopAnimating()
            case .pulling:
                self.loadingView?.isHidden = false
                self.arrowImage?.isHidden = true
                self.loadingView?.startAnimating()
            case .refreshing:
                self.loadingView?.isHidden = false
                self.arrowImage?.isHidden = true
                self.loadingView?.startAnimating()
            default:
                print("")
            }
        }
    }

    // 初始化组件
    override func prepare() {
        super.prepare()
        self.mj_h = 50

        self.loadingView = UIActivityIndicatorView(style: .medium)
        self.arrowImage = UIImageView(image: UIImage(named: "arrow_downward"))
        self.addSubview(loadingView!)
        self.addSubview(arrowImage!)

    }

    // 组件定位
    override func placeSubviews() {
        super.placeSubviews()
        self.loadingView?.center = CGPoint(x: self.mj_w / 2, y: self.mj_h / 2)
        self.arrowImage?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        self.arrowImage?.center = self.loadingView!.center
    }

}
