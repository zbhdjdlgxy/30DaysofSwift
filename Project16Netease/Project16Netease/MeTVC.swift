//
//  MeTVC.swift
//  Project16Netease
//
//  Created by 张标 on 16/8/8.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class MeTVC: BaseTVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGroup()
        self.setupGroup2()
        self.setupGroup3()
        self.setupGroup4()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "设置", style: .Plain, target: self, action: #selector(self.setup))
    }
    
    func setup() {
        
        let setVc : SetTableViewController = SetTableViewController(style: .Grouped)
        setVc.title = "设置"
        self.navigationController?.pushViewController(setVc, animated: true)
    }
//    MARK: dataSource
    func setupGroup(){
        let item = SettingArrowItem()
        let item2 = SettingItem()
        item.item("新的好友", destVC: NewFriendsTVC.classForCoder(), icon: "new_friend")
        item2.item("新手任务", icon: "card")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2]
        self.data.append(group)
    }
    
    func setupGroup2(){
        
        
        let item = SettingItem()
        let item2 = SettingItem()
        
        item.item("我的相册", icon: "album")
        item2.item("我的收藏", icon: "collect")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2]
        self.data.append(group)
    }
    func setupGroup3(){
        
        
        let item = SettingItem()
        let item2 = SettingItem()
        
        item.item("微博支付", icon: "pay")
        item2.item("会员中心", icon: "vip")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2]
        self.data.append(group)
    }
    func setupGroup4(){
        
        let item = SettingItem()
        item.item("草稿箱", icon: "draft")
        let group : SettingGroup = SettingGroup()
        group.items = [item]
        self.data.append(group)
    }
}
