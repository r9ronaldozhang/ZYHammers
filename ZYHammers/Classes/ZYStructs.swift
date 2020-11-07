//
//  [ZYHammers] 第一个锤子.  Struct
//
//  ZYStructs.swift
//  这是一些老张常用的的功用工具，分享出来大家一起使用，喜欢的可以star
//  本人不会天天都登录github，有建议，或者发现了bug可以邮件我 183146978@qq.com
//
//  Created by 张宇 on 2020/10/24.
//  Copyright © 2020 张宇. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

public struct ZYError : LocalizedError {
    
    public var desc = ""
    
    public var errorDescription: String? {
        return desc
    }
    
    public init(_ desc : String) {
        self.desc = desc
    }
}

public struct ZYDate {
    
    /** 当前的时间戳(since1970 单位是秒) */
    public static var nowTimestampS : Int {
        return Int(Date().timeIntervalSince1970)
    }
    
    /** 当前的时间戳(since1970 单位是毫秒) */
    public static var nowTimestampMS : Int {
        return Int(Date().timeIntervalSince1970 * 1000)
    }
    
    /** 将一个时间戳 格式化为 HH : mm 或者 几分钟钱 几小时前等*/
    public static func formatTimestamp(_ timestamp : Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let nowDate = Date()
        let interval = nowDate.timeIntervalSince(date)      // 计算时间差
        if interval <= 60 {
            return "刚刚"
        }
        if interval <= 60 * 60 {
            return "\(Int(interval/60))分钟前"
        }
        // XX小时前
        if interval <= 60 * 60 * 24 {
            return "\(Int(interval / (60 * 60)))小时前"
        }
        // 创建日历对象
        let calendar = NSCalendar.current
        // 处理昨天数据: 昨天 12:23
        if calendar.isDateInYesterday(date) {
            let fmt = DateFormatter()
            fmt.dateFormat = "昨天 HH:mm"
            let timeStr = fmt.string(from: date)
            return timeStr
        }
        // 处理一年之内: 02-22 12:22
        let cmps = (calendar as NSCalendar).components(.year, from: date, to: nowDate as Date, options: [])
        if cmps.year! < 1 {
            let fmt = DateFormatter()
            fmt.dateFormat = "MM-dd HH:mm"
            let timeStr = fmt.string(from: date)
            return timeStr
        }
        // 超过一年: 2014-02-12 13:22
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd HH:mm"
        return fmt.string(from: date)
    }
    
    /// 转换秒为HH:mm:ss
    ///
    /// - Parameter second: second
    /// - Returns: HH:mm:ss
    public static func secondToHours(_ second: Int) -> String {
        //小时
        let str_hours = String(format: "%02ld", second / 3600)
        //分
        let str_minute = String(format: "%02ld", (second % 3600) / 60)
        //秒
        let str_second = String(format: "%02ld", second % 60)
        if second / 3600 > 0 {
            return "\(str_hours):\(str_minute):\(str_second)"
        }
        return "\(str_minute):\(str_second)"
    }
    
}

public struct ZYSystemInfo {
    
    /** 获取APP版本号 */
    public static func AppVersion() -> String {
        let dict = Bundle.main.infoDictionary!
        return dict["CFBundleShortVersionString"] as! String
    }
    
    /** 获取系统的build号 */
    public static func AppBuildVersion() -> String {
        let dict = Bundle.main.infoDictionary!
        return dict["CFBundleVersion"] as! String
    }
    
    /** 获取系统BundleID */
    public static func AppBunldID() -> String {
        let dict = Bundle.main.infoDictionary!
        return dict["CFBundleIdentifier"] as! String
    }
    
