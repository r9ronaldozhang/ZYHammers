//
//  ZYDeviceConfig.swift
//  ZYHammers
//
//  Created by 张宇 on 2021/1/18.
//

import UIKit

/// 配置不同的字体颜色，通过修改枚举内的具体16进制颜色进行修改
public enum DeviceColor : String {
    case darkBg         = "111111"
    case lightBg        = "F7F7F7"
    case darkMainText   = "D2D2D2"
    case lightMainText  = "212121"
    case darkSubText    = "5D5D5D"
    case lightSubText   = "9D9D9D"
}

/// 权限的类型
public enum AuthType {
    case location       // 定位
    case notification   // 推送通知
    case micphone       // 麦克风
    case album          // 相册权限
    case camera         // 相机权限
}

public let DeviceAppName = "大竹观察"
