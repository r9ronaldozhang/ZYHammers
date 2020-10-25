//
//  [ZYHammers] 第一个锤子.  Struct
//
//  ZYGlobel.swift
//  ZYHammers
//
//  Created by 张宇 on 2020/10/24.
//

import UIKit

// MARK: - 常量相关

/** 获取当前屏幕的宽度 */
public let zyScreenW  = UIScreen.main.bounds.width
/** 获取当前屏幕的高度 */
public let zyScreenH = UIScreen.main.bounds.height
/** 获取当前屏幕的bounds */
public let zyBounds = CGRect(x: 0, y: 0, width: zyScreenW, height: zyScreenH)
/** 获取除去标准导航高度的bounds */
public let zyNavBounds = CGRect(x: 0, y: 0, width: zyScreenW, height: zyInchGT58 ? 88 : 64)

// MARK: - 颜色相关

/** 获取一个灰色的UIColor  参数:0-255 */
public func zyColorGray(_ num : CGFloat, _ alpha : CGFloat = 1.0) -> UIColor {
    return UIColor(red: num/255.0, green: num/255.0, blue: num/255.0, alpha: alpha)
}

/** 根据rgb获取一个UIColor */
public func zyColorRGB(_ r : CGFloat, _ g : CGFloat, _ b : CGFloat, _ alpha : CGFloat = 1.0) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
}

/** 获取一个随机色 */
public var zyRandomColor : UIColor {
    let r = CGFloat(arc4random() % 255)
    let g = CGFloat(arc4random() % 255)
    let b = CGFloat(arc4random() % 255)
    return zyColorRGB(r, g, b)
}

/** 当前是否是黑暗模式 */
public var zyIsDarkModel : Bool {
    if #available(iOS 13.0, *) {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            return true
        }
        return false
    } else {
        return false
    }
}

// MARK: - NavBar TabBar 高度
/** 导航条的高度 */
public let zyNavBarH : CGFloat = zyScreenH >= 812.0 ? 88.0 : 64

/** TabBar的高度 */
public let zyTabBarH : CGFloat = zyScreenH >= 812.0 ? 49 + 34 : 49

/// 状态栏高度
public let zyStatusBarH : CGFloat = zyScreenH >= 812 ? 40 : 20

/// 底部安全高度
public let zyBottomSafeH : CGFloat = zyScreenH >= 812.0 ? 34 : 0

/// 顶部安全高度(含状态栏)
public let zyTopSafeH : CGFloat = zyInchGT58 ? 44 : 20

// MARK: - 常用CGRect
public let zyTableRect = CGRect(x: 0, y: zyNavBarH, width: zyScreenW, height: zyScreenH - zyNavBarH)

// MARK: - 屏幕尺寸相关

/** 是否是3.5英寸屏 320x480 */
public let zyInch35 = UIScreen.main.bounds.height == 480.0
/** 是否是4.0英寸屏 320x568 */
public let zyInch40 = UIScreen.main.bounds.height == 568.0
/** 是否是4.7英寸屏 375x667 */
public let zyInch47 = UIScreen.main.bounds.height == 667.0
/** 是否是5.5英寸屏 414x736 */
public let zyInch55 = UIScreen.main.bounds.height == 736.0
/** 是否是5.8英寸屏 375x812 */
public let zyInch58 = UIScreen.main.bounds.height == 812.0
/** 是否是6.1或者6.5寸屏 414x896 */
public let zyInch6165 = UIScreen.main.bounds.height == 896.0
/** 是否大于等于58寸 */
public let zyInchGT58 = UIScreen.main.bounds.height >= 812.0

// MARK: - KeyWindow
public let zyKeyWindow = UIApplication.shared.keyWindow!