    /** 手机型号*/
    public static func AppDeviceModel() -> String {
        var deviceInfo = utsname()
        uname(&deviceInfo)
        let platform = withUnsafePointer(to: &deviceInfo.machine.0) { ptr in
                   return String(cString: ptr)
               }
        if platform == "iPhone1,1" { return "iPhone 2G"}
        if platform == "iPhone1,2" { return "iPhone 3G"}
        if platform == "iPhone2,1" { return "iPhone 3GS"}
        if platform == "iPhone3,1" { return "iPhone 4"}
        if platform == "iPhone3,2" { return "iPhone 4"}
        if platform == "iPhone3,3" { return "iPhone 4"}
        if platform == "iPhone4,1" { return "iPhone 4S"}
        if platform == "iPhone5,1" { return "iPhone 5"}
        if platform == "iPhone5,2" { return "iPhone 5"}
        if platform == "iPhone5,3" { return "iPhone 5C"}
        if platform == "iPhone5,4" { return "iPhone 5C"}
        if platform == "iPhone6,1" { return "iPhone 5S"}
        if platform == "iPhone6,2" { return "iPhone 5S"}
        if platform == "iPhone7,1" { return "iPhone 6 Plus"}
        if platform == "iPhone7,2" { return "iPhone 6"}
        if platform == "iPhone8,1" { return "iPhone 6S"}
        if platform == "iPhone8,2" { return "iPhone 6S Plus"}
        if platform == "iPhone8,4" { return "iPhone SE"}
        if platform == "iPhone9,1" { return "iPhone 7"}
        if platform == "iPhone9,2" { return "iPhone 7 Plus"}
        if platform == "iPhone10,1" { return "iPhone 8"}
        if platform == "iPhone10,2" { return "iPhone 8 Plus"}
        if platform == "iPhone10,3" { return "iPhone X"}
        if platform == "iPhone10,4" { return "iPhone 8"}
        if platform == "iPhone10,5" { return "iPhone 8 Plus"}
        if platform == "iPhone10,6" { return "iPhone X"}
        if platform == "iPhone11,8" { return "iPhone XR"}
        if platform == "iPhone11,2" { return "iPhone XS"}
        if platform == "iPhone11,6" { return "iPhone XS Max"}
        if platform == "iPhone11,4" { return "iPhone XS Max"}
        if platform == "iPhone12,1" { return "iPhone 11"}
        if platform == "iPhone12,3" { return "iPhone 11 Pro"}
        if platform == "iPhone12,5" { return "iPhone 11 Pro Max"}
        
        if platform == "iPod1,1" { return "iPod Touch 1G"}
        if platform == "iPod2,1" { return "iPod Touch 2G"}
        if platform == "iPod3,1" { return "iPod Touch 3G"}
        if platform == "iPod4,1" { return "iPod Touch 4G"}
        if platform == "iPod5,1" { return "iPod Touch 5G"}
        
        if platform == "iPad1,1" { return "iPad 1"}
        if platform == "iPad2,1" { return "iPad 2"}
        if platform == "iPad2,2" { return "iPad 2"}
        if platform == "iPad2,3" { return "iPad 2"}
        if platform == "iPad2,4" { return "iPad 2"}
        if platform == "iPad2,5" { return "iPad Mini 1"}
        if platform == "iPad2,6" { return "iPad Mini 1"}
        if platform == "iPad2,7" { return "iPad Mini 1"}
        if platform == "iPad3,1" { return "iPad 3"}
        if platform == "iPad3,2" { return "iPad 3"}
        if platform == "iPad3,3" { return "iPad 3"}
        if platform == "iPad3,4" { return "iPad 4"}
        if platform == "iPad3,5" { return "iPad 4"}
        if platform == "iPad3,6" { return "iPad 4"}
        if platform == "iPad4,1" { return "iPad Air"}
        if platform == "iPad4,2" { return "iPad Air"}
        if platform == "iPad4,3" { return "iPad Air"}
        if platform == "iPad4,4" { return "iPad Mini 2"}
        if platform == "iPad4,5" { return "iPad Mini 2"}
        if platform == "iPad4,6" { return "iPad Mini 2"}
        if platform == "iPad4,7" { return "iPad Mini 3"}
        if platform == "iPad4,8" { return "iPad Mini 3"}
        if platform == "iPad4,9" { return "iPad Mini 3"}
        if platform == "iPad5,1" { return "iPad Mini 4"}
        if platform == "iPad5,2" { return "iPad Mini 4"}
        if platform == "iPad5,3" { return "iPad Air 2"}
        if platform == "iPad5,4" { return "iPad Air 2"}
        if platform == "iPad6,3" { return "iPad Pro 9.7"}
        if platform == "iPad6,4" { return "iPad Pro 9.7"}
        if platform == "iPad6,7" { return "iPad Pro 12.9"}
        if platform == "iPad6,8" { return "iPad Pro 12.9"}
        
        if platform == "AppleTV2,1" { return "Apple TV 2"}
        if platform == "AppleTV3,1" { return "Apple TV 3"}
        if platform == "AppleTV3,2" { return "Apple TV 3"}
        if platform == "AppleTV5,3" { return "Apple TV 4"}
        
        if platform == "i386"   { return "iPhone Simulator"}
        if platform == "x86_64" { return "iPhone Simulator"}
        
        return platform
    }
    
