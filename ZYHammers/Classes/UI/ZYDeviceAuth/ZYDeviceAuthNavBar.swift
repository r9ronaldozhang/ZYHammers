//
//  ZYDeviceAuthNavBar.swift
//  ZYHammers
//
//  Created by 张宇 on 2021/1/18.
//

import UIKit

class ZYDeviceAuthNavBar: UIView {

    @IBOutlet weak var appNameL: UILabel!
    
    @IBOutlet weak var descL: UILabel!
    
    public static func create(_ appName : String) -> ZYDeviceAuthNavBar {
        let v = Bundle.main.loadNibNamed("ZYDeviceAuthNavBar", owner: nil, options: nil)?.last as! ZYDeviceAuthNavBar
        v.appNameL.text = appName
        return v
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        appNameL.textColor = zyColorHex(zyIsDarkModel ? DeviceColor.darkMainText.rawValue : DeviceColor.lightMainText.rawValue)
        descL.textColor = zyColorHex(zyIsDarkModel ? DeviceColor.darkSubText.rawValue : DeviceColor.lightSubText.rawValue)
        backgroundColor = zyColorHex(zyIsDarkModel ? DeviceColor.darkBg.rawValue : DeviceColor.lightBg.rawValue)
        
    }
    
}
