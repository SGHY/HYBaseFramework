
//
//  HYMacro.swift
//  HYBaseFramework
//
//  Created by moovpay on 2018/11/5.
//  Copyright © 2018 moovpay. All rights reserved.
// 宏定义

import UIKit
// 服务器地址
let BASE_URL = "https://mydesksit.moovpay.com/app"
//导航栏颜色
let kNavBarColor = UIColor.init(red: 0.86, green: 0.85, blue: 0.8, alpha: 1.0)
let kTabBarColor = UIColor.init(red:0.97, green:0.97, blue:0.97, alpha:1.00)
let kNormalFontColor = UIColor.init(red: 0.42, green: 0.33, blue: 0.27, alpha: 1.0)
let kNormalTabBarFontColor = UIColor.init(red: 0.52, green: 0.62, blue: 0.63, alpha: 1.0)
let kSeletedTabBarFontColor = kNormalFontColor
//大部分背景颜色
let kMainBackgroundColor = UIColor.rgb(244, 244, 244)
//分割线颜色
let kSeperatorColor = UIColor.rgb(234, 237, 240)
/** 是否登陆*/
let HYHasLoginFlag = "HYHasLoginFlag"

// MARK: -------------------------- 适配 --------------------------
/// 屏幕宽度
let kScreenHeight = UIScreen.main.bounds.height
/// 屏幕高度
let kScreenWidth = UIScreen.main.bounds.width

/// 状态栏高度
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
/// 导航栏高度
let kNavigationbarHeight = (kStatusBarHeight+44.0)
/// Tab高度
let kTabBarHeight = kStatusBarHeight > 20 ? 83 : 49
/// 是否为IphoneX系列
let isIPhoneXLei: Bool = kScreenHeight >= 812 ? true : false

/// 屏幕比率
let kScreenWidthRatio = (kScreenWidth/375.0)
let kScreenHeightRatio = (kScreenWidth/667.0)

/// 调整
func AdaptedValue(x:Float) -> Float {
    return Float(CGFloat(x) * kScreenWidthRatio)
}
func ShiPei(x:Float) -> Float{
    return AdaptedValue(x: x)
}
/// 调整字体大小
func AdaptedFontSizeValue(x:Float) -> Float {
    return (x) * Float(kScreenWidthRatio)
}


