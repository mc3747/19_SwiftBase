//
//  KAppConfig.swift
//  kylJimuDemo
//
//  Created by yulu kong on 2019/9/18.
//  Copyright © 2019 yulu kong. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
let kScreenRatio = kScreenHeight/736.0 //以8ps为标准

let kToastBottomMaxSpace = 560.0 * kScreenRatio
let kToastBottomCenterSpace = 420.0 * kScreenRatio
let kBannerHeight = 120.0
let kNormalItemHeight = 180.0
let kAdItemHeight = 170.0
let kLiveItemHeight = 150.0
let kShadowImageHeight = 50.0
let kTipCellHeight = 30.0
let kCornerRadius = 6.0
let kCollectionItemPadding = 15.0
let kDislikeViewMaxWidth = 330.0
let kDislikeViewMinWidth = 180.0
let kDislikeCellHeight = 60.0
let kDislikeFooterHeight = 150.0
let kLivePartitionRefreshRotationTime: Double = 0.5
let kTimeoutIntervalForRequest: TimeInterval = 10
let kRecommendRecallDislikeMinute = 2

let isIphoneX = kScreenWidth == 375.0 && kScreenHeight == 812.0

let bannerModuleId = 1
let regionModuleId = 2
let rcmdModuleId = 3
let hourRankModuleId = 4
let attentionModuleId = 13
