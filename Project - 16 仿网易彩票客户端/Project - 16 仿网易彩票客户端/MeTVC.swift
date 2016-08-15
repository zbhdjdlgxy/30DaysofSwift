//
//  MeTVC.swift
//  Project - 16 仿网易彩票客户端
//
//  Created by 张标 on 16/8/8.
//  Copyright © 2016年 szgyzb. All rights reserved.
//

import UIKit

class MeTVC: BaseTVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
//    MARK: dataSource
    func setupGroup(){
        
        let item : SettingArrowItem = SettingArrowItem.item("新的好友", icon: "", destVC: NewFriendsTVC.classForCoder())
        let item2 : SettingItem = SettingItem.item("新手任务", icon: "")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2]
        self.data?.append(group)
    }
    
    func setupGroup2(){
        
        let item : SettingItem = SettingItem.item("我的相册", icon: "")
        let item2 : SettingItem = SettingItem.item("我的赞", icon: "")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2]
        self.data?.append(group)
    }
    func setupGroup3(){
        
        let item : SettingItem = SettingItem.item("微博支付", icon: "")
        let item2 : SettingItem = SettingItem.item("微博运动", icon: "")
        let group : SettingGroup = SettingGroup()
        group.items = [item,item2]
        self.data?.append(group)
    }
    func setupGroup4(){
        
        let item : SettingItem = SettingItem.item("草稿箱", icon: "")
        let group : SettingGroup = SettingGroup()
        group.items = [item]
        self.data?.append(group)
    }
}