    /** 手机系统版本号 */
    public static func AppDeviceVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    /** 手机UUID */
    public static func DeviceUUID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
}

public struct ZYRandom {
    
    /** 随机生成一个UUID String */
    public static var UUIDString : String {
        return NSUUID().uuidString
    }
    
    /// 随机生成一个Int数
    public static var IntNum : Int {
        return Int(arc4random())
    }
    
}

// MARK: - 系统权限相关
public struct ZYSystemAuth {
    
    // MARK: - 相机权限
    
    /**
     *  当前是否有使用相机权限
     */
    public static func cameraAuthorized() -> Bool {
        /**
            case notDetermined      // 第一次申请(未知状态)
            case restricted               // 已经拒绝 不能修改的状态，可能是家长控制权限
            case denied                    // 用户明确禁止使用
            case authorized              // 已经授权使用
         */
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status == .authorized {
            return true
        }
        return false
    }
    
    /**
     * 获取当前相机授权的枚举状态
     */
    public static func cameraAuthStatus() -> AVAuthorizationStatus {
        return AVCaptureDevice.authorizationStatus(for: .video)
    }
    
    /**
     *  主动申请相机权限
     */
    public static func requestCamera(completion : @escaping(_ isSuccess : Bool) -> ()) {
        AVCaptureDevice.requestAccess(for: .video) { (success) in
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    /**
     *  当前是否有使用相机权限
     */
    public static func micphoneAuthorized() -> Bool {
        /**
            case notDetermined      // 第一次申请(未知状态)
            case restricted               // 已经拒绝 不能修改的状态，可能是家长控制权限
            case denied                    // 用户明确禁止使用
            case authorized              // 已经授权使用
         */
        let status = AVCaptureDevice.authorizationStatus(for: .audio)
        if status == .authorized {
            return true
        }
        return false
    }
    
    /**
     * 获取当前麦克风授权的枚举状态
     */
    public static func micphoneAuthStatus() -> AVAuthorizationStatus {
        return AVCaptureDevice.authorizationStatus(for: .audio)
    }
    
    /**
     *  主动申请麦克风权限
     */
    public static func requestMicphone(completion : @escaping(_ isSuccess : Bool) -> ()) {
        AVCaptureDevice.requestAccess(for: .audio) { (success) in
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    /**
     * 获取当前相册的使用权限
     */
    public static func albumAuthorized() -> Bool {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .authorized {
            return true
        }
        return false
    }
    
    /** 申请相册权限 */
    public static func requestAlbum(completion: @escaping(_ isSuccess : Bool) -> ()) {
        let status = PHPhotoLibrary.authorizationStatus()
        if status == .notDetermined {   // 第一次触发提示
            PHPhotoLibrary.requestAuthorization { (st) in
                if st == .authorized {
                    completion(true)
                }
            }
        } else if status == .authorized {   // 已经授权了
            completion(true)
        } else {
            completion(false)
        }
    }
    
}

public struct ZYDefaults {
    
    /** 归档Any类型到本地 */
    public static func save(_ obj : Any, forKey key : String) {
        UserDefaults.standard.set(obj, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    /** 获取defaults中的String类型数据 如果没有获取到，返回"" */
    public static func string(forKey key : String) -> String {
        if let value = UserDefaults.standard.string(forKey: key) {
            return value
        }
        return ""
    }
    
    /** 获取defaults中的Int类型数据，如果没有获取到，返回0 */
    public static func int(forKey key : String) -> Int {
        let value = UserDefaults.standard.integer(forKey: key)
        return value
    }
    
    /** 获取defaults中的Bool值 */
    public static func bool(forKey key : String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }
    
    /** 获取defaults中的字典 如果没有获取到，返回空字典 */
    public static func dict(forKey key : String) -> [String : Any]? {
        if let dict = UserDefaults.standard.dictionary(forKey: key) {
            return dict
        }
        return nil
    }
    
    /** 获取数组，如果没有，返回空数组 */
    public static func array(forKey key : String) -> [Any] {
        if let arr = UserDefaults.standard.array(forKey: key) {
            return arr
        }
        return [Any]()
    }
    
    /** 获取字典数组,如果没有，返回空数组 */
    public static func dictArray(forKey key : String) -> [[String : Any]] {
        if let obj = UserDefaults.standard.object(forKey: key) {
            if let dictArr = obj as? [[String : Any]] {
                return dictArr
            }
        }
        return [[String : Any]]()
    }
    
    /// 删除归档
    ///
    /// - Parameter key: key description
    public static func remove(_ key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}

public struct ZYPredicate {
    /** 判断是否是合法电话号码 */
    public static func checkPhoneNumber(number : String?) -> Bool {
        if number == nil {
            return false
        }
        let regex = "^1+[3456789]+\\d{9}"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return phonePredicate.evaluate(with:number!)
    }
    
    /** 正则是否是合法身份证号 */
    public static func checkUserIdCard(idCard : String) -> Bool {
        let regex = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let cardPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return cardPredicate.evaluate(with : idCard)
    }
    
    /** 正则4-6位数短信验证码 */
    public static func checkSecurityCode(code: String?) -> Bool {
        if code == nil {
            return false
        }
        if code!.count < 4 || code!.count > 6 {
            return false
        }
        let regex = "^[0-9]{\(code!.count)}"
        let codePredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return codePredicate.evaluate(with:code!)
    }
    
    /** 正则是否是纯数字 */
    public static func checkNumber(string : String?) -> Bool {
        if string == nil { return false }
        let regex = "^[0-9]{\(string!.count)}"
        let numPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return numPredicate.evaluate(with:string!)
    }
    
    /** 正则6-20位密码（密码位数的限制） */
    public static func checkPassword(pwd : String?) -> Bool {
        if pwd == nil { return false}
        let regex = "^.{8,20}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:pwd)
    }
    
    /** 正则是否是合法的邮箱 */
    public static func checkEmail(email : String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:email)
    }
    
    /** 正则是否是合法中文名称 */
    public static func checkChineseName(name : String?) -> Bool {
        if name == nil { return false }
        let regex = "^[\u{4e00}-\u{9fa5}]{2,5}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:name!)
    }
    
    /** 正则是否是合法邮编 */
    public static func checkPostCode(code : String) -> Bool {
        let regex = "^[0-9]{6}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:code)
    }
    
    /** 正则4位数图片验证码 */
    public static func checkPicCode(code : String) -> Bool {
        let regex = "^[A-Z0-9a-z]{4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:code)
    }
    
    /** 正则日期格式是否合法 */
    public static func checkDateFormat(dateStr : String) -> Bool {
        let regex = "^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with:dateStr)
    }
}

public struct ZYSysAuth {
    
    /**用户权限检测的类型*/
    public enum CheckStyle {
        case camera     // 用户的相机
        case album      // 用户的相册
        case micphone   // 用户的麦克风
    }
    
    public enum Status : Int {
        // 用户还未选择
        case notDetermined  = 0
        // 未被授权
        case restricted     = 1
        // 用户已经明确拒绝
        case denied         = 2
        // 用户已经授权
        case authorized     = 3
    }
    
    /**获取App是否获取用户相机权限*/
    public static func cameraAuth() -> Status {
        let status = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        if let auth = Status(rawValue: status.rawValue) {
            return auth
        }
        return .notDetermined
    }

    /**获取App是否获取用户相册权限*/
    public static func photosAuth() -> Status {
        let status = PHPhotoLibrary.authorizationStatus()
        if let auth = Status(rawValue: status.rawValue) {
            return auth
        }
        return .notDetermined
    }
    
}

// MARK: - UI 控件

public struct ZYImage {
    
    /// 将一个UIImage对象，重绘成为一个指定的尺寸
    public static func resize(_ image : UIImage, to size : CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size);
        image.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}
