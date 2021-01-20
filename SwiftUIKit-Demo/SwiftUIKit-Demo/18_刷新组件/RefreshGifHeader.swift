//
//  MJRefreshHeader.swift
//  SwiftUIKit-Demo
//
//  Created by 马成 on 2021/1/5.
//  Copyright © 2021 马成. All rights reserved.
//

import Foundation
import UIKit
import MJRefresh
import Lottie

class RefreshGifHeader: MJRefreshStateHeader {
  
    /** 写一个类继承自MJRefreshStateHeader， 我的取名叫GQRefreshHeader
    把默认的时间label和状态label隐藏掉
    */
    override func prepare() {
            super.prepare()
        self.lastUpdatedTimeLabel?.isHidden = true
        self.stateLabel?.isHidden = true
            self.mj_h = 56
        }
    lazy var gifView: AnimationView? = {
            let animationView = AnimationView(name: "refresh")
            animationView.loopMode = .loop
            animationView.isUserInteractionEnabled = false
            addSubview(animationView)
            return animationView
        }()
        
    override func placeSubviews() {
            super.placeSubviews()
            if self.gifView?.constraints.count ?? 0 > 0 {
                return
            }
            self.gifView?.frame = CGRect.init(x: (self.bounds.size.width)/2, y: self.bounds.size.height/2, width: 24, height: 24)
        }
   override var state: MJRefreshState{
            didSet {
                guard let gifV =  gifView else {
                    return
                }
                if state == .pulling || state == .refreshing{
                    gifV.stop()
                    gifV.play()
                }else if state == .idle{
                    gifV.stop()
                }
                
            }
        }

}
/**
扩展UIScrollView 添加一个 GQRefreshHeader类型的关联属性
*/

struct GQRefreshKey {
    static var headerKey = 0
}

extension UIScrollView {
    /// 关联属性 （扩展中添加）
    private var gqHeader: RefreshGifHeader? {
        get {
            return objc_getAssociatedObject(self, &GQRefreshKey.headerKey) as? RefreshGifHeader
        }
        set {
            objc_setAssociatedObject(self, &GQRefreshKey.headerKey, newValue,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    @discardableResult /// discardableResult目的是为了让返回值没被调用者接收到的时候不报警告（这句加不加无所谓 加了更优雅些）
    func addRefreshHeader(refreshHeader:RefreshGifHeader?,refreshBlock:@escaping ()->Void) -> UIScrollView {
        if gqHeader != refreshHeader {
            gqHeader?.removeFromSuperview()
            
            if let header: RefreshGifHeader = refreshHeader {
                header.refreshingBlock = refreshBlock
                self.insertSubview(header, at: 0)
                self.gqHeader = header
            }
        }
        return self
    }
    
//触发头部上拉刷新
    final public func triggerRefreshing(){
        self.gqHeader?.beginRefreshing()
    }
    
    final public func triggerDelayRefreshing() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.triggerRefreshing()
        }
    }
    
    func endRefreshing() {
        self.gqHeader?.endRefreshing()
    }
  }

//外部使用
/*
 self.tableView.addRefreshHeader(refreshHeader: GQRefreshHeader()) {
             DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
                 self.tableView.endRefreshing()///模拟刷新完成后结束动画
             }
         }

 作者：大小陈
 链接：https://juejin.cn/post/6844903992238047239
 来源：掘金
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
