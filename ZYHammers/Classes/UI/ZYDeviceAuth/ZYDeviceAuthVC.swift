//
//  ZYDeviceAuthVC.swift
//  ZYHammers
//
//  Created by 张宇 on 2020/11/18.
//

import UIKit

public class ZYDeviceAuthVC: UIViewController {

    private var header : ZYDeviceAuthNavBar!
    
    private var tableV : UITableView!
    
    private var config : [[String : Any]] = [
        [
            "icon"  : "",
            "title" : "获取城市信息",
            "type"  : AuthType.location,
            "description" : "申请定位权限，获取您的所在城市信息，具体经纬度我们不会做任何保存"
        ],
        [
            "icon"  : "",
            "title" : "开启消息推送",
            "type" : AuthType.notification,
            "description" : "我们不会为您推送广告以及无关垃圾消息，仅仅为您提供其他用户为您发来的消息"
        ],
        [
            "icon"  : "",
            "title" : "开启麦克风",
            "type" : AuthType.micphone,
            "description" : "在您发送语音消息或者在视频通话过程中，我们需要您提前授权麦克风权限"
        ],
        [
            "icon"  : "",
            "title" : "选择相册照片",
            "type" : AuthType.album,
            "description" : "在您想要发送一张照片消息或者发布一条动态消息的时候，我们需要您提前授权相册权限"
        ],
        [
            "icon"  : "",
            "title" : "开启摄像头",
            "type" : AuthType.camera,
            "description" : "在视频通话中，我们需要通过摄像头来采集您的的画面信息"
        ]
    ]
    
    private var dataSource = [ZYDeviceAuthM]()
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        parseConfigData()
        initUI()
    }

    private func parseConfigData() {
        for i in 0 ..< config.count {
            let dict = config[i]
            let model = ZYDeviceAuthM(type: dict["type"] as! AuthType, title: dict["title"] as! String, description: dict["description"] as! String, icon: dict["icon"] as! String)
            dataSource.append(model)
        }
    }
    
    private func initUI() {
        view.backgroundColor = zyColorHex(zyIsDarkModel ? DeviceColor.darkBg.rawValue : DeviceColor.lightBg.rawValue)
        initNavBar()
        initTableV()
    }
    
    private func initNavBar() {
        header = ZYDeviceAuthNavBar.create(DeviceAppName)
        header.frame = CGRect(x: 0, y: 0, width: zyScreenW, height: zyNavBarH)
    }
    
    private func initTableV() {
        tableV = UITableView(frame: CGRect(x: 0, y: 0, width: zyScreenW, height: zyScreenH), style: .plain)
        tableV.backgroundColor = zyColorHex(zyIsDarkModel ? DeviceColor.darkBg.rawValue : DeviceColor.lightBg.rawValue)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.register(UINib(nibName: "ZYDeviceAuthCell", bundle: nil), forCellReuseIdentifier: "ZYDeviceAuthCell")
        view.addSubview(tableV)
    }
    
}

// MARK: - table 代理数据源
extension ZYDeviceAuthVC : UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZYDeviceAuthCell") as! ZYDeviceAuthCell
        cell.model = dataSource[indexPath.row]
        return cell
    }
    
}
