//
//  [ZYHammers] 第二个锤子.  Protocol
//  ZYProtocols.swift
//  ZYHammers
//
//  Created by 张宇 on 2020/10/24.
//

import UIKit

/** 为UITabBarController 定义的一个协议，可快速增加一个子控制器 */
public protocol ZYTabBarable { }

public extension ZYTabBarable where Self : UITabBarController {
    
    /** 添加一个子控制器 */
    /// 添加一个tabBar的子控制器
    ///
    /// - Parameters:
    ///   - norIcon: 普通状态的图标名称
    ///   - selIcon: 选中状态的图标名称
    ///   - title: 需要显示的文字
    ///   - color: 普通状态的颜色  有默认119的灰色
    ///   - selColor: 选中状态的颜色 有默认蓝色
    /// - Returns: 创建好的子控制器
    func addChildVC(_ controller : UIViewController,
                    _ norIcon : String ,
                    _ selIcon : String,
                    _ title : String,
                    _ color : UIColor = UIColor.systemGray,
                    _ selColor : UIColor = UIColor.systemBlue) {
        controller.tabBarItem.title = title
        if #available(iOS 13.0, *) {
            self.tabBar.tintColor = selColor
            self.tabBar.unselectedItemTintColor = color
        } else {
            controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : selColor], for: .selected)
            controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : color], for: .normal)
        }
        controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11)], for: .normal)
        controller.tabBarItem.image = UIImage(named: norIcon)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage(named: selIcon)?.withRenderingMode(.alwaysOriginal)
        self.addChild(controller)
    }
    
}


public protocol ZYAppCloseable { }

/** 关闭当前的应用程序 */
public extension ZYAppCloseable {
    
    func closeApplication() {
        // 关闭程序
        if let app = UIApplication.shared.delegate {
            UIView.animate(withDuration: 0.5, animations: {
                if let window = app.window {
                    window?.alpha = 0
                    window?.bounds = CGRect(x: 0, y: 0, width: 0, height: 0)
                }
            }) { (_) in
                exit(0)
            }
        }
    }
    
}
