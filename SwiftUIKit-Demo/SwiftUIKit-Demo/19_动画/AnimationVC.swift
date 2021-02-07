//
//  AnimationVC.swift
//  SwiftUIKit-Demo
//
//  Created by kk on 2021/2/5.
//  Copyright © 2021 马成. All rights reserved.
//

import UIKit
class AnimationVC: BaseViewController {
    private lazy var bg:UIImageView = {
        return $0
    }(UIImageView())
    private lazy var car:UIImageView = {
        return $0
    }(UIImageView())
    private lazy var tire:UIImageView = {
        return $0
    }(UIImageView())
    private lazy var gas:UIImageView = {
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(bg)
        
        bg.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(100)
            make.height.equalTo(100)
        }
        
        //Assets.xcassets只能通过imageNamed:方法加载，通过[[NSBundle mainBundle] pathForResource:@"文件名" ofType:@"后缀"];无法获得图片路径
        //位于根目录下的图片，imageNamed后面要跟图片全称，[NSBundle mainBundle]可以获取路径
        //imageWithContentsOfFile没有缓存，加载大图片；imageNamed会有缓存
        
//        bg.image = UIImage.init(named: "new_home_re_tire.webp")
        
        
        //load from server
//          let onlineFileUrl = URL(string: "http://www.gstatic.com/webp/gallery/2.webp")
           //load from project directory
            let loaclFileUrl = Bundle.main.url(forResource: "new_home_recarbg", withExtension: "webp")
        DispatchQueue.main.async {
          self.bg.sd_setImage(with: loaclFileUrl)
        }
        

    }

}
