//
//  ZYDeviceAuthCell.swift
//  ZYHammers
//
//  Created by 张宇 on 2021/1/18.
//

import UIKit

class ZYDeviceAuthCell: UITableViewCell {

    public var model : ZYDeviceAuthM? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func updateUI() {
        
    }
    
}
