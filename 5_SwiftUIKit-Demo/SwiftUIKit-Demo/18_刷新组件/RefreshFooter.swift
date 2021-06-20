//
//  RefreshFooter.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2021/1/5.
//  Copyright © 2021 马成. All rights reserved.
//

import Foundation
import UIKit
import MJRefresh

class RefreshFooter: MJRefreshAutoFooter {

    var loadingView: UIActivityIndicatorView?
    var stateLabel: UILabel?

    override var state: MJRefreshState {
        didSet {
            switch state {
            case .idle:
                self.stateLabel?.text = nil
                self.loadingView?.isHidden = true
                self.loadingView?.stopAnimating()
            case .refreshing:
                self.stateLabel?.text = nil
                self.loadingView?.isHidden = false
                self.loadingView?.startAnimating()
            case .noMoreData:
                self.stateLabel?.text = "没有更多数据了"
                self.loadingView?.isHidden = true
                self.loadingView?.stopAnimating()
            default: break
            }
        }
    }

    override func prepare() {
        super.prepare()
        self.mj_h = 50

        self.loadingView = UIActivityIndicatorView(style: .medium)
        self.stateLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        self.stateLabel?.textAlignment = .center
        self.stateLabel?.font = UIFont.systemFont(ofSize: 12)

        self.addSubview(loadingView!)
        self.addSubview(stateLabel!)

    }

    override func placeSubviews() {
        super.placeSubviews()
        self.loadingView?.center = CGPoint(x: self.mj_w / 2, y: self.mj_h / 2)
        self.stateLabel?.center = CGPoint(x: self.mj_w / 2, y: self.mj_h / 2)
    }

}
