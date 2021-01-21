//
//  ZYDeviceAuthItem.swift
//  ZYHammers
//
//  Created by 张宇 on 2020/11/18.
//

import UIKit

class ZYDeviceAuthItem: UIView {

    private var model : ZYDeviceAuthM? {
        didSet {
            initSubviews()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        
    }
}
